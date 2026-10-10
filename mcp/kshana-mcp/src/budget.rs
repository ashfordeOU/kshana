// SPDX-License-Identifier: AGPL-3.0-only
//! A work budget for scenarios submitted through the MCP surface.
//!
//! The engine will run whatever a scenario asks for, and a tool call is CPU-bound work with
//! no way to stop it half done. Over stdio that is the caller's own machine; over HTTP it is
//! a server other people may reach. Either way an agent should get a clear refusal for a
//! request orders of magnitude beyond the bundled examples, rather than a call that never
//! returns. The command line has no such cap: use `kshana` for a large study.
//!
//! The caps sit well above the largest bundled scenario (checked by a test over every one
//! in `scenarios/`), and each error names the cap and the field to lower.

use rmcp::ErrorData as McpError;

/// Most Monte Carlo realisations one scenario may ask for (the largest bundled ensemble is 200).
pub const MAX_RUNS: i64 = 1_000;
/// Most nodes of a parameter grid (the product of every axis's `steps`).
pub const MAX_GRID_NODES: i64 = 1_000;
/// Most member runs one scenario may imply: grid nodes times realisations.
pub const MAX_MEMBER_RUNS: i64 = 5_000;
/// Most simulated epochs on one time grid (`duration_s / step_s`).
pub const MAX_EPOCHS: f64 = 2_000_000.0;

#[derive(Default)]
struct Tally {
    nodes: i64,
    runs: i64,
    worst_epochs: f64,
}

fn walk(v: &toml::Value, t: &mut Tally, errors: &mut Vec<String>) {
    match v {
        toml::Value::Table(tbl) => {
            if let Some(n) = tbl.get("runs").and_then(toml::Value::as_integer) {
                if n > MAX_RUNS {
                    errors.push(format!(
                        "`runs = {n}` asks for more than {MAX_RUNS} Monte Carlo realisations; lower `runs`"
                    ));
                }
                t.runs = t.runs.max(n.max(1));
            }
            // An axis: a table with a start, a stop and a step count.
            if tbl.contains_key("start")
                && tbl.contains_key("stop")
                && let Some(n) = tbl.get("steps").and_then(toml::Value::as_integer)
            {
                t.nodes = t.nodes.saturating_mul(n.max(1));
            }
            if let (Some(d), Some(s)) = (
                tbl.get("duration_s").and_then(as_f64),
                tbl.get("step_s").and_then(as_f64),
            ) && s > 0.0
                && d / s > t.worst_epochs
            {
                t.worst_epochs = d / s;
            }
            for child in tbl.values() {
                walk(child, t, errors);
            }
        }
        toml::Value::Array(items) => {
            for item in items {
                walk(item, t, errors);
            }
        }
        _ => {}
    }
}

fn as_f64(v: &toml::Value) -> Option<f64> {
    v.as_float().or_else(|| v.as_integer().map(|i| i as f64))
}

/// Check a scenario's TOML against the work budget. Text that does not parse as TOML passes
/// through: the engine reports its own syntax error.
pub fn check(text: &str) -> Result<(), String> {
    let Ok(doc) = text.parse::<toml::Table>() else {
        return Ok(());
    };
    let mut t = Tally {
        nodes: 1,
        ..Tally::default()
    };
    let mut errors = Vec::new();
    walk(&toml::Value::Table(doc), &mut t, &mut errors);
    if t.nodes > MAX_GRID_NODES {
        errors.push(format!(
            "the parameter grid has {} nodes, over the {MAX_GRID_NODES} cap; lower an axis's `steps`",
            t.nodes
        ));
    }
    if t.worst_epochs > MAX_EPOCHS {
        errors.push(format!(
            "a time grid has {:.0} epochs, over the {MAX_EPOCHS:.0} cap; raise `step_s` or lower `duration_s`",
            t.worst_epochs
        ));
    }
    let members = t.nodes.saturating_mul(t.runs.max(1));
    if members > MAX_MEMBER_RUNS {
        errors.push(format!(
            "the scenario implies {members} member runs (grid nodes times realisations), over the \
             {MAX_MEMBER_RUNS} cap"
        ));
    }
    if errors.is_empty() {
        Ok(())
    } else {
        Err(format!(
            "work budget exceeded for a call through the MCP server: {}. Run large studies with the \
             `kshana` command line.",
            errors.join("; ")
        ))
    }
}

/// [`check`] as a tool error.
pub fn check_tool(text: &str) -> Result<(), McpError> {
    check(text).map_err(|e| McpError::invalid_params(e, None))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_monte_carlo_run_count_over_the_cap_is_refused_with_the_field_named() {
        let e = check("kind = \"campaign\"\n[monte_carlo]\nruns = 20000\n").unwrap_err();
        assert!(e.contains("runs = 20000") && e.contains("1000"), "{e}");
        assert!(check("[monte_carlo]\nruns = 200\n").is_ok());
    }

    #[test]
    fn a_grid_over_the_cap_is_refused() {
        let t = "[[sweep.axes]]\nstart=0.0\nstop=1.0\nsteps=100\n[[sweep.axes]]\nstart=0.0\nstop=1.0\nsteps=100\n";
        assert!(check(t).unwrap_err().contains("nodes"));
    }

    #[test]
    fn grid_times_realisations_is_capped() {
        let t = "[[sweep.axes]]\nstart=0.0\nstop=1.0\nsteps=100\n[monte_carlo]\nruns=100\n";
        assert!(check(t).unwrap_err().contains("member runs"));
    }

    #[test]
    fn an_absurd_time_grid_is_refused() {
        let t = "[time]\nstep_s = 0.001\nduration_s = 100000.0\n";
        assert!(check(t).unwrap_err().contains("epochs"));
    }

    #[test]
    fn text_that_is_not_toml_passes_to_the_engine() {
        assert!(check("not = [toml").is_ok());
    }

    #[test]
    fn every_bundled_scenario_is_inside_the_budget() {
        let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../../scenarios");
        let mut n = 0;
        for entry in std::fs::read_dir(&dir).unwrap() {
            let p = entry.unwrap().path();
            if p.extension().is_some_and(|e| e == "toml") {
                let text = std::fs::read_to_string(&p).unwrap();
                assert!(check(&text).is_ok(), "{}: {:?}", p.display(), check(&text));
                n += 1;
            }
        }
        assert!(n > 50, "found {n} scenarios");
    }
}
