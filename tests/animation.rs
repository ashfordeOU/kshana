// SPDX-License-Identifier: AGPL-3.0-only
//! Animation export (`src/animation.rs`, `docs/ANIMATION.md`).
//!
//! What is held here: the three exports are byte-identical on a re-run; the frame
//! sequence has exactly `round(duration * fps)` frames and a manifest that says so; the
//! HTML player names no external address; every SVG (animated and per frame) is
//! well-formed XML; the reduced-motion path is present in both the SVG and the player;
//! and every bundled scenario whose result carries a time series animates without error,
//! while every other one is refused as "no time series", never animated from nothing.
//! The campaign timeline and the spectrum waterfall are checked by name.
//!
//! This is a rendering of the run's own samples, so the tier is MODELLED
//! (internal consistency): nothing here is evidence about the physics.

use kshana::animation::{
    animate_result, extract_timeline, AnimationError, AnimationFormat, AnimationOptions,
};
use std::process::Command;

#[path = "support/corpus.rs"]
mod corpus;

fn run(stem: &str) -> String {
    let path = format!("{}/scenarios/{stem}.toml", env!("CARGO_MANIFEST_DIR"));
    let src = std::fs::read_to_string(&path).expect("read scenario");
    kshana::api::run_toml(&src)
        .unwrap_or_else(|e| panic!("{stem} failed to run: {e}"))
        .json
}

fn quick() -> AnimationOptions {
    AnimationOptions {
        fps: 2,
        duration_s: 2.0,
        ..Default::default()
    }
}

/// A strict well-formedness check over the XML the exporter writes: one root element,
/// balanced and properly nested tags, every attribute quoted, and only the five
/// predefined entities or numeric character references. It accepts no DTD, which the
/// exports never contain. Returns the number of elements seen.
fn xml_well_formed(doc: &str) -> Result<usize, String> {
    let b = doc.as_bytes();
    let mut i = 0;
    let mut stack: Vec<String> = Vec::new();
    let mut elements = 0;
    let mut roots = 0;
    let check_text = |s: &str| -> Result<(), String> {
        let mut rest = s;
        while let Some(p) = rest.find('&') {
            let tail = &rest[p + 1..];
            let end = tail.find(';').ok_or("unterminated entity")?;
            let ent = &tail[..end];
            let ok = matches!(ent, "amp" | "lt" | "gt" | "quot" | "apos")
                || (ent.starts_with("#x")
                    && ent.len() > 2
                    && ent[2..].chars().all(|c| c.is_ascii_hexdigit()))
                || (ent.starts_with('#')
                    && ent.len() > 1
                    && ent[1..].chars().all(|c| c.is_ascii_digit()));
            if !ok {
                return Err(format!("bad entity &{ent};"));
            }
            rest = &tail[end + 1..];
        }
        Ok(())
    };
    while i < b.len() {
        if b[i] != b'<' {
            let next = doc[i..].find('<').map(|p| i + p).unwrap_or(b.len());
            let text = &doc[i..next];
            if stack.is_empty() && !text.trim().is_empty() {
                return Err(format!("text outside the root element: {:?}", text.trim()));
            }
            if text.contains('>') && !stack.is_empty() {
                // '>' is legal in text, but our writer escapes it; a raw one means a
                // broken tag upstream.
                return Err(format!("raw '>' in text: {text:?}"));
            }
            check_text(text)?;
            i = next;
            continue;
        }
        if doc[i..].starts_with("<!--") {
            let end = doc[i..].find("-->").ok_or("unterminated comment")?;
            i += end + 3;
            continue;
        }
        if doc[i..].starts_with("<?") {
            let end = doc[i..].find("?>").ok_or("unterminated declaration")?;
            i += end + 2;
            continue;
        }
        if doc[i..].starts_with("<!") {
            return Err("DTD or CDATA is not expected in an export".into());
        }
        let close = doc[i..].find('>').ok_or("unterminated tag")? + i;
        let inner = &doc[i + 1..close];
        if inner.contains('<') {
            return Err(format!("'<' inside a tag: {inner:?}"));
        }
        if let Some(name) = inner.strip_prefix('/') {
            let name = name.trim();
            match stack.pop() {
                Some(open) if open == name => {}
                other => return Err(format!("</{name}> closes {other:?}")),
            }
        } else {
            let self_closing = inner.ends_with('/');
            let body = inner.trim_end_matches('/');
            let name_end = body.find(|c: char| c.is_whitespace()).unwrap_or(body.len());
            let name = &body[..name_end];
            if name.is_empty()
                || !name
                    .chars()
                    .all(|c| c.is_ascii_alphanumeric() || c == '-' || c == ':' || c == '_')
            {
                return Err(format!("bad element name {name:?}"));
            }
            // Attributes: name="value" pairs, values without '<' and with valid entities.
            let mut rest = body[name_end..].trim_start();
            let mut seen: Vec<&str> = Vec::new();
            while !rest.is_empty() {
                let eq = rest
                    .find('=')
                    .ok_or(format!("attribute without value in <{name}>"))?;
                let an = rest[..eq].trim();
                if an.is_empty() || an.contains(char::is_whitespace) {
                    return Err(format!("bad attribute name {an:?} in <{name}>"));
                }
                if seen.contains(&an) {
                    return Err(format!("duplicate attribute {an} in <{name}>"));
                }
                seen.push(an);
                let after = &rest[eq + 1..];
                let q = after.chars().next().ok_or("attribute value missing")?;
                if q != '"' && q != '\'' {
                    return Err(format!("unquoted attribute {an} in <{name}>"));
                }
                let vend = after[1..].find(q).ok_or("unterminated attribute value")?;
                check_text(&after[1..1 + vend])?;
                rest = after[vend + 2..].trim_start();
            }
            elements += 1;
            if stack.is_empty() {
                roots += 1;
            }
            if !self_closing {
                stack.push(name.to_string());
            }
        }
        i = close + 1;
    }
    if !stack.is_empty() {
        return Err(format!("unclosed elements {stack:?}"));
    }
    if roots != 1 {
        return Err(format!("{roots} root elements"));
    }
    Ok(elements)
}

#[test]
fn the_well_formedness_check_rejects_what_it_should() {
    assert!(xml_well_formed("<svg><g/></svg>").is_ok());
    assert!(xml_well_formed("<svg><g></svg>").is_err());
    assert!(xml_well_formed("<svg a=1/>").is_err());
    assert!(xml_well_formed("<svg>&nbsp;</svg>").is_err());
    assert!(xml_well_formed("<svg/><svg/>").is_err());
    assert!(xml_well_formed("<svg a=\"1\" a=\"2\"/>").is_err());
}

#[test]
fn every_export_is_byte_identical_on_a_rerun() {
    for stem in [
        "clock-holdover",
        "campaign-jam-spoof-holdover-integrity",
        "l-band-waterfall-jamming",
    ] {
        let json_a = run(stem);
        let json_b = run(stem);
        for f in AnimationFormat::ALL {
            let a = animate_result(&json_a, None, f, &quick()).unwrap();
            let b = animate_result(&json_b, None, f, &quick()).unwrap();
            assert_eq!(a, b, "{stem} {} export differs on a re-run", f.as_str());
            assert!(a.files.iter().all(|x| !x.content.is_empty()));
        }
    }
}

#[test]
fn frame_count_is_duration_times_fps() {
    let json = run("clock-holdover");
    for (fps, dur) in [(10u32, 3.0f64), (24, 2.5), (12, 8.0), (1, 2.0)] {
        let opts = AnimationOptions {
            fps,
            duration_s: dur,
            ..Default::default()
        };
        let want = (dur * fps as f64).round() as usize;
        let a = animate_result(&json, None, AnimationFormat::Frames, &opts).unwrap();
        assert_eq!(a.frame_count, want, "fps {fps} duration {dur}");
        let frames: Vec<&str> = a
            .files
            .iter()
            .filter(|f| f.name.starts_with("frame_"))
            .map(|f| f.name.as_str())
            .collect();
        assert_eq!(frames.len(), want);
        assert_eq!(frames[0], "frame_0000.svg");
        assert_eq!(frames[want - 1], format!("frame_{:04}.svg", want - 1));
        let manifest = a
            .files
            .iter()
            .find(|f| f.name == "manifest.json")
            .expect("manifest.json");
        let m: serde_json::Value = serde_json::from_str(&manifest.content).unwrap();
        assert_eq!(m["frame_count"], want);
        assert_eq!(m["fps"], fps);
        assert_eq!(m["duration_s"], dur);
        assert_eq!(m["frame_pattern"], "frame_%04d.svg");
        assert_eq!(m["frame_times"].as_array().unwrap().len(), want);
        // The sequence spans the timeline end to end.
        let times = m["frame_times"].as_array().unwrap();
        assert_eq!(times[0], m["t_start"]);
        assert_eq!(times[want - 1], m["t_end"]);
    }
}

#[test]
fn a_frame_count_outside_the_limits_is_refused() {
    let json = run("clock-holdover");
    let too_many = AnimationOptions {
        fps: 60,
        duration_s: 600.0,
        ..Default::default()
    };
    assert!(matches!(
        animate_result(&json, None, AnimationFormat::Frames, &too_many),
        Err(AnimationError::Invalid(_))
    ));
}

#[test]
fn the_html_player_names_no_external_address() {
    for stem in [
        "clock-holdover",
        "campaign-jam-spoof-holdover-integrity",
        "l-band-waterfall-jamming",
    ] {
        let a = animate_result(&run(stem), None, AnimationFormat::Html, &quick()).unwrap();
        let html = &a.files[0].content;
        for needle in [
            "http:",
            "https:",
            "//cdn",
            " src=",
            " href=",
            "@import",
            "url(",
            "<link",
            "fetch(",
            "XMLHttpRequest",
            "<iframe",
        ] {
            assert!(
                !html.contains(needle),
                "{stem}: the player contains {needle:?}"
            );
        }
        assert!(html.starts_with("<!doctype html>"));
        assert!(html.contains("<script type=\"application/json\" id=\"kx-data\">"));
        // The inline data cannot close its script element early.
        let data_start = html.find("id=\"kx-data\">").unwrap();
        let data_end = html[data_start..].find("</script>").unwrap() + data_start;
        let data = &html[data_start + "id=\"kx-data\">".len()..data_end];
        assert!(serde_json::from_str::<serde_json::Value>(data).is_ok());
        // Controls: play/pause, scrub, speed.
        for id in ["kx-play", "kx-scrub", "kx-speed"] {
            assert!(html.contains(&format!("id=\"{id}\"")), "{stem}: no {id}");
        }
        assert!(html.contains("prefers-color-scheme: dark"));
    }
}

#[test]
fn every_svg_is_well_formed_xml() {
    for stem in [
        "clock-holdover",
        "campaign-jam-spoof-holdover-integrity",
        "l-band-waterfall-jamming",
        "mars-pnt-lmo",
    ] {
        let json = run(stem);
        let svg = animate_result(&json, None, AnimationFormat::Svg, &quick()).unwrap();
        let n = xml_well_formed(&svg.files[0].content)
            .unwrap_or_else(|e| panic!("{stem} animated SVG: {e}"));
        assert!(n > 20, "{stem}: only {n} elements");
        let frames = animate_result(&json, None, AnimationFormat::Frames, &quick()).unwrap();
        for f in frames.files.iter().filter(|f| f.name.ends_with(".svg")) {
            xml_well_formed(&f.content).unwrap_or_else(|e| panic!("{stem} {}: {e}", f.name));
        }
    }
}

#[test]
fn the_reduced_motion_path_is_present() {
    let json = run("campaign-jam-spoof-holdover-integrity");
    let svg = animate_result(&json, None, AnimationFormat::Svg, &quick()).unwrap();
    let svg = &svg.files[0].content;
    assert!(
        svg.contains("@media (prefers-reduced-motion: reduce){.kx-anim{animation:none!important}}")
    );
    // With animation off, the base styles are the finished picture: the cursor sits at
    // the end, and the reveal clip carries no transform of its own.
    assert!(svg.contains(".kx-cursor{transform:translateX("));
    assert!(
        !svg.contains("<script"),
        "the animated SVG must need no script"
    );
    let html = animate_result(&json, None, AnimationFormat::Html, &quick()).unwrap();
    let html = &html.files[0].content;
    assert!(html.contains("@media (prefers-reduced-motion: reduce)"));
    assert!(html.contains("matchMedia(\"(prefers-reduced-motion: reduce)\")"));
}

#[test]
fn the_campaign_plays_its_phases_and_events() {
    let tl = extract_timeline(&run("campaign-jam-spoof-holdover-integrity"), None).unwrap();
    let names: Vec<&str> = tl.phases.iter().map(|p| p.name.as_str()).collect();
    for want in ["jamming", "spoofing", "holdover", "integrity-alarm"] {
        assert!(names.contains(&want), "phase {want} missing from {names:?}");
    }
    // The phases arrive in mission order, jamming before spoofing before holdover.
    let at = |n: &str| names.iter().position(|x| *x == n).unwrap();
    assert!(at("jamming") < at("spoofing") && at("spoofing") < at("holdover"));
    assert!(tl.events.len() >= 2 && tl.events.iter().all(|e| e.alarm));
    assert!(tl.charts.len() >= 3, "campaign channels: {:?}", tl.charts);
    let svg = kshana::animation::render_svg(&tl, &quick());
    assert!(svg.contains("kx-e0") && svg.contains("kx-e1"));
    assert!(svg.contains(">spoofing</text>"));
}

#[test]
fn the_spectrum_waterfall_animates_row_by_row() {
    let json = run("l-band-waterfall-jamming");
    let tl = extract_timeline(&json, None).unwrap();
    let wf = tl.waterfall.as_ref().expect("waterfall");
    assert_eq!(wf.rows.len(), wf.t.len());
    assert!(wf.rows.len() >= 10 && wf.freq_hz.len() >= 10);
    assert!(wf.hi > wf.lo);
    // Rows appear in time order: an early frame shows fewer waterfall cells than the last.
    let opts = AnimationOptions {
        fps: 4,
        duration_s: 2.0,
        ..Default::default()
    };
    let a = animate_result(&json, None, AnimationFormat::Frames, &opts).unwrap();
    let cells = |s: &str| s.matches("<rect x=").count();
    let first = cells(&a.files[1].content);
    let last = cells(&a.files[a.frame_count - 1].content);
    assert!(
        first < last,
        "waterfall rows must accumulate: {first} vs {last}"
    );
    let svg = animate_result(&json, None, AnimationFormat::Svg, &opts).unwrap();
    assert!(svg.files[0].content.contains("@keyframes kx-wf"));
}

#[test]
fn every_bundled_scenario_with_a_time_series_animates() {
    // Run and animate each scenario on the corpus pool (tests/support/corpus.rs); the
    // outcomes come back in the corpus's sorted order.
    let paths = corpus::runnable_scenarios();
    let outcomes = corpus::par_map(&paths, |path| {
        let name = path.file_stem().unwrap().to_string_lossy().into_owned();
        let src = std::fs::read_to_string(path).unwrap();
        let out = kshana::api::run_toml(&src)
            .unwrap_or_else(|e| panic!("bundled scenario {name} failed to run: {e}"));
        match extract_timeline(&out.json, None) {
            Ok(tl) => {
                assert!(tl.t1 > tl.t0, "{name}: empty time range");
                assert!(
                    !tl.charts.is_empty() || tl.waterfall.is_some(),
                    "{name}: a timeline with nothing to draw"
                );
                for f in AnimationFormat::ALL {
                    let a = animate_result(&out.json, None, f, &quick())
                        .unwrap_or_else(|e| panic!("{name} {}: {e}", f.as_str()));
                    for file in a.files.iter().filter(|x| x.name.ends_with(".svg")) {
                        xml_well_formed(&file.content)
                            .unwrap_or_else(|e| panic!("{name} {}: {e}", file.name));
                    }
                }
                (name, true)
            }
            Err(AnimationError::NoTimeSeries(_)) => (name, false),
            Err(e) => panic!("{name}: {e}"),
        }
    });
    let mut animated = Vec::new();
    let mut refused = Vec::new();
    for (name, ok) in outcomes {
        if ok {
            animated.push(name);
        } else {
            refused.push(name);
        }
    }
    for must in [
        "campaign-jam-spoof-holdover-integrity",
        "campaign-spectrum-holdover-integrity",
        "l-band-waterfall-jamming",
        "clock-holdover",
        "gnss-ins",
        "jamming-demo",
        "integrity-raim",
        "spoof-attack",
        "mars-pnt-lmo",
        "ephemeris",
        "slot-timing-ocxo-leo",
        "lunar-vlbi",
    ] {
        assert!(
            animated.iter().any(|n| n == must),
            "{must} carries a time series and must animate; refused: {refused:?}"
        );
    }
    // Guard the guard: the corpus is not silently empty, and most of it animates.
    assert!(
        animated.len() >= 40,
        "only {} scenarios animated: {animated:?}",
        animated.len()
    );
    eprintln!(
        "animation: {} bundled scenarios animate, {} carry no time series ({refused:?})",
        animated.len(),
        refused.len()
    );
}

/// Per-call working directory under the system temp dir; the sequence number, not the
/// process id, is what makes it unique between tests of one binary.
fn temp_workdir(label: &str) -> std::path::PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!(
        "kshana-animate-{label}-{}-{seq}",
        std::process::id()
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn the_cli_writes_every_format_and_records_it_in_the_result() {
    let dir = temp_workdir("cli");
    let scn = dir.join("clock-holdover.toml");
    std::fs::copy(
        format!(
            "{}/scenarios/clock-holdover.toml",
            env!("CARGO_MANIFEST_DIR")
        ),
        &scn,
    )
    .unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args([
            "--animate",
            "all",
            "--animate-fps",
            "5",
            "--animate-duration",
            "2",
        ])
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    assert!(dir.join("clock-holdover.animation.svg").is_file());
    assert!(dir.join("clock-holdover.animation.html").is_file());
    let frames = dir.join("clock-holdover.frames");
    assert!(frames.join("manifest.json").is_file());
    assert!(frames.join("frame_0009.svg").is_file());
    assert!(!frames.join("frame_0010.svg").exists());
    let json: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(dir.join("clock-holdover.result.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(json["animation"]["frame_count"], 10);
    assert_eq!(
        json["animation"]["formats"],
        serde_json::json!(["svg", "html", "frames"])
    );

    // A shorter re-export into the same directory leaves no frame of the earlier one
    // behind, so `frame_%04d.svg` reads exactly the new sequence; other files stay.
    std::fs::write(frames.join("notes.txt"), "kept").unwrap();
    let shorter = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args([
            "--animate",
            "frames",
            "--animate-fps",
            "2",
            "--animate-duration",
            "2",
        ])
        .output()
        .unwrap();
    assert!(
        shorter.status.success(),
        "{}",
        String::from_utf8_lossy(&shorter.stderr)
    );
    let mut left: Vec<String> = std::fs::read_dir(&frames)
        .unwrap()
        .map(|e| e.unwrap().file_name().to_string_lossy().into_owned())
        .collect();
    left.sort();
    assert_eq!(
        left,
        vec![
            "frame_0000.svg",
            "frame_0001.svg",
            "frame_0002.svg",
            "frame_0003.svg",
            "manifest.json",
            "notes.txt",
        ]
    );

    // Without --animate the result carries no animation block at all.
    let plain = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .output()
        .unwrap();
    assert!(plain.status.success());
    let json: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(dir.join("clock-holdover.result.json")).unwrap(),
    )
    .unwrap();
    assert!(json.get("animation").is_none());
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn the_cli_refuses_a_kind_with_no_time_series_and_writes_nothing() {
    let dir = temp_workdir("refuse");
    let scn = dir.join("link-budget.toml");
    std::fs::copy(
        format!("{}/scenarios/link-budget.toml", env!("CARGO_MANIFEST_DIR")),
        &scn,
    )
    .unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args(["--animate", "svg"])
        .output()
        .unwrap();
    assert!(!out.status.success());
    let err = String::from_utf8_lossy(&out.stderr);
    assert!(err.contains("no time series"), "{err}");
    assert!(!dir.join("link-budget.result.json").exists());
    assert!(!dir.join("link-budget.animation.svg").exists());
    let bad = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args(["--animate", "gif"])
        .output()
        .unwrap();
    assert_eq!(bad.status.code(), Some(2));
    let _ = std::fs::remove_dir_all(&dir);
}
