// SPDX-License-Identifier: AGPL-3.0-only
//! Deployment kits (A6): the copies the Compose stack and the Helm chart carry stay equal to their
//! sources, and the kits keep their safety defaults. CI's `deploy-kits` job runs Compose and Helm
//! themselves; this test needs neither.

use std::path::Path;

fn read(p: &str) -> String {
    std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join(p)).unwrap()
}

/// The sample dashboard with its import placeholder bound to the provisioned data source.
fn provisioned_dashboard() -> serde_json::Value {
    let src = read("deploy/grafana/kshana-gnss-trust.json")
        .replace("${DS_PROMETHEUS}", "kshana-prometheus");
    let mut d: serde_json::Value = serde_json::from_str(&src).unwrap();
    d.as_object_mut().unwrap().remove("__inputs");
    d
}

#[test]
fn copied_files_equal_their_sources() {
    let want = provisioned_dashboard();
    for copy in [
        "deploy/stack/grafana/dashboards/kshana-gnss-trust.json",
        "deploy/helm/kshana/files/kshana-gnss-trust.json",
    ] {
        let got: serde_json::Value = serde_json::from_str(&read(copy)).unwrap();
        assert_eq!(
            got, want,
            "{copy} differs from deploy/grafana/kshana-gnss-trust.json"
        );
        assert!(!read(copy).contains("${DS_PROMETHEUS}"));
    }
    let ds = read("deploy/stack/grafana/provisioning/datasources/prometheus.yml");
    assert!(ds.contains("uid: kshana-prometheus"));
    let session = read("examples/maritime-trust/session.toml");
    assert_eq!(read("deploy/helm/kshana/files/session.toml"), session);
    assert_eq!(read("deploy/stack/session.example.toml"), session);
    assert_eq!(
        read("deploy/stack/station.example.toml"),
        read("examples/obs/station.toml")
    );
    assert_eq!(
        read("deploy/stack/connect.example.toml"),
        read("examples/connect/timing-monitor.connect.toml")
    );
}

#[test]
fn kits_keep_their_safety_defaults() {
    let compose = read("deploy/stack/compose.yml");
    // Every published port is on the host's loopback.
    for l in compose
        .lines()
        .filter(|l| l.trim_start().starts_with("- \"") && l.contains(':'))
    {
        if l.contains("127.0.0.1:") || !l.chars().any(|c| c.is_ascii_digit()) {
            continue;
        }
        panic!("a published port not bound to loopback: {l}");
    }
    assert!(compose.contains("GF_AUTH_ANONYMOUS_ENABLED: \"false\""));
    assert!(compose.contains("GRAFANA_ADMIN_PASSWORD:?"));
    let values = read("deploy/helm/kshana/values.yaml");
    for k in [
        "runAsNonRoot: true",
        "runAsUser: 10001",
        "allowPrivilegeEscalation: false",
        "readOnlyRootFilesystem: true",
    ] {
        assert!(values.contains(k), "values.yaml lost {k}");
    }
    // The image's user is the numeric one the chart runs as.
    assert!(read("deploy/reference-build/Dockerfile").contains("USER 10001:10001"));
    let dep = read("deploy/helm/kshana/templates/deployment.yaml");
    assert!(dep.contains("replicas: 1"), "one monitor per receiver");
    assert!(dep.contains("required"), "the input is required");
}
