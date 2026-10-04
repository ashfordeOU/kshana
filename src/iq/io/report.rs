// SPDX-License-Identifier: AGPL-3.0-only
//! CSV and JSON writers for per-file results (batch runs, inventories).
//!
//! Any `Serialize` row type is accepted. CSV columns are the row's top-level fields in
//! sorted order (nested values are written as compact JSON in one cell), quoted per
//! RFC 4180 when a cell holds a comma, quote or line break.

use crate::iq::IqError;
use serde::Serialize;
use serde_json::Value;

/// The outcome of processing one input of a batch.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BatchResult<T> {
    /// Position of the input in the batch, from 0.
    pub index: usize,
    /// The input, as text (for example a file path).
    pub input: String,
    /// The closure's result, or its error message (a panic is reported as an error).
    pub outcome: Result<T, String>,
}

fn to_value<T: Serialize>(v: &T) -> Result<Value, IqError> {
    serde_json::to_value(v).map_err(|e| IqError::Format(format!("cannot serialise row: {e}")))
}

fn cell(v: &Value) -> String {
    match v {
        Value::Null => String::new(),
        Value::String(s) => s.clone(),
        Value::Bool(_) | Value::Number(_) => v.to_string(),
        _ => v.to_string(),
    }
}

fn quote(s: &str) -> String {
    if s.contains([',', '"', '\n', '\r']) {
        format!("\"{}\"", s.replace('"', "\"\""))
    } else {
        s.to_string()
    }
}

fn csv_from_objects(rows: &[serde_json::Map<String, Value>], lead: &[&str]) -> String {
    let mut cols: Vec<String> = lead.iter().map(|s| s.to_string()).collect();
    let rest: std::collections::BTreeSet<&String> = rows
        .iter()
        .flat_map(|r| r.keys())
        .filter(|k| !lead.contains(&k.as_str()))
        .collect();
    cols.extend(rest.into_iter().cloned());
    let mut out = cols.iter().map(|c| quote(c)).collect::<Vec<_>>().join(",");
    out.push('\n');
    for r in rows {
        let line = cols
            .iter()
            .map(|c| quote(&r.get(c).map(cell).unwrap_or_default()))
            .collect::<Vec<_>>()
            .join(",");
        out.push_str(&line);
        out.push('\n');
    }
    out
}

/// CSV of serialisable rows, one row each, columns sorted by name. A row that does not
/// serialise to an object fills a single `value` column.
pub fn rows_to_csv<T: Serialize>(rows: &[T]) -> Result<String, IqError> {
    let objs = rows
        .iter()
        .map(|r| {
            Ok(match to_value(r)? {
                Value::Object(m) => m,
                v => {
                    let mut m = serde_json::Map::new();
                    m.insert("value".into(), v);
                    m
                }
            })
        })
        .collect::<Result<Vec<_>, IqError>>()?;
    Ok(csv_from_objects(&objs, &[]))
}

/// Pretty JSON array of serialisable rows.
pub fn rows_to_json<T: Serialize>(rows: &[T]) -> Result<String, IqError> {
    serde_json::to_string_pretty(rows).map_err(|e| IqError::Format(e.to_string()))
}

fn result_object<T: Serialize>(
    r: &BatchResult<T>,
) -> Result<serde_json::Map<String, Value>, IqError> {
    let mut m = serde_json::Map::new();
    m.insert("index".into(), Value::from(r.index));
    m.insert("input".into(), Value::from(r.input.clone()));
    m.insert("ok".into(), Value::from(r.outcome.is_ok()));
    match &r.outcome {
        Ok(v) => {
            m.insert("error".into(), Value::Null);
            match to_value(v)? {
                Value::Object(o) => {
                    for (k, v) in o {
                        m.entry(format!("result.{k}")).or_insert(v);
                    }
                }
                v => {
                    m.insert("result".into(), v);
                }
            }
        }
        Err(e) => {
            m.insert("error".into(), Value::from(e.clone()));
        }
    }
    Ok(m)
}

/// CSV of batch results: `index,input,ok,error` then the result's fields as
/// `result.<field>` (sorted), or one `result` column when the result is not an object.
pub fn results_to_csv<T: Serialize>(results: &[BatchResult<T>]) -> Result<String, IqError> {
    let objs = results
        .iter()
        .map(result_object)
        .collect::<Result<Vec<_>, _>>()?;
    Ok(csv_from_objects(&objs, &["index", "input", "ok", "error"]))
}

/// JSON array of batch results: `{index, input, ok, error, result}` per input.
pub fn results_to_json<T: Serialize>(results: &[BatchResult<T>]) -> Result<String, IqError> {
    let arr = results
        .iter()
        .map(|r| {
            let mut m = serde_json::Map::new();
            m.insert("index".into(), Value::from(r.index));
            m.insert("input".into(), Value::from(r.input.clone()));
            m.insert("ok".into(), Value::from(r.outcome.is_ok()));
            match &r.outcome {
                Ok(v) => {
                    m.insert("error".into(), Value::Null);
                    m.insert("result".into(), to_value(v)?);
                }
                Err(e) => {
                    m.insert("error".into(), Value::from(e.clone()));
                    m.insert("result".into(), Value::Null);
                }
            }
            Ok(Value::Object(m))
        })
        .collect::<Result<Vec<_>, IqError>>()?;
    serde_json::to_string_pretty(&arr).map_err(|e| IqError::Format(e.to_string()))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Serialize)]
    struct Row {
        name: String,
        n: u32,
    }

    #[test]
    fn csv_quotes_per_rfc_4180_and_orders_columns() {
        let rows = vec![
            BatchResult {
                index: 0,
                input: "a,b".into(),
                outcome: Ok(Row {
                    name: "say \"hi\"".into(),
                    n: 3,
                }),
            },
            BatchResult {
                index: 1,
                input: "c".into(),
                outcome: Err("broken".into()),
            },
        ];
        let csv = results_to_csv(&rows).unwrap();
        let lines: Vec<&str> = csv.lines().collect();
        assert_eq!(lines[0], "index,input,ok,error,result.n,result.name");
        assert_eq!(lines[1], "0,\"a,b\",true,,3,\"say \"\"hi\"\"\"");
        assert_eq!(lines[2], "1,c,false,broken,,");
        let json: Value = serde_json::from_str(&results_to_json(&rows).unwrap()).unwrap();
        assert_eq!(json[0]["result"]["n"], 3);
        assert_eq!(json[1]["error"], "broken");
    }
}
