// SPDX-License-Identifier: AGPL-3.0-only
package dev.kshana.ide

import com.intellij.openapi.actionSystem.ActionUpdateThread
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.fileChooser.FileChooser
import com.intellij.openapi.fileChooser.FileChooserDescriptorFactory
import com.intellij.openapi.ui.Messages

/** Base: an action on one selected file, enabled when [accepts] the file's name. */
abstract class KshanaFileAction : AnAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.BGT

    abstract fun accepts(fileName: String): Boolean

    override fun update(e: AnActionEvent) {
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE)
        e.presentation.isEnabledAndVisible =
            e.project != null && file != null && !file.isDirectory && accepts(file.name)
    }

    protected fun binary(): String = KshanaCli.resolveBinary(KshanaSettings.getInstance().state.binaryPath)
}

/** Right-click a `receiver-trust` scenario `.toml` → "Assess Receiver Trust (Kshana)". */
class AssessReceiverTrustAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isScenarioFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        KshanaRunner.run(
            project,
            "Assessing receiver trust",
            KshanaCli.receiverTrustCommand(binary(), file.path),
            file.parent?.path,
            KshanaCli.ADVISORY_NOTICE,
        )
    }
}

/** Right-click a `nmea-scenario` `.toml` → "Generate Training NMEA (Kshana)". */
class GenerateTrainingNmeaAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isScenarioFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        KshanaRunner.run(
            project,
            "Generating training NMEA",
            KshanaCli.nmeaScenarioCommand(binary(), file.path),
            file.parent?.path,
            KshanaCli.TRAINING_NOTICE,
        )
    }
}

/** Right-click an ADS-B or AIS `.csv` → "Build Interference Map (Kshana)": asks which
 *  approved dataset it is, then writes one GeoJSON per UTC day next to the file. */
class BuildInterferenceMapAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isMapInputFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val datasets = KshanaCli.MapDataset.values()
        val choice = Messages.showChooseDialog(
            project,
            "Which approved dataset is ${file.name}? (Another licence: use the command line with --dataset custom.)",
            "Build Interference Map",
            Messages.getQuestionIcon(),
            datasets.map { it.label }.toTypedArray(),
            datasets[0].label,
        )
        if (choice < 0) return
        val out = (file.parent?.path ?: ".") + "/interference-map-" + file.nameWithoutExtension
        KshanaRunner.run(
            project,
            "Building interference map",
            KshanaCli.interferenceMapCommand(binary(), file.path, datasets[choice], out),
            file.parent?.path,
            KshanaCli.MAP_NOTICE,
        )
    }
}

/** Right-click a route (GeoJSON LineString or `lat,lon` CSV) → "Route Exposure (Kshana)":
 *  asks for the folder of interference maps, then prints the shares of the route. */
class RouteExposureAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isRouteFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val maps = FileChooser.chooseFile(
            FileChooserDescriptorFactory.createSingleFolderDescriptor()
                .withTitle("Folder of interference maps (GeoJSON)"),
            project,
            file.parent,
        ) ?: return
        KshanaRunner.run(
            project,
            "Computing route exposure",
            KshanaCli.routeExposureCommand(binary(), file.path, maps.path),
            file.parent?.path,
            KshanaCli.MAP_NOTICE,
        )
    }
}

/** Right-click a scenario `.toml` → "Export Test-Bench Files (Kshana)": writes the motion, NMEA
 *  and event files for a laboratory simulator next to the scenario. */
class BenchExportAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isScenarioFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val out = (file.parent?.path ?: ".") + "/bench-" + file.nameWithoutExtension
        KshanaRunner.run(
            project,
            "Exporting test-bench files",
            KshanaCli.benchExportCommand(binary(), file.path, out),
            file.parent?.path,
            KshanaCli.BENCH_NOTICE,
        )
    }
}

/** Right-click a run result `.json` → "Build Compliance Report (Kshana)": fills the public-framework
 *  mapping from that result. The engine's statement is printed with it, word for word. */
class ComplianceReportAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isResultFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val out = (file.parent?.path ?: ".") + "/compliance-" + file.nameWithoutExtension
        KshanaRunner.run(
            project,
            "Building compliance report",
            KshanaCli.complianceReportCommand(binary(), out, listOf(file.path)),
            file.parent?.path,
            KshanaCli.COMPLIANCE_STATEMENT,
        )
    }
}

/** Tools menu → "Show Compliance Mapping (Kshana)": the static mapping tables, no run needed. */
class ComplianceMappingAction : AnAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.BGT

    override fun update(e: AnActionEvent) {
        e.presentation.isEnabledAndVisible = e.project != null
    }

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val bin = KshanaCli.resolveBinary(KshanaSettings.getInstance().state.binaryPath)
        KshanaRunner.run(
            project,
            "Showing compliance mapping",
            KshanaCli.complianceMappingCommand(bin),
            project.basePath,
            KshanaCli.COMPLIANCE_STATEMENT,
        )
    }
}
