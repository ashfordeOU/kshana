// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Desktop: the Studio front end (`web/studio/`) in a native window, with the
//! engine's runs executed natively ([`bridge`]) off the window's thread.

pub mod bridge;
pub mod detective;
pub mod devices;
pub mod project;

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
            device_stop
        ])
        .run(tauri::generate_context!())
        .expect("Kshana Desktop could not start");
}
