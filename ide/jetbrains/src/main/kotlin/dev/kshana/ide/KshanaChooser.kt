// SPDX-License-Identifier: AGPL-3.0-only
package dev.kshana.ide

import com.intellij.openapi.fileChooser.FileChooserDescriptor
import com.intellij.openapi.project.Project
import com.intellij.openapi.ui.ComboBox
import com.intellij.openapi.ui.DialogWrapper
import com.intellij.ui.components.JBLabel
import java.awt.BorderLayout
import javax.swing.JComponent
import javax.swing.JPanel

/** Platform UI helpers that stay on API that is neither deprecated nor scheduled for removal
 *  from the since-build (2024.3) to the newest platform the verifier checks. */
internal object KshanaChooser {
    /**
     * A modal "pick one" dialog: `message` above a drop-down of `values`, `initial` selected.
     * Returns the chosen index, or -1 when cancelled. Replaces `Messages.showChooseDialog`,
     * deprecated in the platform, with the same contract.
     */
    fun chooseOne(project: Project?, message: String, title: String, values: List<String>, initial: String): Int {
        if (values.isEmpty()) return -1
        val dialog = ChooseOneDialog(project, message, title, values, values.indexOf(initial).coerceAtLeast(0))
        return if (dialog.showAndGet()) dialog.selectedIndex() else -1
    }

    /** A chooser for one file (no folders, no archives as folders, no multiple selection).
     *  Replaces the deprecated no-argument `FileChooserDescriptorFactory.createSingleFileDescriptor()`;
     *  the constructor is the form both 2024.3 and the newest platforms accept. */
    fun singleFile(): FileChooserDescriptor = FileChooserDescriptor(true, false, false, false, false, false)

    private class ChooseOneDialog(
        project: Project?,
        private val message: String,
        dialogTitle: String,
        values: List<String>,
        initial: Int,
    ) : DialogWrapper(project) {
        private val combo = ComboBox(values.toTypedArray()).apply { selectedIndex = initial }

        init {
            title = dialogTitle
            init()
        }

        fun selectedIndex(): Int = combo.selectedIndex

        override fun getPreferredFocusedComponent(): JComponent = combo

        override fun createCenterPanel(): JComponent =
            JPanel(BorderLayout(0, 8)).apply {
                add(JBLabel(message), BorderLayout.NORTH)
                add(combo, BorderLayout.CENTER)
            }
    }
}
