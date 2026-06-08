// SPDX-License-Identifier: Apache-2.0
package dev.kshana.ide

import com.intellij.execution.filters.TextConsoleBuilderFactory
import com.intellij.execution.ui.ConsoleView
import com.intellij.openapi.components.Service
import com.intellij.openapi.components.service
import com.intellij.openapi.project.Project

/** Per-project holder for the Kshana output console shown in the tool window. */
@Service(Service.Level.PROJECT)
class KshanaConsole(private val project: Project) {
    val console: ConsoleView by lazy {
        TextConsoleBuilderFactory.getInstance().createBuilder(project).console
    }

    companion object {
        fun getInstance(project: Project): KshanaConsole = project.service()
    }
}
