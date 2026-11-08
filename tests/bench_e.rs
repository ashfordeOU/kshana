// SPDX-License-Identifier: AGPL-3.0-only
//! B4a bar E1: the task (e) scorer against the independent numpy scorer (`xval/bench-e/oracle.py`)
//! on the synthetic files of `xval/bench-e/make_e1.py` (README reading 15). Confusion counts must be
//! equal; balanced accuracy, macro-F1 and every AUC within 1e-12.

use std::io::Read;

use flate2::read::GzDecoder;
use kshana::bench::task_e::score_e;
use serde_json::Value;

const DIR: &str = "tests/fixtures/bench_e";
const TOL: f64 = 1e-12;

fn gz(name: &str) -> Value {
    let mut s = String::new();
    GzDecoder::new(std::fs::File::open(format!("{DIR}/{name}")).expect("fixture"))
        .read_to_string(&mut s)
        .expect("gzip");
    serde_json::from_str(&s).expect("json")
}

fn plain(name: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("{DIR}/{name}")).expect("fixture"))
        .expect("json")
}

fn close(a: &Value, b: &Value, what: &str) {
    match (a.as_f64(), b.as_f64()) {
        (Some(x), Some(y)) => assert!((x - y).abs() <= TOL, "{what}: engine {x} oracle {y}"),
        _ => assert_eq!(a, b, "{what}: one side undefined"),
    }
}

fn check(tag: &str) {
    let truth = gz(&format!("{tag}_truth.json.gz"));
    let preds = gz(&format!("{tag}_predictions.json.gz"));
    let want = plain(&format!("{tag}_oracle.json"));
    let (got, _) = score_e(&truth, &preds).expect("score");
    assert_eq!(
        got["confusion"], want["confusion"],
        "{tag}: confusion counts"
    );
    assert_eq!(got["present"], want["present"], "{tag}: present classes");
    assert_eq!(got["entered"], want["entered"], "{tag}: entered classes");
    for k in [
        "balanced_accuracy",
        "macro_f1",
        "balanced_accuracy_descriptive",
        "macro_f1_descriptive",
        "jamming_labelled_spoofing_or_meaconing",
        "spoofing_meaconing_labelled_jamming",
    ] {
        close(&got[k], &want[k], &format!("{tag}: {k}"));
    }
    for c in ["nominal", "jamming", "spoofing", "meaconing"] {
        close(&got["auc"][c], &want["auc"][c], &format!("{tag}: auc {c}"));
        close(
            &got["recall"][c],
            &want["recall"][c],
            &format!("{tag}: recall {c}"),
        );
        close(
            &got["precision"][c],
            &want["precision"][c],
            &format!("{tag}: precision {c}"),
        );
    }
}

#[test]
fn e1_four_classes_matches_the_numpy_scorer() {
    check("e1");
}

#[test]
fn e1_without_meaconing_matches_the_numpy_scorer() {
    check("e1b");
}

fn gz_path(path: &str) -> String {
    let mut s = String::new();
    GzDecoder::new(std::fs::File::open(path).expect("run file"))
        .read_to_string(&mut s)
        .expect("gzip");
    s
}

/// The scored run of 8 November 2026 (`xval/bench-e/run/`, RESULTS.md): re-scoring the committed
/// truth and B-log predictions of the `test` split gives the recorded metrics, and the bars E3, E4
/// and E6 are missed as recorded (a test that asserts the miss).
#[test]
fn recorded_test_split_run_and_its_misses() {
    let r = "xval/bench-e/run";
    let truth_text = gz_path(&format!("{r}/e-test.truth.json.gz"));
    let preds_text = gz_path(&format!("{r}/e-test-b-log.predictions.json.gz"));
    assert_eq!(
        kshana::bench::sha256_hex(truth_text.as_bytes()),
        "19a066c3eb566854a8a9d7a890a880538d24e566ec35835e59aec3546c5d9165"
    );
    let got: Value =
        serde_json::from_str(&kshana::bench::score(&truth_text, &preds_text, None).expect("score"))
            .expect("json");
    let want = plain_path(&format!("{r}/e-test-b-log.result.json"));
    assert_eq!(got["metrics"], want["metrics"]);
    let m = &got["metrics"];
    // E3 NOT MET: jamming has one folder in `test`, below the two-folder minimum, so it does not
    // enter (README reading 8: a bar that cannot be scored is NOT MET).
    assert_eq!(m["entered"], serde_json::json!(["nominal", "spoofing"]));
    // E4 NOT MET: every spoofing epoch of `test` is labelled jamming (bar <= 0.50).
    assert_eq!(m["confusion"][2], serde_json::json!([0, 2222, 0, 0]));
    // E6 NOT MET: BA over the two entered classes 0.259 against max(0.40, 1.6/2) = 0.80.
    let ba = m["balanced_accuracy"].as_f64().expect("ba");
    assert!((ba - 0.2590782122905028).abs() < 1e-15 && ba < 0.80);
}

fn plain_path(path: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(path).expect("file")).expect("json")
}
