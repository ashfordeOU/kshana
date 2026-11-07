// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Desktop: the Studio front end (`web/studio/`) in a native window, with the
//! engine's runs executed natively ([`bridge`]) off the window's thread.

pub mod bridge;
pub mod devices;

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
            devices_list,
            device_start,
            device_status,
            device_excerpt,
            device_stop
        ])
        .run(tauri::generate_context!())
        .expect("Kshana Desktop could not start");
}
