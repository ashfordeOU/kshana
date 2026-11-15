// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Desktop: the Studio front end (`web/studio/`) in a native window, with the
//! engine's runs executed natively ([`bridge`]) off the window's thread.

pub mod bridge;
pub mod detective;
pub mod devices;
pub mod live;
pub mod project;
pub mod python;
pub mod tiles;

use serde_json::Value;

/// Run one engine function off the window's thread.
#[tauri::command]
async fn engine_call(name: String, args: Vec<Value>) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || bridge::call(&name, &args))
        .await
        .map_err(|e| format!("the run stopped: {e}"))?
}

/// The functions this build runs natively.
#[tauri::command]
fn engine_native_fns() -> Vec<&'static str> {
    bridge::NATIVE_FNS.to_vec()
}

#[tauri::command]
fn file_info(path: String) -> Result<Value, String> {
    bridge::file_info(&path)
}

#[tauri::command]
async fn read_range(path: String, offset: u64, len: u64) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || bridge::read_range(&path, offset, len))
        .await
        .map_err(|e| e.to_string())?
}

#[tauri::command]
async fn iq_probe(path: String, format: String, probe: u64) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || bridge::iq_probe(&path, &format, probe))
        .await
        .map_err(|e| e.to_string())?
}

/// What a dropped file or folder is, by the engine's own readers (0.42 U9, the format
/// detective): format, span, constellations and gaps, before anything is loaded.
#[tauri::command]
async fn inspect_path(path: String) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || detective::inspect(&path))
        .await
        .map_err(|e| e.to_string())?
}

/// The same for bytes the page already holds (a file dropped without a path): the head of
/// the file as base64 and the file's whole size.
#[tauri::command]
async fn inspect_bytes(name: String, base64: String, size: u64) -> Result<Value, String> {
    use base64::Engine as _;
    let bytes = base64::engine::general_purpose::STANDARD
        .decode(base64.as_bytes())
        .map_err(|e| e.to_string())?;
    tauri::async_runtime::spawn_blocking(move || {
        detective::inspect_bytes(&name, &bytes, size, &|_| None)
    })
    .await
    .map_err(|e| e.to_string())
}

/// Write files into a `.kshana` project folder (0.42 U8).
#[tauri::command]
async fn project_save(
    dir: String,
    files: Vec<project::ProjectFile>,
    remove: Option<Vec<String>>,
) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || {
        project::save(&dir, &files, &remove.unwrap_or_default())
    })
    .await
    .map_err(|e| e.to_string())?
}

/// Every file of a `.kshana` project folder.
#[tauri::command]
async fn project_load(dir: String) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || project::load(&dir))
        .await
        .map_err(|e| e.to_string())?
}

/// Where projects go by default, and the projects there.
#[tauri::command]
fn project_home(app: tauri::AppHandle) -> Value {
    use tauri::Manager as _;
    project::home(app.path().document_dir().ok(), app.path().home_dir().ok())
}

/// The serial ports this computer shows (live devices, read only).
#[tauri::command]
fn devices_list() -> Vec<Value> {
    devices::list()
}

/// Start reading a receiver: a serial port, `tcp:<host>:<port>` or `file:<path>`.
#[tauri::command]
async fn device_start(source: String, baud: Option<u32>) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || devices::start(&source, baud))
        .await
        .map_err(|e| e.to_string())?
}

#[tauri::command]
fn device_status() -> Value {
    devices::status()
}

#[tauri::command]
fn device_excerpt() -> Value {
    devices::excerpt()
}

#[tauri::command]
fn device_stop() -> Value {
    devices::stop()
}

/// Start reading a live AIS or ADS-B source (0.42 U26): `tcp:<host>:<port>` or
/// `udp:<address>:<port>`, format `ais`, `beast` or `avr`. Read only.
#[tauri::command]
async fn live_start(
    source: String,
    format: String,
    window_s: Option<u64>,
) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || live::start(&source, &format, window_s))
        .await
        .map_err(|e| e.to_string())?
}

#[tauri::command]
fn live_status() -> Value {
    live::status()
}

/// The live source's kept messages, decoded by the engine's reader.
#[tauri::command]
async fn live_snapshot() -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(live::snapshot)
        .await
        .map_err(|e| e.to_string())?
}

#[tauri::command]
fn live_stop() -> Value {
    live::stop()
}

/// Look for Python and the kshana package (0.42 U23).
#[tauri::command]
async fn python_probe(interpreter: Option<String>) -> Value {
    tauri::async_runtime::spawn_blocking(move || python::probe(interpreter.as_deref()))
        .await
        .unwrap_or_else(|e| serde_json::json!({"found": false, "error": e.to_string()}))
}

/// Run a notebook or console cell in the project's Python session.
#[tauri::command]
async fn python_exec(
    code: String,
    interpreter: Option<String>,
    cwd: Option<String>,
    timeout_s: Option<u64>,
) -> Result<Value, String> {
    tauri::async_runtime::spawn_blocking(move || {
        python::exec(&code, interpreter.as_deref(), cwd.as_deref(), timeout_s)
    })
    .await
    .map_err(|e| e.to_string())?
}

#[tauri::command]
fn python_status() -> Value {
    python::status()
}

/// End the Python session.
#[tauri::command]
async fn python_stop() -> Value {
    tauri::async_runtime::spawn_blocking(python::stop)
        .await
        .unwrap_or_else(|e| serde_json::json!({"stopped": false, "error": e.to_string()}))
}

fn tile_root(app: &tauri::AppHandle) -> Result<std::path::PathBuf, String> {
    use tauri::Manager as _;
    app.path()
        .app_cache_dir()
        .map(|d| d.join("imagery"))
        .map_err(|e| e.to_string())
}

/// An imagery tile kept on this computer (0.42 U24), as base64, or null.
#[tauri::command]
fn tile_cache_get(app: tauri::AppHandle, key: String) -> Result<Option<String>, String> {
    tiles::get(&tile_root(&app)?, &key)
}

/// Keep an imagery tile the page fetched (only when the person turned imagery on).
#[tauri::command]
fn tile_cache_put(app: tauri::AppHandle, key: String, base64: String) -> Result<(), String> {
    tiles::put(&tile_root(&app)?, &key, &base64)
}

/// Start the application.
pub fn run() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            engine_call,
            engine_native_fns,
            file_info,
            read_range,
            iq_probe,
            inspect_path,
            inspect_bytes,
            project_save,
            project_load,
            project_home,
            devices_list,
            device_start,
            device_status,
            device_excerpt,
            device_stop,
            live_start,
            live_status,
            live_snapshot,
            live_stop,
            python_probe,
            python_exec,
            python_status,
            python_stop,
            tile_cache_get,
            tile_cache_put
        ])
        .run(tauri::generate_context!())
        .expect("Kshana Desktop could not start");
}
