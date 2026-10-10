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

    @Test
    fun benchExportAndComplianceCommandsUseTheSubcommands() {
        assertEquals(
            listOf("kshana", "bench-export", "/s.toml", "--out", "/bench-s"),
            KshanaCli.benchExportCommand("kshana", "/s.toml", "/bench-s"),
        )
        assertEquals(
            listOf("kshana", "compliance-report", "--out", "/c", "/r.json"),
            KshanaCli.complianceReportCommand("kshana", "/c", listOf("/r.json")),
        )
        assertEquals(
            listOf("kshana", "compliance-report", "--mapping"),
            KshanaCli.complianceMappingCommand("kshana"),
        )
        assertTrue(KshanaCli.isResultFile("run.result.JSON"))
        assertFalse(KshanaCli.isResultFile("run.toml"))
    }

    @Test
    fun complianceStatementIsTheEnginesWordForWord() {
        // compliance::STATEMENT in src/compliance/mod.rs; scripts/check-jetbrains-statement.sh
        // compares the two once that module is on this branch.
        assertEquals(
            "A row marked evidenced means a run in this set supports evidence for the capabilities the row names. " +
                "It is not a finding that a framework is met, and it does not mean any product has been rated or " +
                "approved by anyone. The gap column states what the runs do not show.",
            KshanaCli.COMPLIANCE_STATEMENT,
        )
        assertTrue(KshanaCli.BENCH_NOTICE.contains("writes no signal"))
    }

    @Test
    fun noPluginTextUsesTheBannedClaimWords() {
        val banned = Regex("certif|complies|compliant|conform", RegexOption.IGNORE_CASE)
        val xml = javaClass.getResourceAsStream("/META-INF/plugin.xml")!!.bufferedReader().readText()
        val texts = listOf(
            KshanaCli.TRAINING_NOTICE, KshanaCli.ADVISORY_NOTICE, KshanaCli.MAP_NOTICE,
            KshanaCli.BENCH_NOTICE, KshanaCli.COMPLIANCE_STATEMENT, KshanaCli.EVIDENCE_NOTICE,
            KshanaCli.EXPORT_NOTICE, KshanaCli.ROUTE_NOTICE, KshanaCli.EVIDENCE_PACK_NOTICE, KshanaCli.TIMESTAMP_NOTICE,
        ) + (0..4).map { KshanaCli.evidenceVerdict(it) } + xml
        for (t in texts) assertFalse("banned word in: ${banned.find(t)?.value}", banned.containsMatchIn(t))
    }

    @Test
    fun evidenceVerifyPinsTheKeyAndNeverAllowsAnUnpinnedSigner() {
        assertEquals(
            listOf("kshana", "evidence", "verify", "/p", "--pubkey", "ab", "--json"),
            KshanaCli.evidenceVerifyCommand("kshana", "/p", "ab", null),
        )
        assertEquals(
            listOf("kshana", "evidence", "verify", "/p", "--pubkey", "ab", "--log", "/s.nmea", "--json"),
            KshanaCli.evidenceVerifyCommand("kshana", "/p", "ab", "/s.nmea"),
        )
        assertFalse(KshanaCli.evidenceVerifyCommand("kshana", "/p", "ab", "/s").contains("--allow-unpinned"))
    }

    @Test
    fun onlyExitZeroReadsAsVerified() {
        assertTrue(KshanaCli.evidenceVerdict(0).startsWith("VERIFIED"))
        for (code in listOf(1, 2, 3, 4, 137)) {
            assertTrue("exit $code", KshanaCli.evidenceVerdict(code).startsWith("NOT "))
        }
        assertTrue(KshanaCli.evidenceVerdict(3).contains("INTACT, BUT THE SIGNER IS NOT PINNED"))
        assertTrue(KshanaCli.EVIDENCE_NOTICE.contains("does not show the log is genuine"))
    }

    @Test
    fun exampleCommandsAndNames() {
        assertEquals(listOf("kshana", "example"), KshanaCli.exampleListCommand("kshana"))
        assertEquals(listOf("kshana", "example", "clock-holdover"), KshanaCli.exampleCommand("kshana", "clock-holdover"))
        assertEquals(listOf("a-b", "c_d"), KshanaCli.parseExampleNames("a-b\n\n  c_d \n"))
        assertTrue(KshanaCli.isSafeExampleName("clock-holdover"))
        assertFalse(KshanaCli.isSafeExampleName("../x"))
        assertFalse(KshanaCli.isSafeExampleName("a b"))
        assertFalse(KshanaCli.isSafeExampleName(""))
    }

    @Test
    fun exportCommandsUseTheRightFlag() {
        val f = KshanaCli.ExportFormat.values().associateBy { it.key }
        assertEquals(listOf("kshana", "/s.toml", "--export-sp3", "/s.sp3"), KshanaCli.exportCommand("kshana", "/s.toml", f.getValue("sp3")))
        assertEquals(listOf("kshana", "/s.toml", "--export-omm", "/s.omm"), KshanaCli.exportCommand("kshana", "/s.toml", f.getValue("omm")))
        assertEquals(listOf("kshana", "/s.toml", "--export-oem", "/s.oem"), KshanaCli.exportCommand("kshana", "/s.toml", f.getValue("oem")))
        for (k in listOf("czml", "kml", "geojson", "stk", "sigmf")) {
            assertEquals(listOf("kshana", "/s.toml", "--export", k), KshanaCli.exportCommand("kshana", "/s.toml", f.getValue(k)))
        }
        assertEquals(8, f.size)
    }

    @Test
    fun animateAndRouteCommands() {
        assertEquals(listOf("kshana", "/s.toml", "--animate", "html"), KshanaCli.animateCommand("kshana", "/s.toml", "html"))
        assertEquals("/d/s.animation.svg", KshanaCli.animationPath("/d/s.toml", "svg"))
        assertEquals(
            listOf("kshana", "/s.toml", "--import-route", "/r.geojson"),
            KshanaCli.importRouteCommand("kshana", "/s.toml", "/r.geojson"),
        )
    }

    @Test
    fun evidencePackAndTimestampCommands() {
        assertEquals(
            listOf("kshana", "receiver-trust", "evidence", "/s.toml", "--from", "100", "--to", "260", "--key", "/k", "--out", "/p"),
            KshanaCli.evidencePackCommand("kshana", "/s.toml", "100", "260", "/k", "/p", null),
        )
        assertEquals(
            listOf("kshana", "receiver-trust", "evidence", "/s.toml", "--from", "1", "--to", "2", "--key", "/k", "--out", "/p", "--title", "Berth 4"),
            KshanaCli.evidencePackCommand("kshana", "/s.toml", "1", "2", "/k", "/p", "Berth 4"),
        )
        // The plugin has no keygen: no command it builds ever contains it.
        assertFalse(KshanaCli.evidencePackCommand("kshana", "/s", "1", "2", "/k", "/p", "t").contains("keygen"))
        assertEquals(
            listOf("kshana", "evidence", "attach-timestamp", "/p", "/t.tsr"),
            KshanaCli.attachTimestampCommand("kshana", "/p", "/t.tsr"),
        )
        assertFalse(KshanaCli.attachTimestampCommand("kshana", "/p", "/t.tsr").contains("--replace"))
        assertTrue(KshanaCli.TIMESTAMP_NOTICE.contains("does not check the timestamp authority's signature"))
        assertTrue(KshanaCli.opensslTimestampCheck("/p").startsWith("openssl ts -verify"))
        assertTrue(KshanaCli.EVIDENCE_PACK_NOTICE.contains("never makes, reads or stores"))
    }
}
