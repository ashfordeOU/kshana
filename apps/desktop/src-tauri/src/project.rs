// SPDX-License-Identifier: AGPL-3.0-only
//! Project folders on disk (0.42 U8): a `.kshana` folder holds a project's scenarios, data
//! links, runs, notebooks and layouts as plain text files (the layout is written by the
//! shell, `apps/desktop/shell/lib/project.mjs`). This side only reads and writes text files
//! inside such a folder: a path must be relative, stay inside the folder and use the
//! project's file kinds, so a page can never write elsewhere on the disk.

use serde::Deserialize;
use serde_json::{json, Value};
use std::path::{Component, Path, PathBuf};

/// The largest file a project holds (a run's result can be large): 64 MiB.
pub const MAX_FILE_BYTES: usize = 64 * 1024 * 1024;
/// The most files read from a project.
pub const MAX_FILES: usize = 20_000;
/// The extensions a project file may have.
const KINDS: &[&str] = &[
    "json", "toml", "md", "txt", "csv", "svg", "py", "sh", "ipynb", "html",
];

/// One file to write: its path inside the project and its text.
#[derive(Deserialize)]
pub struct ProjectFile {
    pub path: String,
    pub text: String,
}

/// A project folder: an absolute path whose last part ends in `.kshana`.
pub fn project_dir(dir: &str) -> Result<PathBuf, String> {
    let p = PathBuf::from(dir);
    if !p.is_absolute() {
        return Err(format!("{dir}: a project folder is given by its full path"));
    }
    let name = p
        .file_name()
        .map(|n| n.to_string_lossy().to_string())
        .unwrap_or_default();
    if !name.ends_with(".kshana") || name.len() <= ".kshana".len() {
        return Err(format!("{dir}: a project folder's name ends in .kshana"));
    }
    if p.components().any(|c| matches!(c, Component::ParentDir)) {
        return Err(format!("{dir}: the path may not go up with .."));
    }
    Ok(p)
}

/// A file's path inside the project, checked: relative, no `..`, no hidden parts, a known kind.
pub fn safe_rel(rel: &str) -> Result<PathBuf, String> {
    let p = Path::new(rel);
    if rel.is_empty() || p.is_absolute() || rel.contains('\\') {
        return Err(format!(
            "{rel:?}: a project file's path is relative, with / between its parts"
        ));
    }
    let mut out = PathBuf::new();
    for c in p.components() {
        match c {
            Component::Normal(s) => {
                let s = s.to_string_lossy();
                if s.starts_with('.') || s.len() > 120 {
                    return Err(format!("{rel:?}: no hidden or overlong parts"));
                }
                out.push(&*s);
            }
            _ => return Err(format!("{rel:?}: no .., . or root in a project path")),
        }
    }
    let ext = out
        .extension()
        .map(|e| e.to_string_lossy().to_ascii_lowercase())
        .unwrap_or_default();
    if !KINDS.contains(&ext.as_str()) {
        return Err(format!(
            "{rel:?}: a project holds {} files",
            KINDS.join(", ")
        ));
    }
    Ok(out)
}

/// Write `files` into the project `dir` (made when missing). Each file is written to a
/// temporary name and renamed, so a file is never left half written. `remove` lists
/// project files to delete (a run the person removed).
pub fn save(dir: &str, files: &[ProjectFile], remove: &[String]) -> Result<Value, String> {
    let root = project_dir(dir)?;
    std::fs::create_dir_all(&root).map_err(|e| format!("{dir}: {e}"))?;
    let mut written = 0usize;
    let mut bytes = 0usize;
    for f in files {
        if f.text.len() > MAX_FILE_BYTES {
            return Err(format!(
                "{}: larger than {} MiB",
                f.path,
                MAX_FILE_BYTES >> 20
            ));
        }
        let rel = safe_rel(&f.path)?;
        let full = root.join(&rel);
        if let Some(parent) = full.parent() {
            std::fs::create_dir_all(parent).map_err(|e| format!("{}: {e}", f.path))?;
        }
        // An unchanged file is left alone (its time stamp too).
        if std::fs::read(&full).is_ok_and(|old| old == f.text.as_bytes()) {
            continue;
        }
        let tmp = full.with_extension("kshana-tmp");
        std::fs::write(&tmp, f.text.as_bytes()).map_err(|e| format!("{}: {e}", f.path))?;
        std::fs::rename(&tmp, &full).map_err(|e| format!("{}: {e}", f.path))?;
        written += 1;
        bytes += f.text.len();
    }
    let mut removed = 0usize;
    for r in remove {
        let full = root.join(safe_rel(r)?);
        if full.is_file() && std::fs::remove_file(&full).is_ok() {
            removed += 1;
        }
    }
    Ok(
        json!({"dir": root.to_string_lossy(), "written": written, "bytes": bytes, "removed": removed}),
    )
}

/// Every project file of `dir` as `{path, text}`, paths with `/`. A missing folder is an
/// empty project.
pub fn load(dir: &str) -> Result<Value, String> {
    let root = project_dir(dir)?;
    let mut out = Vec::new();
    if !root.is_dir() {
        return Ok(json!({"dir": root.to_string_lossy(), "exists": false, "files": out}));
    }
    let mut stack = vec![root.clone()];
    while let Some(d) = stack.pop() {
        let rd = std::fs::read_dir(&d).map_err(|e| format!("{}: {e}", d.display()))?;
        for e in rd.filter_map(Result::ok) {
            let p = e.path();
            if e.file_name().to_string_lossy().starts_with('.') {
                continue;
            }
            if p.is_dir() {
                stack.push(p);
                continue;
            }
            let rel = p
                .strip_prefix(&root)
                .map_err(|e| e.to_string())?
                .to_string_lossy()
                .replace('\\', "/");
            if safe_rel(&rel).is_err() {
                continue;
            }
            let meta = std::fs::metadata(&p).map_err(|e| e.to_string())?;
            if meta.len() as usize > MAX_FILE_BYTES {
                continue;
            }
            if let Ok(text) = std::fs::read_to_string(&p) {
                out.push(json!({"path": rel, "text": text}));
            }
            if out.len() >= MAX_FILES {
                break;
            }
        }
    }
    out.sort_by(|a, b| a["path"].as_str().cmp(&b["path"].as_str()));
    Ok(json!({"dir": root.to_string_lossy(), "exists": true, "files": out}))
}

/// The folder new projects go in by default: `Kshana` in the person's documents folder
/// (else their home folder), and the projects already there.
pub fn home(documents: Option<PathBuf>, home: Option<PathBuf>) -> Value {
    let base = documents.or(home).map(|d| d.join("Kshana"));
    let mut projects = Vec::new();
    if let Some(b) = &base {
        if let Ok(rd) = std::fs::read_dir(b) {
            for e in rd.filter_map(Result::ok) {
                let n = e.file_name().to_string_lossy().to_string();
                if n.ends_with(".kshana") && e.path().is_dir() {
                    projects.push(e.path().to_string_lossy().to_string());
                }
            }
        }
    }
    projects.sort();
    json!({"dir": base.map(|b| b.to_string_lossy().to_string()), "projects": projects})
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tmp(name: &str) -> PathBuf {
        let d =
            std::env::temp_dir().join(format!("kshana-project-test-{}-{name}", std::process::id()));
        let _ = std::fs::remove_dir_all(&d);
        d
    }

    #[test]
    fn paths_stay_inside_the_project() {
        assert!(safe_rel("runs/1/run.json").is_ok());
        assert!(safe_rel("notebooks/lab.ipynb").is_ok());
        assert!(safe_rel("notebooks/x.exe").is_err());
        assert!(safe_rel("../evil.json").is_err());
        assert!(safe_rel("/etc/passwd.json").is_err());
        assert!(safe_rel("runs/.hidden.json").is_err());
        assert!(safe_rel("runs/x.exe").is_err());
        assert!(safe_rel("a\\b.json").is_err());
        assert!(project_dir("relative.kshana").is_err());
        assert!(project_dir("/tmp/not-a-project").is_err());
        assert!(project_dir("/tmp/a/../b.kshana").is_err());
    }

    #[test]
    fn a_project_saved_is_loaded_back_unchanged() {
        let d = tmp("round").join("Study.kshana");
        let dir = d.to_string_lossy().to_string();
        let files = vec![
            ProjectFile {
                path: "project.json".into(),
                text: "{\"format\":\"kshana-project/1\"}\n".into(),
            },
            ProjectFile {
                path: "runs/r1/scenario.toml".into(),
                text: "kind = \"x\"\n".into(),
            },
        ];
        let r = save(&dir, &files, &[]).unwrap();
        assert_eq!(r["written"], json!(2));
        // Saving the same text again writes nothing.
        assert_eq!(save(&dir, &files, &[]).unwrap()["written"], json!(0));
        let back = load(&dir).unwrap();
        let got: Vec<(String, String)> = back["files"]
            .as_array()
            .unwrap()
            .iter()
            .map(|f| {
                (
                    f["path"].as_str().unwrap().to_string(),
                    f["text"].as_str().unwrap().to_string(),
                )
            })
            .collect();
        assert_eq!(
            got,
            vec![
                ("project.json".into(), files[0].text.clone()),
                ("runs/r1/scenario.toml".into(), files[1].text.clone())
            ]
        );
        let r = save(&dir, &[], &["runs/r1/scenario.toml".into()]).unwrap();
        assert_eq!(r["removed"], json!(1));
        assert_eq!(load(&dir).unwrap()["files"].as_array().unwrap().len(), 1);
        assert!(save(
            &dir,
            &[ProjectFile {
                path: "../x.json".into(),
                text: String::new()
            }],
            &[]
        )
        .is_err());
        let _ = std::fs::remove_dir_all(d.parent().unwrap());
    }

    #[test]
    fn a_missing_project_is_empty_and_home_lists_projects() {
        let d = tmp("home");
        let v = load(&d.join("None.kshana").to_string_lossy()).unwrap();
        assert_eq!(v["exists"], json!(false));
        std::fs::create_dir_all(d.join("Kshana").join("A.kshana")).unwrap();
        let h = home(Some(d.clone()), None);
        assert_eq!(h["projects"].as_array().unwrap().len(), 1);
        let _ = std::fs::remove_dir_all(&d);
    }
}
