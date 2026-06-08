// SPDX-License-Identifier: Apache-2.0
package dev.kshana.ide

import com.intellij.openapi.components.BaseState
import com.intellij.openapi.components.SimplePersistentStateComponent
import com.intellij.openapi.components.Service
import com.intellij.openapi.components.State
import com.intellij.openapi.components.Storage
import com.intellij.openapi.components.service

/** Persisted plugin settings (application level): the path to the `kshana` binary
 *  (blank → resolved from PATH). A light service — registered via the annotation, not
 *  in plugin.xml. */
@Service(Service.Level.APP)
@State(name = "KshanaSettings", storages = [Storage("kshana.xml")])
class KshanaSettings : SimplePersistentStateComponent<KshanaSettings.State>(State()) {
    class State : BaseState() {
        var binaryPath: String? by string("")
    }

    companion object {
        fun getInstance(): KshanaSettings = service()
    }
}
