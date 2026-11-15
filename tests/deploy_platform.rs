// SPDX-License-Identifier: AGPL-3.0-only
//! Deploy anywhere (roadmap 0.42 I10): the Station's Helm chart, Terraform module and edge image are
//! checked here without Helm, Terraform or Docker (CI's `deploy-kits` job runs `helm lint`, `helm
//! template`, `terraform fmt` and `terraform validate`; `deploy-kits-e2e.yml` installs the chart on
//! kind and runs the edge image):
//!
//! * the bundled Station configuration is one file in two places, passes `kshana station check`'s
//!   rules, and points at the paths the chart and the module mount;
//! * every value a chart template reads is declared in values.yaml, and every Terraform variable is
//!   declared and used;
//! * the chart, the module and the image keep the same security defaults and paths, and name the
//!   engine's version.

use std::collections::BTreeSet;
use std::path::Path;

const CHART: &str = "deploy/helm/kshana-station";
const TF: &str = "deploy/terraform/kshana-station";

fn read(p: &str) -> String {
    std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join(p))
        .unwrap_or_else(|e| panic!("{p}: {e}"))
}

fn templates() -> Vec<(String, String)> {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR"))
        .join(CHART)
        .join("templates");
    let mut out: Vec<(String, String)> = std::fs::read_dir(dir)
        .unwrap()
        .flatten()
        .map(|e| {
            let p = e.path();
            (
                p.file_name().unwrap().to_string_lossy().to_string(),
                std::fs::read_to_string(&p).unwrap(),
            )
        })
        .collect();
    out.sort();
    out
}

#[test]
fn the_bundled_station_configuration_is_valid_and_matches_the_mounts() {
    let chart_cfg = read(&format!("{CHART}/files/station.toml"));
    assert_eq!(
        chart_cfg,
        read(&format!("{TF}/files/station.toml")),
        "the chart and the module must bundle the same station.toml"
    );
    let c: kshana::station::Config = toml::from_str(&chart_cfg).unwrap();
    kshana::station::check(&c)
        .expect("kshana station check would refuse the bundled configuration");
    assert_eq!(c.http.listen, "0.0.0.0:8470");
    assert_eq!(
        c.http.token_file.as_deref(),
        Some(Path::new("/etc/kshana-station/token/token"))
    );
    assert!(c.output.dir.starts_with("/var/lib/kshana-station"));
    for f in [
        format!("{CHART}/templates/deployment.yaml"),
        format!("{TF}/main.tf"),
    ] {
        let t = read(&f);
        for path in [
            "/etc/kshana-station/token",
            "/etc/kshana-station/config",
            "/var/lib/kshana-station",
            "/etc/kshana-station/config/station.toml",
        ] {
            assert!(t.contains(path), "{f} does not mount or use {path}");
        }
        assert!(t.contains("8470"), "{f}: the status port");
        assert!(
            t.contains("\"station\", \"run\""),
            "{f}: kshana station run"
        );
        assert!(
            t.contains("\"station\", \"check\""),
            "{f}: the check before start"
        );
        assert!(
            t.contains("/health"),
            "{f}: probes on /health (no token needed)"
        );
    }
}

/// The dotted key paths of a simple YAML mapping (two-space indents, no flow mappings at depth).
fn yaml_paths(text: &str) -> BTreeSet<String> {
    let mut stack: Vec<(usize, String)> = Vec::new();
    let mut out = BTreeSet::new();
    for line in text.lines() {
        let t = line.trim_start();
        if t.is_empty() || t.starts_with('#') || t.starts_with('-') {
            continue;
        }
        let Some((key, _)) = t.split_once(':') else {
            continue;
        };
        let indent = line.len() - t.len();
        while stack.last().is_some_and(|(i, _)| *i >= indent) {
            stack.pop();
        }
        stack.push((indent, key.trim().to_string()));
        out.insert(
            stack
                .iter()
                .map(|(_, k)| k.as_str())
                .collect::<Vec<_>>()
                .join("."),
        );
    }
    out
}

#[test]
fn every_value_the_chart_reads_is_declared() {
    let declared = yaml_paths(&read(&format!("{CHART}/values.yaml")));
    let mut used = BTreeSet::new();
    for (name, t) in templates() {
        for (i, _) in t.match_indices(".Values.") {
            let rest = &t[i + ".Values.".len()..];
            let end = rest
                .find(|c: char| !(c.is_ascii_alphanumeric() || c == '.' || c == '_'))
                .unwrap_or(rest.len());
            let path = rest[..end].trim_end_matches('.').to_string();
            assert!(
                declared.contains(&path),
                "templates/{name} reads .Values.{path}, which values.yaml does not declare"
            );
            used.insert(path);
        }
    }
    for top in [
        "image.repository",
        "station",
        "existingStationConfigMap",
        "token.existingSecret",
        "persistence.enabled",
    ] {
        assert!(used.contains(top), "no template reads .Values.{top}");
    }
    let chart = read(&format!("{CHART}/Chart.yaml"));
    assert!(chart.contains(&format!("appVersion: \"{}\"", env!("CARGO_PKG_VERSION"))));
    assert!(chart.contains("license: AGPL-3.0-only"));
}

#[test]
fn every_terraform_variable_is_declared_and_used() {
    let vars = read(&format!("{TF}/variables.tf"));
    let declared: BTreeSet<String> = vars
        .match_indices("variable \"")
        .map(|(i, m)| {
            let r = &vars[i + m.len()..];
            r[..r.find('"').unwrap()].to_string()
        })
        .collect();
    let mut code = read(&format!("{TF}/main.tf"));
    code.push_str(&read(&format!("{TF}/outputs.tf")));
    let used: BTreeSet<String> = code
        .match_indices("var.")
        .map(|(i, m)| {
            let r = &code[i + m.len()..];
            let end = r
                .find(|c: char| !(c.is_ascii_alphanumeric() || c == '_'))
                .unwrap_or(r.len());
            r[..end].to_string()
        })
        .collect();
    assert_eq!(declared, used, "variables declared and used differ");
    assert!(vars.contains(&format!(
        "kshana-reference-build:{}\"",
        env!("CARGO_PKG_VERSION")
    )));
    // The token is marked sensitive.
    let token = vars.split("variable \"token\"").nth(1).unwrap();
    assert!(token[..token.find("\n}").unwrap()].contains("sensitive   = true"));
}

#[test]
fn the_chart_module_and_image_keep_the_security_defaults() {
    let values = read(&format!("{CHART}/values.yaml"));
    for k in [
        "runAsNonRoot: true",
        "runAsUser: 10001",
        "allowPrivilegeEscalation: false",
        "readOnlyRootFilesystem: true",
        "drop: [\"ALL\"]",
        "type: RuntimeDefault",
    ] {
        assert!(values.contains(k), "values.yaml lost {k}");
    }
    let tf = read(&format!("{TF}/main.tf"));
    for k in [
        "run_as_non_root = true",
        "allow_privilege_escalation = false",
        "read_only_root_filesystem  = true",
        "drop = [\"ALL\"]",
        "type = \"RuntimeDefault\"",
    ] {
        assert!(tf.contains(k), "main.tf lost {k}");
    }
    // One replica: a second would read the same receivers into the same files.
    assert!(read(&format!("{CHART}/templates/deployment.yaml")).contains("replicas: 1"));
    assert!(tf.contains("replicas = 1"));

    let edge = read("deploy/edge/Dockerfile");
    let reference = read("deploy/reference-build/Dockerfile");
    let digests = |s: &str| -> Vec<String> {
        s.lines()
            .filter(|l| l.starts_with("FROM "))
            .filter_map(|l| l.split('@').nth(1))
            .map(|d| d.split_whitespace().next().unwrap().to_string())
            .collect()
    };
    assert_eq!(
        digests(&edge),
        digests(&reference),
        "the edge image uses the reference image's pinned bases"
    );
    assert!(edge.contains(&format!(
        "org.opencontainers.image.version=\"{}\"",
        env!("CARGO_PKG_VERSION")
    )));
    for k in [
        "USER 10001:10001",
        "EXPOSE 8470",
        "/etc/kshana-station/station.toml",
        "--platform=$BUILDPLATFORM",
        "aarch64-unknown-linux-gnu",
    ] {
        assert!(edge.contains(k), "deploy/edge/Dockerfile lost {k}");
    }
}
