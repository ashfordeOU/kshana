// SPDX-License-Identifier: AGPL-3.0-only
package dev.kshana.ide

/** Pure helpers for invoking the `kshana` CLI — no IntelliJ platform dependency, so they
 *  are unit-testable without a headless IDE. */
object KshanaCli {
    /** The binary name resolved from PATH when no explicit path is configured. */
    const val DEFAULT_BINARY: String = "kshana"

    /** The configured binary path, or [DEFAULT_BINARY] when blank/unset. */
    fun resolveBinary(configured: String?): String =
        configured?.trim().takeUnless { it.isNullOrEmpty() } ?: DEFAULT_BINARY

    /** The command line to run a scenario: `<binary> <scenario.toml>`. */
    fun command(binary: String, scenarioPath: String): List<String> =
        listOf(binary, scenarioPath)

    /** True for the scenario files the plugin acts on (Kshana scenarios are TOML). */
    fun isScenarioFile(fileName: String): Boolean =
        fileName.endsWith(".toml", ignoreCase = true)

    /** `<binary> receiver-trust <scenario.toml>`: assess the receiver log a scenario names. */
    fun receiverTrustCommand(binary: String, scenarioPath: String): List<String> =
        listOf(binary, "receiver-trust", scenarioPath)

    /** `<binary> nmea-scenario <scenario.toml>`: write synthetic training NMEA and the
     *  instructor log next to the scenario's working directory. Text only. */
    fun nmeaScenarioCommand(binary: String, scenarioPath: String): List<String> =
        listOf(binary, "nmea-scenario", scenarioPath)

    /** The approved interference-map datasets and the input kind each one is. */
    enum class MapDataset(val key: String, val source: String, val label: String) {
        ADSB_LOL("adsb-lol", "adsb", "adsb-lol (ADS-B aircraft reports)"),
        NOAA("noaa-marinecadastre", "ais", "noaa-marinecadastre (AIS ship reports)"),
        KYSTVERKET("kystverket", "ais", "kystverket (AIS ship reports)"),
    }

    /** `<binary> interference-map <adsb|ais> <input.csv> --dataset <key> --out <dir>`. */
    fun interferenceMapCommand(
        binary: String,
        csvPath: String,
        dataset: MapDataset,
        outDir: String,
    ): List<String> =
        listOf(binary, "interference-map", dataset.source, csvPath, "--dataset", dataset.key, "--out", outDir)

    /** `<binary> route-exposure --route <route> --map <map file or folder>`. */
    fun routeExposureCommand(binary: String, routePath: String, mapPath: String): List<String> =
        listOf(binary, "route-exposure", "--route", routePath, "--map", mapPath)

    /** True for an interference-map input (CSV in the documented format). */
    fun isMapInputFile(fileName: String): Boolean = fileName.endsWith(".csv", ignoreCase = true)

    /** True for a route file `route-exposure` reads (a GeoJSON LineString or `lat,lon` CSV). */
    fun isRouteFile(fileName: String): Boolean =
        fileName.endsWith(".geojson", ignoreCase = true) ||
            fileName.endsWith(".json", ignoreCase = true) ||
            fileName.endsWith(".csv", ignoreCase = true)

    /** `<binary> bench-export <scenario.toml> --out <base>`: write a scenario's vehicle motion,
     *  NMEA and labelled events as files a laboratory GNSS simulator can replay. No signal. */
    fun benchExportCommand(binary: String, scenarioPath: String, outBase: String): List<String> =
        listOf(binary, "bench-export", scenarioPath, "--out", outBase)

    /** `<binary> compliance-report --out <base> <result.json>...`: the public-framework mapping
     *  filled from run results, written as `<base>.compliance.md` and `<base>.compliance.json`. */
    fun complianceReportCommand(binary: String, outBase: String, resultPaths: List<String>): List<String> =
        listOf(binary, "compliance-report", "--out", outBase) + resultPaths

    /** `<binary> compliance-report --mapping`: the static mapping tables only (no run needed). */
    fun complianceMappingCommand(binary: String): List<String> =
        listOf(binary, "compliance-report", "--mapping")

    /** True for a run result file `compliance-report` reads. */
    fun isResultFile(fileName: String): Boolean = fileName.endsWith(".json", ignoreCase = true)

    /** Printed before a bench export: what the files are, and that no signal is written. */
    const val BENCH_NOTICE: String =
        "Writes vehicle motion, NMEA and labelled events for a laboratory GNSS simulator. It writes no signal: an event is a time interval, not a recipe for producing interference. Run a simulator only where authorised. Evidence tier: MODELLED."

    /** The engine's own statement printed with every compliance mapping, copied word for word
     *  from `compliance::STATEMENT` in the engine (src/compliance/mod.rs). Do not reword it. */
    const val COMPLIANCE_STATEMENT: String =
        "A row marked evidenced means a run in this set supports evidence for the capabilities the row names. It is not a finding that a framework is met, and it does not mean any product has been rated or approved by anyone. The gap column states what the runs do not show."

    /** `<binary> evidence verify <pack-dir> --pubkey <key> [--log <session log>] --json`. The key is
     *  always pinned: the plugin never passes `--allow-unpinned`. */
    fun evidenceVerifyCommand(binary: String, packDir: String, pubKey: String, logPath: String?): List<String> =
        listOf(binary, "evidence", "verify", packDir, "--pubkey", pubKey) +
            (if (logPath.isNullOrBlank()) emptyList() else listOf("--log", logPath)) +
            listOf("--json")

    /** The plain verdict for an `evidence verify` exit status. Only 0 reads as verified; 3 (intact
     *  but the signer is not pinned) is never shown as verified. */
    fun evidenceVerdict(exitCode: Int): String = when (exitCode) {
        0 -> "VERIFIED: the pack is intact and signed by the public key you supplied."
        1 -> "NOT VERIFIED: at least one check failed; the failure codes are in the report above."
        2 -> "NOT RUN: usage error. Check the pack folder and the public key."
        3 -> "NOT VERIFIED: INTACT, BUT THE SIGNER IS NOT PINNED."
        else -> "NOT VERIFIED: unexpected exit status $exitCode."
    }

    /** Printed before an evidence verification: what a verified pack does and does not show. */
    const val EVIDENCE_NOTICE: String =
        "A verified pack shows its files are the ones recorded and signed by the key you supplied. It does not show the log is genuine or complete, and it does not re-run the assessment."

    /** `<binary> example`: the bundled scenarios, one name per line on standard output. */
    fun exampleListCommand(binary: String): List<String> = listOf(binary, "example")

    /** `<binary> example <name>`: the scenario TOML on standard output. */
    fun exampleCommand(binary: String, name: String): List<String> = listOf(binary, "example", name)

    /** The names `kshana example` printed (one per non-blank line). */
    fun parseExampleNames(stdout: String): List<String> =
        stdout.lines().map { it.trim() }.filter { it.isNotEmpty() }

    /** A bundled-scenario name is safe to use as a file name: letters, digits, `-` and `_` only. */
    fun isSafeExampleName(name: String): Boolean = Regex("[A-Za-z0-9_-]+").matches(name)

    /** The export formats a scenario run can write, and the flag each one uses. */
    enum class ExportFormat(val key: String, val label: String, val extension: String) {
        SP3("sp3", "SP3 orbit file", "sp3"),
        OMM("omm", "CCSDS OMM", "omm"),
        OEM("oem", "CCSDS OEM", "oem"),
        CZML("czml", "CZML (Cesium)", "czml"),
        KML("kml", "KML", "kml"),
        GEOJSON("geojson", "GeoJSON", "geojson"),
        STK("stk", "STK ephemeris", "e"),
        SIGMF("sigmf", "SigMF", "sigmf-meta"),
    }

    /** `<binary> <scenario> --export-sp3|--export-omm|--export-oem <out>` or `--export <format>`;
     *  the result files are written next to the scenario. */
    fun exportCommand(binary: String, scenarioPath: String, format: ExportFormat): List<String> {
        val out = scenarioPath.removeSuffix(".toml") + "." + format.extension
        return when (format) {
            ExportFormat.SP3 -> listOf(binary, scenarioPath, "--export-sp3", out)
            ExportFormat.OMM -> listOf(binary, scenarioPath, "--export-omm", out)
            ExportFormat.OEM -> listOf(binary, scenarioPath, "--export-oem", out)
            else -> listOf(binary, scenarioPath, "--export", format.key)
        }
    }

    /** `<binary> <scenario> --animate <svg|html>`: the run's time series as an animation. */
    fun animateCommand(binary: String, scenarioPath: String, format: String): List<String> =
        listOf(binary, scenarioPath, "--animate", format)

    /** Where `--animate svg|html` writes: next to the scenario, `<stem>.animation.<format>`. */
    fun animationPath(scenarioPath: String, format: String): String =
        scenarioPath.removeSuffix(".toml") + ".animation." + format

    /** `<binary> <scenario> --import-route <route.geojson>`: run with a route the scenario uses. */
    fun importRouteCommand(binary: String, scenarioPath: String, routePath: String): List<String> =
        listOf(binary, scenarioPath, "--import-route", routePath)

    /** `<binary> receiver-trust evidence <session.toml> --from <t0> --to <t1> --key <keyfile> --out <dir>
     *  [--title <text>]`. The key is only ever a path the user chose; the plugin never makes or reads one. */
    fun evidencePackCommand(
        binary: String,
        sessionPath: String,
        from: String,
        to: String,
        keyFile: String,
        outDir: String,
        title: String?,
    ): List<String> =
        listOf(binary, "receiver-trust", "evidence", sessionPath, "--from", from, "--to", to, "--key", keyFile, "--out", outDir) +
            (if (title.isNullOrBlank()) emptyList() else listOf("--title", title))

    /** `<binary> evidence attach-timestamp <pack-dir> <response.tsr>` (never `--replace`). */
    fun attachTimestampCommand(binary: String, packDir: String, tokenPath: String): List<String> =
        listOf(binary, "evidence", "attach-timestamp", packDir, tokenPath)

    /** The check Kshana does not do for a timestamp token, as a command to run. */
    fun opensslTimestampCheck(packDir: String): String =
        "openssl ts -verify -in <response.tsr> -data $packDir/manifest.json -CAfile <authority-ca.pem>"

    /** Printed with an export: simulated products, not for live use. */
    const val EXPORT_NOTICE: String =
        "Simulated output of a modelled run: not an operational ephemeris or navigation product, and not for use in a live navigation system. Evidence tier: MODELLED."

    /** Printed with an imported route. */
    const val ROUTE_NOTICE: String =
        "The route is used as given in a modelled run; the result is not a forecast or a navigation product. Evidence tier: MODELLED."

    /** Printed before creating an evidence pack. */
    const val EVIDENCE_PACK_NOTICE: String =
        "A pack is a technical record, not a legal opinion: it states what the engine computed from the log you name and lets anyone check that nothing was changed afterwards. The signing key stays with you; the plugin never makes, reads or stores one."

    /** Printed with an attached timestamp token. */
    const val TIMESTAMP_NOTICE: String =
        "Kshana does not check the timestamp authority's signature or its chain of trust; it checks only that the token is about this manifest. Check the authority yourself with `openssl ts -verify`. The token sits beside the signed manifest, not inside it."

    /** Printed before a training run: the stream is synthetic and never for live navigation. */
    const val TRAINING_NOTICE: String =
        "Synthetic training data, text only. Never feed this stream to a vessel's live navigation systems."

    /** Printed with every receiver-trust result: the score is an aid, not an approval. */
    const val ADVISORY_NOTICE: String =
        "Advisory only: not type-approved navigation equipment (IEC 61108, IEC 61162); the operator remains responsible. Evidence tier: MODELLED."

    /** Printed with an interference map or a route exposure. */
    const val MAP_NOTICE: String =
        "A degraded cell does not identify interference as the cause; a cell not observed is not evidence of a clear route; not a forecast. Evidence tier: MODELLED."
}
