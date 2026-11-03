# Scenario versions

A scenario file may start with a version line:

```toml
schema_version = 1
kind = "holdover"
```

It names the version of the scenario schema the file was written for, so a later engine can upgrade the file instead of misreading it. The line is optional: a file without it is read as the current version, exactly as before the line existed.

Every surface that runs a scenario (the command line, Python, WebAssembly, MCP, Studio) checks the line and removes it before the scenario kind reads the file. A file therefore produces the same scenario hash and the same result, byte for byte, with or without the line. A version newer than the engine reads is refused with a message naming both versions.

| Command | What it does |
| --- | --- |
| `kshana scenario version` | prints the scenario schema version this engine reads |
| `kshana scenario migrate <scenario.toml>` | prints the file upgraded to that version, with the version line added |
| `kshana scenario migrate <scenario.toml> --in-place` | rewrites the file itself |

## History

| Version | Engine | Change |
| --- | --- | --- |
| 1 | 0.41 | First stated version. Every scenario kind of 0.40 is version 1 unchanged. |

When a later version changes a kind, `kshana scenario migrate` gains the step that upgrades files of the version before it, and the step is tested on those files. The deprecation rule is in [STABILITY.md](STABILITY.md).
