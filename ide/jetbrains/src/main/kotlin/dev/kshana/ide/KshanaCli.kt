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
