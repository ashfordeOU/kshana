// SPDX-License-Identifier: AGPL-3.0-only
// No console window on Windows in a release build.
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

fn main() {
    kshana_desktop::run()
}
