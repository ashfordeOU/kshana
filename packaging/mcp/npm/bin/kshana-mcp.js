#!/usr/bin/env node
// SPDX-License-Identifier: AGPL-3.0-only
"use strict";
const { spawn } = require("node:child_process");
const { ensureBinary } = require("../lib/launcher.js");
const { version } = require("../package.json");

(async () => {
  let bin;
  try {
    bin = await ensureBinary(version);
  } catch (e) {
    process.stderr.write(`kshana-mcp: ${e.message}\n`);
    process.exit(1);
  }
  const child = spawn(bin, process.argv.slice(2), { stdio: "inherit" });
  for (const sig of ["SIGINT", "SIGTERM", "SIGHUP"]) process.on(sig, () => child.kill(sig));
  child.on("error", (e) => {
    process.stderr.write(`kshana-mcp: cannot run ${bin}: ${e.message}\n`);
    process.exit(1);
  });
  child.on("exit", (code, signal) => process.exit(signal ? 1 : code === null ? 1 : code));
})();
