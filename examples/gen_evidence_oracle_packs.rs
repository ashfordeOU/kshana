// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the inputs of the clean-room verifier comparison: `tests/fixtures/evidence_pack_oracle/`
//! (`packs/`, `attacks/`, `log/`, `cases.json`). Everything is synthetic and deterministic:
//! throw-away test seeds, a made-up log, made-up epochs. It writes no oracle output; that is
//! `scripts/gen_evidence_pack_ref.py`'s job.
//!
//! Run: `cargo run --example gen_evidence_oracle_packs`

use kshana::evidence::bundle::{chain_link, chain_start, sha256_hex};
use kshana::evidence::{create_bundle, public_key_hex, EvidenceInput, Files, Manifest, Window};
use serde_json::{json, Value};
use sha2::{Digest, Sha256, Sha384};
use std::path::{Path, PathBuf};

const SEED_STATIC: [u8; 32] = [0x41; 32];
const SEED_WHOLE: [u8; 32] = [0x42; 32];
const SEED_ATTACKER: [u8; 32] = [0x43; 32];
const SEED_OTHER: [u8; 32] = [0x44; 32];

fn enc(tag: u8, content: &[u8]) -> Vec<u8> {
    let mut o = vec![tag];
    if content.len() < 0x80 {
        o.push(content.len() as u8);
    } else {
        o.extend([0x82, (content.len() >> 8) as u8, content.len() as u8]);
    }
    o.extend(content);
    o
}

const OID_SHA256: [u8; 9] = [0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01];
const OID_SHA384: [u8; 9] = [0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02];
const OID_SIGNED_DATA: [u8; 9] = [0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x07, 0x02];
const OID_TST_INFO: [u8; 11] = [
    0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x10, 0x01, 0x04,
];

/// A synthetic, unsigned RFC 3161 `TimeStampResp` (not any authority's output).
fn token(
    alg: &[u8],
    digest: &[u8],
    gen_time: &str,
    signed_data_oid: &[u8],
    tst_oid: &[u8],
) -> Vec<u8> {
    let alg_id = enc(0x30, &enc(0x06, alg));
    let imprint = enc(0x30, &[alg_id, enc(0x04, digest)].concat());
    let tst = enc(
        0x30,
        &[
            enc(0x02, &[1]),
            enc(0x06, &[0x2a, 0x03]),
            imprint,
            enc(0x02, &[7]),
            enc(0x18, gen_time.as_bytes()),
        ]
        .concat(),
    );
    let encap = enc(
        0x30,
        &[enc(0x06, tst_oid), enc(0xA0, &enc(0x04, &tst))].concat(),
    );
    let signed = enc(0x30, &[enc(0x02, &[3]), enc(0x31, &[]), encap].concat());
    let ci = [enc(0x06, signed_data_oid), enc(0xA0, &signed)].concat();
    enc(
        0x30,
        &[enc(0x30, &enc(0x02, &[0])), enc(0x30, &ci)].concat(),
    )
}

fn log_bytes(tweak: bool) -> Vec<u8> {
    let mut b: Vec<u8> = (0..220)
        .flat_map(|i| format!("synthetic,epoch,{i},{}\r\n", (i * 37) % 1000).into_bytes())
        .collect();
    if tweak {
        b[1234] ^= 1;
    }
    b
}

fn epochs() -> Vec<Value> {
    (0..60)
        .map(|i| {
            let degraded = i >= 40;
            json!({"t_s": i as f64, "state": if degraded {"degraded"} else {"nominal"},
                   "alarms": if degraded {vec!["cn0-drop"]} else {vec![]}, "n_sats": 8})
        })
        .collect()
}

fn pack(seed: &[u8; 32], slice: Option<(usize, usize)>, title: &str) -> Files {
    let log = log_bytes(false);
    let input = EvidenceInput {
        title,
        engine_version: "0.0.0-oracle",
        log_format: "nmea",
        log_file_name: "synthetic.log",
        log_bytes: &log,
        start_label: Some("2026-01-02T03:04:05Z"),
        slice,
        window: Window {
            from_s: 0.0,
            to_s: 59.0,
        },
        config: json!({"monitors": {"cn0_drop_db": 6.0, "sats_lost": 4}, "note": "synthetic"}),
        epochs: epochs(),
        created_utc: Some("2026-01-02T03:04:05Z"),
    };
    create_bundle(&input, seed, None).unwrap()
}

fn write_pack(root: &Path, rel: &str, files: &Files) {
    let d = root.join(rel);
    std::fs::create_dir_all(&d).unwrap();
    for (n, b) in files {
        std::fs::write(d.join(n), b).unwrap();
    }
}

fn write(root: &Path, rel: &str, b: &[u8]) {
    let p = root.join(rel);
    std::fs::create_dir_all(p.parent().unwrap()).unwrap();
    std::fs::write(p, b).unwrap();
}

fn pretty(m: &Value) -> Vec<u8> {
    let mut v = serde_json::to_vec_pretty(m).unwrap();
    v.push(b'\n');
    v
}

/// Recompute every artifact hash and the chain inside a manifest (an attacker without the key).
fn rehash(m: &mut Manifest, files: &Files) {
    let mut prev = chain_start();
    for a in &mut m.artifacts {
        let b = &files[&a.name];
        a.bytes = b.len() as u64;
        let d: [u8; 32] = Sha256::digest(b).into();
        a.sha256 = hex::encode(d);
        prev = chain_link(&prev, &a.name, &d);
        a.link = hex::encode(prev);
    }
    m.chain_head = hex::encode(prev);
}

fn pos(manifest: &[u8], needle: &str) -> usize {
    let t = String::from_utf8_lossy(manifest);
    t.find(needle)
        .unwrap_or_else(|| panic!("{needle} not in manifest"))
}

fn flip(file: &str, offset: usize, bit: u8) -> Value {
    json!({"op":"flip","file":file,"offset":offset,"bit":bit})
}

fn main() {
    let root: PathBuf =
        Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/evidence_pack_oracle");
    let _ = std::fs::remove_dir_all(&root);

    let stat = pack(&SEED_STATIC, Some((400, 3000)), "Static pack");
    let whole = pack(&SEED_WHOLE, None, "Whole-log pack");
    let forged = pack(&SEED_ATTACKER, Some((400, 3000)), "Static pack");
    let manifest = stat["manifest.json"].clone();
    let mut stamped = stat.clone();
    stamped.insert(
        "timestamp.tsr".into(),
        token(
            &OID_SHA256,
            &Sha256::digest(&manifest),
            "20260102030405Z",
            &OID_SIGNED_DATA,
            &OID_TST_INFO,
        ),
    );
    write_pack(&root, "packs/static", &stat);
    write_pack(&root, "packs/whole", &whole);
    write_pack(&root, "packs/stamped", &stamped);
    write(&root, "log/synthetic.log", &log_bytes(false));
    write(&root, "log/synthetic_modified.log", &log_bytes(true));

    // ---- attack inputs ------------------------------------------------------------------
    let m0: Manifest = serde_json::from_slice(&manifest).unwrap();
    let mval: Value = serde_json::from_slice(&manifest).unwrap();

    let mut edited_epochs = stat["epochs.json"].clone();
    edited_epochs.extend_from_slice(b" ");
    write(&root, "attacks/epochs_edited.json", &edited_epochs);
    let mut files = stat.clone();
    files.insert("epochs.json".into(), edited_epochs);
    let mut m = m0.clone();
    rehash(&mut m, &files);
    write(
        &root,
        "attacks/rehash_manifest.json",
        &pretty(&serde_json::to_value(&m).unwrap()),
    );

    let mut m = m0.clone();
    m.artifacts.swap(1, 2);
    write(
        &root,
        "attacks/reordered_manifest.json",
        &pretty(&serde_json::to_value(&m).unwrap()),
    );

    let mut m = m0.clone();
    m.artifacts[1].link = "0".repeat(64);
    m.chain_head = "1".repeat(64);
    write(
        &root,
        "attacks/chain_wrong_manifest.json",
        &pretty(&serde_json::to_value(&m).unwrap()),
    );

    let mut v = mval.clone();
    v["log"].as_object_mut().unwrap().remove("slice");
    write(&root, "attacks/missing_slice_manifest.json", &pretty(&v));

    let mut v = mval.clone();
    v["log"]["slice"]["kind"] = json!("other");
    write(&root, "attacks/bad_kind_manifest.json", &pretty(&v));

    let mut v = mval.clone();
    v["format"] = json!("kshana-evidence/2");
    write(&root, "attacks/format2_manifest.json", &pretty(&v));

    let mut v = mval.clone();
    let up = v["signer"]["public_key"].as_str().unwrap().to_uppercase();
    v["signer"]["public_key"] = json!(up);
    write(&root, "attacks/uppercase_key_manifest.json", &pretty(&v));

    let mut v = mval.clone();
    v["log"]["slice"]["end"] = json!(m0.log.slice.end + 1);
    write(&root, "attacks/slice_end_manifest.json", &pretty(&v));

    let mut v = mval.clone();
    v["epochs_in_window"] = json!(59);
    write(&root, "attacks/epoch_count_manifest.json", &pretty(&v));

    let mut v = mval.clone();
    v["artifacts"][0]["bytes"] = json!(-1);
    write(&root, "attacks/negative_bytes_manifest.json", &pretty(&v));

    write(
        &root,
        "attacks/forged_manifest.json",
        &forged["manifest.json"],
    );
    write(&root, "attacks/forged_sig.txt", &forged["manifest.sig"]);
    // The summary page names the signer, so a coherent re-signed pack carries it too.
    write(
        &root,
        "attacks/forged_summary.html",
        &forged["summary.html"],
    );

    let d256 = Sha256::digest(&manifest);
    write(
        &root,
        "attacks/token_other.tsr",
        &token(
            &OID_SHA256,
            &Sha256::digest(b"another document"),
            "20260102030405Z",
            &OID_SIGNED_DATA,
            &OID_TST_INFO,
        ),
    );
    write(
        &root,
        "attacks/token_junk.bin",
        b"this is not a timestamp token",
    );
    write(
        &root,
        "attacks/token_sha384.tsr",
        &token(
            &OID_SHA384,
            &Sha384::digest(&manifest),
            "20260102030405.5Z",
            &OID_SIGNED_DATA,
            &OID_TST_INFO,
        ),
    );
    write(
        &root,
        "attacks/token_bad_gentime.tsr",
        &token(
            &OID_SHA256,
            &d256,
            "20261302030405Z",
            &OID_SIGNED_DATA,
            &OID_TST_INFO,
        ),
    );
    write(
        &root,
        "attacks/token_short_imprint.tsr",
        &token(
            &OID_SHA256,
            &d256[..20],
            "20260102030405Z",
            &OID_SIGNED_DATA,
            &OID_TST_INFO,
        ),
    );
    let mut bad_oid = OID_SIGNED_DATA;
    bad_oid[8] = 0x03;
    write(
        &root,
        "attacks/token_bad_oid.tsr",
        &token(
            &OID_SHA256,
            &d256,
            "20260102030405Z",
            &bad_oid,
            &OID_TST_INFO,
        ),
    );

    // ---- cases --------------------------------------------------------------------------
    let mut cases: Vec<Value> = Vec::new();
    let mut add = |id: &str,
                   pack: &str,
                   ops: Vec<Value>,
                   pin: Value,
                   full_log: Value,
                   require_ts: bool,
                   expect: &str| {
        cases.push(json!({"id": id, "pack": pack, "ops": ops, "expect": expect,
            "options": {"pin": pin, "full_log": full_log, "require_timestamp": require_ts}}));
    };
    let right = json!("right");
    let none = Value::Null;

    // intact
    add(
        "static_intact_unpinned",
        "static",
        vec![],
        none.clone(),
        none.clone(),
        false,
        "intact",
    );
    add(
        "static_intact_pinned",
        "static",
        vec![],
        right.clone(),
        none.clone(),
        false,
        "intact",
    );
    add(
        "whole_intact_pinned",
        "whole",
        vec![],
        right.clone(),
        none.clone(),
        false,
        "intact",
    );
    add(
        "static_full_log_ok",
        "static",
        vec![],
        right.clone(),
        json!("synthetic.log"),
        false,
        "intact",
    );
    add(
        "stamped_intact_required",
        "stamped",
        vec![],
        right.clone(),
        none.clone(),
        true,
        "intact",
    );

    // one flipped byte in each artifact (first, middle, last)
    for (f, len) in [
        ("log-slice.bin", stat["log-slice.bin"].len()),
        ("config.json", stat["config.json"].len()),
        ("epochs.json", stat["epochs.json"].len()),
        ("summary.html", stat["summary.html"].len()),
    ] {
        for (tag, off) in [("first", 0), ("mid", len / 2), ("last", len - 1)] {
            add(
                &format!("flip_{f}_{tag}"),
                "static",
                vec![flip(f, off, 0)],
                right.clone(),
                none.clone(),
                false,
                "tampered",
            );
        }
    }
    // manifest edits at chosen places
    let m = &stat["manifest.json"];
    let title_at = pos(m, "Static pack");
    let sha_at = pos(m, &m0.artifacts[1].sha256);
    let link_at = pos(m, &m0.artifacts[2].link);
    let head_at = pos(m, &m0.chain_head);
    let key_at = pos(m, &m0.signer.public_key);
    let fmt_at = pos(m, "kshana-evidence/1");
    let win_at = pos(m, "59.0");
    for (id, off) in [
        ("manifest_first_byte", 0),
        ("manifest_title", title_at),
        ("manifest_artifact_sha", sha_at),
        ("manifest_artifact_link", link_at),
        ("manifest_chain_head", head_at),
        ("manifest_public_key", key_at),
        ("manifest_format", fmt_at + 15),
        ("manifest_window", win_at),
        ("manifest_last_byte", m.len() - 1),
    ] {
        add(
            id,
            "static",
            vec![flip("manifest.json", off, 0)],
            right.clone(),
            none.clone(),
            false,
            "tampered",
        );
    }
    // the signature file
    let sl = stat["manifest.sig"].len();
    for (id, off) in [
        ("sig_first", 0),
        ("sig_mid", sl / 2),
        ("sig_last_newline", sl - 1),
    ] {
        add(
            id,
            "static",
            vec![flip("manifest.sig", off, 0)],
            right.clone(),
            none.clone(),
            false,
            "tampered",
        );
    }
    let upper = stat["manifest.sig"]
        .iter()
        .position(|b| b.is_ascii_lowercase())
        .unwrap();
    add(
        "sig_case_fold",
        "static",
        vec![flip("manifest.sig", upper, 5)],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "sig_flip_unpinned",
        "static",
        vec![flip("manifest.sig", 3, 1)],
        none.clone(),
        none.clone(),
        false,
        "tampered",
    );
    // size changes
    add(
        "truncate_epochs",
        "static",
        vec![json!({"op":"truncate","file":"epochs.json","len": stat["epochs.json"].len()-1})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "truncate_summary_to_zero",
        "static",
        vec![json!({"op":"truncate","file":"summary.html","len":0})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "truncate_manifest_half",
        "static",
        vec![json!({"op":"truncate","file":"manifest.json","len": m.len()/2})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "truncate_sig_newline",
        "static",
        vec![json!({"op":"truncate","file":"manifest.sig","len": sl-1})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "append_epochs",
        "static",
        vec![json!({"op":"append","file":"epochs.json","hex":"0a"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "append_sig",
        "static",
        vec![json!({"op":"append","file":"manifest.sig","hex":"0a"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    // files removed, renamed, added, swapped
    add(
        "remove_epochs",
        "static",
        vec![json!({"op":"remove","file":"epochs.json"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "remove_sig",
        "static",
        vec![json!({"op":"remove","file":"manifest.sig"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "remove_sig_unpinned",
        "static",
        vec![json!({"op":"remove","file":"manifest.sig"})],
        none.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "remove_manifest",
        "static",
        vec![json!({"op":"remove","file":"manifest.json"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "rename_epochs",
        "static",
        vec![json!({"op":"rename","from":"epochs.json","to":"epochs2.json"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "add_unlisted",
        "static",
        vec![json!({"op":"add","file":"extra.txt","hex":"6578747261"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "swap_config_epochs",
        "static",
        vec![json!({"op":"swap","a":"config.json","b":"epochs.json"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "swap_slice_summary",
        "static",
        vec![json!({"op":"swap","a":"log-slice.bin","b":"summary.html"})],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    // edited manifests (not re-signed)
    let rep = |f: &str, w: &str| json!({"op":"replace","file":f,"with":w});
    for (id, with) in [
        ("manifest_reordered", "attacks/reordered_manifest.json"),
        ("manifest_chain_wrong", "attacks/chain_wrong_manifest.json"),
        (
            "manifest_missing_slice",
            "attacks/missing_slice_manifest.json",
        ),
        ("manifest_bad_kind", "attacks/bad_kind_manifest.json"),
        ("manifest_format_v2", "attacks/format2_manifest.json"),
        (
            "manifest_uppercase_key",
            "attacks/uppercase_key_manifest.json",
        ),
        ("manifest_slice_end", "attacks/slice_end_manifest.json"),
        ("manifest_epoch_count", "attacks/epoch_count_manifest.json"),
        (
            "manifest_negative_bytes",
            "attacks/negative_bytes_manifest.json",
        ),
    ] {
        add(
            id,
            "static",
            vec![rep("manifest.json", with)],
            right.clone(),
            none.clone(),
            false,
            "tampered",
        );
    }
    add(
        "manifest_missing_slice_unpinned",
        "static",
        vec![rep("manifest.json", "attacks/missing_slice_manifest.json")],
        none.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "rehash_without_key",
        "static",
        vec![
            rep("epochs.json", "attacks/epochs_edited.json"),
            rep("manifest.json", "attacks/rehash_manifest.json"),
        ],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    // a different signer
    add(
        "wrong_pin_on_intact",
        "static",
        vec![],
        json!("wrong"),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "forged_resigned_pinned",
        "static",
        vec![
            rep("manifest.json", "attacks/forged_manifest.json"),
            rep("manifest.sig", "attacks/forged_sig.txt"),
            rep("summary.html", "attacks/forged_summary.html"),
        ],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );
    add(
        "forged_resigned_unpinned",
        "static",
        vec![
            rep("manifest.json", "attacks/forged_manifest.json"),
            rep("manifest.sig", "attacks/forged_sig.txt"),
            rep("summary.html", "attacks/forged_summary.html"),
        ],
        none.clone(),
        none.clone(),
        false,
        "intact",
    );
    // the full log
    add(
        "full_log_modified",
        "static",
        vec![],
        right.clone(),
        json!("synthetic_modified.log"),
        false,
        "tampered",
    );
    add(
        "slice_bytes_not_from_log",
        "static",
        vec![flip("log-slice.bin", 5, 0)],
        right.clone(),
        json!("synthetic.log"),
        false,
        "tampered",
    );
    // timestamps
    add(
        "stamped_stripped_required",
        "stamped",
        vec![json!({"op":"remove","file":"timestamp.tsr"})],
        right.clone(),
        none.clone(),
        true,
        "tampered",
    );
    add(
        "stamped_stripped_not_required",
        "stamped",
        vec![json!({"op":"remove","file":"timestamp.tsr"})],
        right.clone(),
        none.clone(),
        false,
        "intact",
    );
    add(
        "static_no_token_required",
        "static",
        vec![],
        right.clone(),
        none.clone(),
        true,
        "tampered",
    );
    for (id, with, expect) in [
        (
            "token_other_document",
            "attacks/token_other.tsr",
            "tampered",
        ),
        ("token_junk", "attacks/token_junk.bin", "tampered"),
        ("token_sha384_valid", "attacks/token_sha384.tsr", "intact"),
        (
            "token_bad_gentime",
            "attacks/token_bad_gentime.tsr",
            "tampered",
        ),
        (
            "token_short_imprint",
            "attacks/token_short_imprint.tsr",
            "tampered",
        ),
        (
            "token_bad_content_type",
            "attacks/token_bad_oid.tsr",
            "tampered",
        ),
    ] {
        add(
            id,
            "stamped",
            vec![rep("timestamp.tsr", with)],
            right.clone(),
            none.clone(),
            false,
            expect,
        );
    }
    add(
        "stamped_manifest_edited_after",
        "stamped",
        vec![flip("manifest.json", title_at, 0)],
        right.clone(),
        none.clone(),
        false,
        "tampered",
    );

    let doc = json!({
        "packs": {
            "static": {"dir": "packs/static", "public_key": public_key_hex(&SEED_STATIC), "full_log": "log/synthetic.log"},
            "whole": {"dir": "packs/whole", "public_key": public_key_hex(&SEED_WHOLE), "full_log": "log/synthetic.log"},
            "stamped": {"dir": "packs/stamped", "public_key": public_key_hex(&SEED_STATIC), "full_log": "log/synthetic.log"},
        },
        "wrong_public_key": public_key_hex(&SEED_OTHER),
        "cases": cases,
    });
    // Full-log options name a file under log/.
    let mut doc = doc;
    for c in doc["cases"].as_array_mut().unwrap() {
        if let Some(n) = c["options"]["full_log"].as_str().map(str::to_string) {
            c["options"]["full_log"] = json!(format!("log/{n}"));
        }
    }
    write(&root, "cases.json", &pretty(&doc));
    let _ = sha256_hex;
    println!(
        "wrote {} cases under {}",
        doc["cases"].as_array().unwrap().len(),
        root.display()
    );
}
