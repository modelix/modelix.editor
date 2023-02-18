package org.modelix.editor.kernelf

import jetbrains.mps.lang.test.L_jetbrains_mps_lang_test
import org.modelix.aspects.languageAspects
import org.modelix.editor.conceptEditor

val Editor_jetbrains_mps_lang_test = languageAspects(L_jetbrains_mps_lang_test) {
    conceptEditor(language.TestInfo) {
        vertical {
            horizontal {
                "Project Path  :".constant()
                concept.projectPath.cell()
            }
            horizontal {
                "ReOpen Project:".constant()
                concept.reOpenProject.cell {
                    placeholderText("false")
                }
            }
        }

    }
}