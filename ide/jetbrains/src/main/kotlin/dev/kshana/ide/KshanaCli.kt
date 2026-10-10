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
