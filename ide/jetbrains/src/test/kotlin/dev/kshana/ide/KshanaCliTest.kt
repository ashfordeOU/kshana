// SPDX-License-Identifier: Apache-2.0
package dev.kshana.ide

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/** Unit tests for the pure CLI helpers (no IntelliJ platform needed). */
class KshanaCliTest {
    @Test
    fun resolveBinaryFallsBackToPath() {
        assertEquals("kshana", KshanaCli.resolveBinary(null))
        assertEquals("kshana", KshanaCli.resolveBinary(""))
        assertEquals("kshana", KshanaCli.resolveBinary("   "))
        assertEquals("/opt/bin/kshana", KshanaCli.resolveBinary("/opt/bin/kshana"))
        assertEquals("/opt/bin/kshana", KshanaCli.resolveBinary("  /opt/bin/kshana  "))
    }

    @Test
    fun commandIsBinaryThenScenario() {
        assertEquals(
            listOf("kshana", "/proj/scenarios/clock-holdover.toml"),
            KshanaCli.command("kshana", "/proj/scenarios/clock-holdover.toml"),
        )
    }

    @Test
    fun onlyTomlIsAScenarioFile() {
        assertTrue(KshanaCli.isScenarioFile("clock-holdover.toml"))
        assertTrue(KshanaCli.isScenarioFile("ORBIT.TOML"))
        assertFalse(KshanaCli.isScenarioFile("README.md"))
        assertFalse(KshanaCli.isScenarioFile("Cargo.toml.bak"))
    }
}
