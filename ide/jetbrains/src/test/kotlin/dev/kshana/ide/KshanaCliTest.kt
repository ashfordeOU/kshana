// SPDX-License-Identifier: AGPL-3.0-only
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

    @Test
    fun receiverTrustAndTrainingCommandsUseTheSubcommands() {
        assertEquals(
            listOf("kshana", "receiver-trust", "/p/session.toml"),
            KshanaCli.receiverTrustCommand("kshana", "/p/session.toml"),
        )
        assertEquals(
            listOf("kshana", "nmea-scenario", "/p/drill.toml"),
            KshanaCli.nmeaScenarioCommand("kshana", "/p/drill.toml"),
        )
    }

    @Test
    fun interferenceMapCommandNamesTheSourceTheDatasetImplies() {
        assertEquals(
            listOf("kshana", "interference-map", "adsb", "/d/a.csv", "--dataset", "adsb-lol", "--out", "/d/out"),
            KshanaCli.interferenceMapCommand("kshana", "/d/a.csv", KshanaCli.MapDataset.ADSB_LOL, "/d/out"),
        )
        assertEquals("ais", KshanaCli.MapDataset.NOAA.source)
        assertEquals("ais", KshanaCli.MapDataset.KYSTVERKET.source)
    }

    @Test
    fun routeExposureCommandTakesARouteAndAMapFolder() {
        assertEquals(
            listOf("kshana", "route-exposure", "--route", "/r.geojson", "--map", "/maps"),
            KshanaCli.routeExposureCommand("kshana", "/r.geojson", "/maps"),
        )
        assertTrue(KshanaCli.isRouteFile("route.GeoJSON"))
        assertTrue(KshanaCli.isRouteFile("route.csv"))
        assertFalse(KshanaCli.isRouteFile("notes.md"))
        assertTrue(KshanaCli.isMapInputFile("day.CSV"))
        assertFalse(KshanaCli.isMapInputFile("day.toml"))
    }

    @Test
    fun noticesCarryTheCaveats() {
        assertTrue(KshanaCli.TRAINING_NOTICE.contains("Never feed"))
        assertTrue(KshanaCli.ADVISORY_NOTICE.contains("Advisory only"))
        assertTrue(KshanaCli.MAP_NOTICE.contains("not a forecast"))
    }
}
