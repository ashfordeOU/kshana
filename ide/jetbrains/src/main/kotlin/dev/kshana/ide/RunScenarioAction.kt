// SPDX-License-Identifier: Apache-2.0
package dev.kshana.ide

import com.intellij.execution.configurations.GeneralCommandLine
import com.intellij.execution.ui.ConsoleViewContentType
import com.intellij.execution.util.ExecUtil
import com.intellij.openapi.actionSystem.ActionUpdateThread
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.progress.ProgressIndicator
import com.intellij.openapi.progress.Task
import com.intellij.openapi.wm.ToolWindowManager

/** Right-click a scenario `.toml` → "Run Kshana Scenario": runs the `kshana` CLI on the
 *  file and streams its output (summary + result JSON) into the Kshana tool window. */
class RunScenarioAction : AnAction() {
    override fun getActionUpdateThread(): ActionUpdateThread = ActionUpdateThread.BGT

    override fun update(e: AnActionEvent) {
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE)
        e.presentation.isEnabledAndVisible =
            e.project != null && file != null && !file.isDirectory && KshanaCli.isScenarioFile(file.name)
    }

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return
        val binary = KshanaCli.resolveBinary(KshanaSettings.getInstance().state.binaryPath)
        val cmd = KshanaCli.command(binary, file.path)
        val console = KshanaConsole.getInstance(project).console

        ToolWindowManager.getInstance(project).getToolWindow("Kshana")?.activate(null)
        console.print("\$ ${cmd.joinToString(" ")}\n", ConsoleViewContentType.SYSTEM_OUTPUT)

        object : Task.Backgroundable(project, "Running Kshana scenario", true) {
            override fun run(indicator: ProgressIndicator) {
                val output = try {
                    val cl = GeneralCommandLine(cmd).withWorkDirectory(file.parent?.path)
                    ExecUtil.execAndGetOutput(cl)
                } catch (ex: Exception) {
                    console.print("error: ${ex.message}\n", ConsoleViewContentType.ERROR_OUTPUT)
                    return
                }
                if (output.stdout.isNotEmpty()) {
                    console.print(output.stdout + "\n", ConsoleViewContentType.NORMAL_OUTPUT)
                }
                if (output.stderr.isNotEmpty()) {
                    console.print(output.stderr + "\n", ConsoleViewContentType.ERROR_OUTPUT)
                }
                val type =
                    if (output.exitCode == 0) ConsoleViewContentType.SYSTEM_OUTPUT
                    else ConsoleViewContentType.ERROR_OUTPUT
                console.print("[exit ${output.exitCode}]\n", type)
            }
        }.queue()
    }
}
