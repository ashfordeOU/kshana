// SPDX-License-Identifier: Apache-2.0
package dev.kshana.ide

import com.intellij.openapi.project.Project
import com.intellij.openapi.wm.ToolWindow
import com.intellij.openapi.wm.ToolWindowFactory
import com.intellij.ui.content.ContentFactory

/** The "Kshana" bottom tool window — hosts the scenario-output console. */
class KshanaToolWindowFactory : ToolWindowFactory {
    override fun createToolWindowContent(project: Project, toolWindow: ToolWindow) {
        val console = KshanaConsole.getInstance(project).console
        val content = ContentFactory.getInstance().createContent(console.component, "", false)
        toolWindow.contentManager.addContent(content)
    }
}
