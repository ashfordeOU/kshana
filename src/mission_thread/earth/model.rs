// SPDX-License-Identifier: AGPL-3.0-only
//! Reading a phase kind's own `[phase.model]` table: required and optional numbers, tables of
//! numbers, and refusal of keys the phase does not know.

/// A phase's model table with its kind's name for error messages.
pub struct Model<'a> {
    table: &'a toml::Table,
    kind: &'static str,
}

impl<'a> Model<'a> {
    /// Wraps a table.
    pub fn new(kind: &'static str, table: &'a toml::Table) -> Self {
        Model { table, kind }
    }

    /// Refuses any key not in `allowed`, naming the allowed ones.
    pub fn only(&self, allowed: &[&str]) -> Result<(), String> {
        for k in self.table.keys() {
            if !allowed.contains(&k.as_str()) {
                return Err(format!(
                    "{}: unknown model key `{k}`; the keys are {}",
                    self.kind,
                    allowed.join(", ")
                ));
            }
        }
        Ok(())
    }

    fn raw(&self, key: &str) -> Option<f64> {
        self.table
            .get(key)
            .and_then(|v| v.as_float().or_else(|| v.as_integer().map(|i| i as f64)))
    }

    /// A required finite number.
    pub fn num(&self, key: &str) -> Result<f64, String> {
        match self.table.get(key) {
            None => Err(format!("{}: the model needs `{key}`", self.kind)),
            Some(_) => match self.raw(key) {
                Some(v) if v.is_finite() => Ok(v),
                _ => Err(format!("{}: `{key}` must be a finite number", self.kind)),
            },
        }
    }

    /// A required finite number above zero.
    pub fn pos(&self, key: &str) -> Result<f64, String> {
        let v = self.num(key)?;
        if v > 0.0 {
            Ok(v)
        } else {
            Err(format!("{}: `{key}` must be above 0, got {v}", self.kind))
        }
    }

    /// A required finite number of at least zero.
    pub fn nonneg(&self, key: &str) -> Result<f64, String> {
        let v = self.num(key)?;
        if v >= 0.0 {
            Ok(v)
        } else {
            Err(format!(
                "{}: `{key}` must be at least 0, got {v}",
                self.kind
            ))
        }
    }

    /// An optional finite number, `default` when absent.
    pub fn num_or(&self, key: &str, default: f64) -> Result<f64, String> {
        if self.table.contains_key(key) {
            self.num(key)
        } else {
            Ok(default)
        }
    }

    /// An optional string.
    pub fn text(&self, key: &str) -> Result<Option<&str>, String> {
        match self.table.get(key) {
            None => Ok(None),
            Some(v) => v
                .as_str()
                .map(Some)
                .ok_or_else(|| format!("{}: `{key}` must be a string", self.kind)),
        }
    }

    /// An optional array of tables (`[[phase.model.key]]`), empty when absent.
    pub fn tables(&self, key: &str) -> Result<Vec<Model<'a>>, String> {
        match self.table.get(key) {
            None => Ok(Vec::new()),
            Some(v) => {
                let arr = v
                    .as_array()
                    .ok_or_else(|| format!("{}: `{key}` must be an array of tables", self.kind))?;
                arr.iter()
                    .map(|t| {
                        t.as_table()
                            .map(|t| Model::new(self.kind, t))
                            .ok_or_else(|| format!("{}: `{key}` must hold tables", self.kind))
                    })
                    .collect()
            }
        }
    }

    /// An optional list of three or six finite numbers is not needed yet; a required array of
    /// `n` numbers.
    pub fn array(&self, key: &str, n: usize) -> Result<Vec<f64>, String> {
        let v = self
            .table
            .get(key)
            .ok_or_else(|| format!("{}: the model needs `{key}`", self.kind))?;
        let a = v
            .as_array()
            .ok_or_else(|| format!("{}: `{key}` must be an array of {n} numbers", self.kind))?;
        if a.len() != n {
            return Err(format!(
                "{}: `{key}` must hold {n} numbers, got {}",
                self.kind,
                a.len()
            ));
        }
        a.iter()
            .map(|x| {
                x.as_float()
                    .or_else(|| x.as_integer().map(|i| i as f64))
                    .filter(|f| f.is_finite())
                    .ok_or_else(|| format!("{}: `{key}` must hold finite numbers", self.kind))
            })
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn table(src: &str) -> toml::Table {
        toml::from_str(src).unwrap()
    }

    #[test]
    fn numbers_integers_and_defaults_read_and_errors_name_the_key() {
        let t =
            table("a = 2.5\nb = 3\nc = -1.0\nd = \"x\"\ne = [1, 2.5]\n[[legs]]\nrange_m = 10\n");
        let m = Model::new("kind-x", &t);
        assert_eq!(m.num("a").unwrap(), 2.5);
        assert_eq!(m.num("b").unwrap(), 3.0);
        assert_eq!(m.num_or("zz", 7.0).unwrap(), 7.0);
        assert!(m.num("zz").unwrap_err().contains("needs `zz`"));
        assert!(m.pos("c").unwrap_err().contains("above 0"));
        assert!(m.nonneg("c").unwrap_err().contains("at least 0"));
        assert!(m.num("d").unwrap_err().contains("finite number"));
        assert_eq!(m.array("e", 2).unwrap(), vec![1.0, 2.5]);
        assert!(m.array("e", 3).unwrap_err().contains("3 numbers"));
        assert_eq!(m.tables("legs").unwrap()[0].num("range_m").unwrap(), 10.0);
        assert!(m.tables("a").is_err());
        assert!(m.only(&["a", "b", "c", "d", "e", "legs"]).is_ok());
        let e = m.only(&["a"]).unwrap_err();
        assert!(
            e.contains("kind-x") && e.contains("unknown model key"),
            "{e}"
        );
    }
}
