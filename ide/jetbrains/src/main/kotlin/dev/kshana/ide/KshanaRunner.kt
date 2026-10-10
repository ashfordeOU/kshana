// SPDX-License-Identifier: AGPL-3.0-only
package dev.kshana.ide

import com.intellij.execution.configurations.GeneralCommandLine
import com.intellij.execution.ui.ConsoleViewContentType
import com.intellij.execution.util.ExecUtil
import com.intellij.openapi.progress.ProgressIndicator
import com.intellij.openapi.progress.Task
import com.intellij.openapi.project.Project
import com.intellij.openapi.wm.ToolWindowManager

/** Runs one `kshana` command in the background and streams its output into the Kshana tool
 *  window, with an optional notice line (a caveat that belongs with the result). */
object KshanaRunner {
    fun run(
        project: Project,
        title: String,
        cmd: List<String>,
        workDir: String?,
        notice: String? = null,
        verdict: ((Int) -> String)? = null,
    ) {
        val console = KshanaConsole.getInstance(project).console
        ToolWindowManager.getInstance(project).getToolWindow("Kshana")?.activate(null)
        console.print("\$ ${cmd.joinToString(" ")}\n", ConsoleViewContentType.SYSTEM_OUTPUT)
        if (notice != null) console.print("$notice\n", ConsoleViewContentType.SYSTEM_OUTPUT)

        object : Task.Backgroundable(project, title, true) {
            override fun run(indicator: ProgressIndicator) {
                val output = try {
                    ExecUtil.execAndGetOutput(GeneralCommandLine(cmd).withWorkDirectory(workDir))
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
                // A result that needs a plain verdict (the exit code decides it, never the text).
                if (verdict != null) {
                    console.print(verdict(output.exitCode) + "\n", type)
                }
            }
        }.queue()
    }
}
