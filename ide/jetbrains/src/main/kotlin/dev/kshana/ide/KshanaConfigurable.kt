// SPDX-License-Identifier: Apache-2.0
package dev.kshana.ide

import com.intellij.openapi.options.Configurable
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.util.ui.FormBuilder
import javax.swing.JComponent

/** Settings → Tools → Kshana: configure the path to the `kshana` binary. */
class KshanaConfigurable : Configurable {
    private var field: TextFieldWithBrowseButton? = null

    override fun getDisplayName(): String = "Kshana"

    override fun createComponent(): JComponent {
        val f = TextFieldWithBrowseButton()
        f.text = KshanaSettings.getInstance().state.binaryPath ?: ""
        field = f
        return FormBuilder.createFormBuilder()
            .addLabeledComponent("kshana binary path (blank = use PATH):", f, 1, false)
            .addComponentFillVertically(javax.swing.JPanel(), 0)
            .panel
    }

    override fun isModified(): Boolean =
        (field?.text ?: "") != (KshanaSettings.getInstance().state.binaryPath ?: "")

    override fun apply() {
        KshanaSettings.getInstance().state.binaryPath = field?.text?.trim() ?: ""
    }

    override fun reset() {
        field?.text = KshanaSettings.getInstance().state.binaryPath ?: ""
    }

    override fun disposeUIResources() {
        field = null
    }
}
