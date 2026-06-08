// SPDX-License-Identifier: Apache-2.0
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
}
