// SPDX-License-Identifier: AGPL-3.0-only
package dev.kshana.ide

import com.intellij.execution.configurations.GeneralCommandLine
import com.intellij.execution.ui.ConsoleViewContentType
import com.intellij.execution.util.ExecUtil
import com.intellij.ide.BrowserUtil
import com.intellij.openapi.actionSystem.ActionUpdateThread
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.fileChooser.FileChooser
import com.intellij.openapi.fileChooser.FileChooserDescriptorFactory
import com.intellij.openapi.fileEditor.FileEditorManager
import com.intellij.openapi.progress.ProgressIndicator
import com.intellij.openapi.progress.Task
import com.intellij.openapi.project.Project
import com.intellij.openapi.ui.Messages
import com.intellij.openapi.vfs.LocalFileSystem
import java.io.File

private fun kshanaBinary(): String = KshanaCli.resolveBinary(KshanaSettings.getInstance().state.binaryPath)

/** Tools menu or a folder in the project view → "Insert Example Scenario (Kshana)": lists the bundled
 *  scenarios (`kshana example`), asks which one, and writes it as a new `.toml` (never over a file). */
class InsertExampleAction : AnAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.BGT

    override fun update(e: AnActionEvent) {
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE)
        e.presentation.isEnabledAndVisible = e.project != null && (file == null || file.isDirectory)
    }

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val selected = e.getData(CommonDataKeys.VIRTUAL_FILE)
        val dirPath = (if (selected != null && selected.isDirectory) selected.path else project.basePath) ?: return
        val bin = kshanaBinary()
        object : Task.Backgroundable(project, "Listing Kshana examples", true) {
            override fun run(indicator: ProgressIndicator) {
                val out = try {
                    ExecUtil.execAndGetOutput(GeneralCommandLine(KshanaCli.exampleListCommand(bin)).withWorkDirectory(dirPath))
                } catch (ex: Exception) {
                    report(project, "error: ${ex.message}", true)
                    return
                }
                val names = KshanaCli.parseExampleNames(out.stdout).filter { KshanaCli.isSafeExampleName(it) }
                if (out.exitCode != 0 || names.isEmpty()) {
                    report(project, "kshana example listed nothing (exit ${out.exitCode}): ${out.stderr}", true)
                    return
                }
                ApplicationManager.getApplication().invokeLater { choose(project, bin, dirPath, names) }
            }
        }.queue()
    }

    private fun choose(project: Project, bin: String, dirPath: String, names: List<String>) {
        val i = Messages.showChooseDialog(
            project,
            "Which bundled scenario? It is written to $dirPath as <name>.toml.",
            "Insert Example Scenario",
            Messages.getQuestionIcon(),
            names.toTypedArray(),
            names[0],
        )
        if (i < 0) return
        val name = names[i]
        val target = File(dirPath, "$name.toml")
        if (target.exists()) {
            Messages.showErrorDialog(project, "${target.path} already exists; it is not overwritten.", "Insert Example Scenario")
            return
        }
        object : Task.Backgroundable(project, "Writing $name.toml", true) {
            override fun run(indicator: ProgressIndicator) {
                val out = try {
                    ExecUtil.execAndGetOutput(GeneralCommandLine(KshanaCli.exampleCommand(bin, name)).withWorkDirectory(dirPath))
                } catch (ex: Exception) {
                    report(project, "error: ${ex.message}", true)
                    return
                }
                if (out.exitCode != 0 || out.stdout.isEmpty()) {
                    report(project, "kshana example $name failed (exit ${out.exitCode}): ${out.stderr}", true)
                    return
                }
                target.writeText(out.stdout)
                report(project, "wrote ${target.path}", false)
                ApplicationManager.getApplication().invokeLater {
                    LocalFileSystem.getInstance().refreshAndFindFileByIoFile(target)?.let {
                        FileEditorManager.getInstance(project).openFile(it, true)
                    }
                }
            }
        }.queue()
    }
}

private fun report(project: Project, line: String, error: Boolean) {
    val console = KshanaConsole.getInstance(project).console
    console.print(line + "\n", if (error) ConsoleViewContentType.ERROR_OUTPUT else ConsoleViewContentType.SYSTEM_OUTPUT)
}

/** Right-click a scenario `.toml` → "Export Scenario (Kshana)": asks the format, writes it next to the scenario. */
class ExportScenarioAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isScenarioFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val formats = KshanaCli.ExportFormat.values()
        val i = Messages.showChooseDialog(
            project,
            "Export format for ${file.name}:",
            "Export Scenario",
            Messages.getQuestionIcon(),
            formats.map { it.label }.toTypedArray(),
            formats[0].label,
        )
        if (i < 0) return
        KshanaRunner.run(
            project,
            "Exporting scenario",
            KshanaCli.exportCommand(binary(), file.path, formats[i]),
            file.parent?.path,
            KshanaCli.EXPORT_NOTICE,
        )
    }
}

/** Right-click a scenario `.toml` → "Animate Scenario (Kshana)": runs it with `--animate` and opens the result. */
class AnimateScenarioAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isScenarioFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val formats = arrayOf("html", "svg")
        val i = Messages.showChooseDialog(
            project,
            "Animation format for ${file.name} (opened in the browser when the run finishes):",
            "Animate Scenario",
            Messages.getQuestionIcon(),
            formats,
            formats[0],
        )
        if (i < 0) return
        val format = formats[i]
        val result = File(KshanaCli.animationPath(file.path, format))
        KshanaRunner.run(
            project,
            "Animating scenario",
            KshanaCli.animateCommand(binary(), file.path, format),
            file.parent?.path,
            null,
            null,
        ) {
            if (result.isFile) {
                ApplicationManager.getApplication().invokeLater { BrowserUtil.browse(result) }
            } else {
                report(project, "note: ${result.path} was not written", true)
            }
        }
    }
}

/** Right-click a route `.geojson` → "Import Route (Kshana)": asks which scenario uses it and runs with `--import-route`. */
class ImportRouteAction : KshanaFileAction() {
    override fun accepts(fileName: String) =
        fileName.endsWith(".geojson", ignoreCase = true) || fileName.endsWith(".json", ignoreCase = true)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val route = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val scenario = FileChooser.chooseFile(
            FileChooserDescriptorFactory.createSingleFileDescriptor("toml").withTitle("Scenario that uses this route"),
            project,
            route.parent,
        ) ?: return
        KshanaRunner.run(
            project,
            "Running with an imported route",
            KshanaCli.importRouteCommand(binary(), scenario.path, route.path),
            scenario.parent?.path,
            KshanaCli.ROUTE_NOTICE,
        )
    }
}

/** Right-click a receiver-trust session `.toml` → "Create Evidence Pack (Kshana)": asks the window, a key file the
 *  user already has, and an output folder. The plugin never makes, reads or stores a key. */
class CreateEvidencePackAction : KshanaFileAction() {
    override fun accepts(fileName: String) = KshanaCli.isScenarioFile(fileName)

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val session = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val from = Messages.showInputDialog(
            project, "Window start: seconds since the first epoch, or ISO-8601 UTC (for example 100 or 2026-01-02T03:04:05Z).",
            "Create Evidence Pack", Messages.getQuestionIcon(),
        )?.trim()
        if (from.isNullOrEmpty()) return
        val to = Messages.showInputDialog(
            project, "Window end (same forms as the start).", "Create Evidence Pack", Messages.getQuestionIcon(),
        )?.trim()
        if (to.isNullOrEmpty()) return
        val key = FileChooser.chooseFile(
            FileChooserDescriptorFactory.createSingleFileDescriptor().withTitle("Your signing key file (64 hex digits; never made by this plugin)"),
            project,
            session.parent,
        ) ?: return
        val outName = Messages.showInputDialog(
            project,
            "Folder name for the new pack, created next to the scenario (it must not already hold files).",
            "Create Evidence Pack",
            Messages.getQuestionIcon(),
            session.nameWithoutExtension + "-evidence-pack",
            null,
        )?.trim()
        if (outName.isNullOrEmpty() || outName.contains('/') || outName.contains('\\')) return
        val title = Messages.showInputDialog(
            project, "Optional title for the pack (leave empty for the default).", "Create Evidence Pack", Messages.getQuestionIcon(),
        )?.trim()
        val out = (session.parent?.path ?: ".") + "/" + outName
        KshanaRunner.run(
            project,
            "Creating evidence pack",
            KshanaCli.evidencePackCommand(binary(), session.path, from, to, key.path, out, title),
            session.parent?.path,
            KshanaCli.ADVISORY_NOTICE + "\n" + KshanaCli.EVIDENCE_PACK_NOTICE,
        )
    }
}

/** Right-click an evidence-pack folder → "Attach Timestamp (Kshana)": adds an RFC 3161 token you obtained. */
class AttachTimestampAction : AnAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.BGT

    override fun update(e: AnActionEvent) {
        val dir = e.getData(CommonDataKeys.VIRTUAL_FILE)
        e.presentation.isEnabledAndVisible =
            e.project != null && dir != null && dir.isDirectory && dir.findChild("manifest.json") != null
    }

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val dir = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val token = FileChooser.chooseFile(
            FileChooserDescriptorFactory.createSingleFileDescriptor("tsr").withTitle("Timestamp response (.tsr) from your authority"),
            project,
            dir.parent,
        ) ?: return
        KshanaRunner.run(
            project,
            "Attaching timestamp",
            KshanaCli.attachTimestampCommand(kshanaBinary(), dir.path, token.path),
            dir.parent?.path,
            KshanaCli.TIMESTAMP_NOTICE + "\n" + KshanaCli.opensslTimestampCheck(dir.path),
        )
    }
}
