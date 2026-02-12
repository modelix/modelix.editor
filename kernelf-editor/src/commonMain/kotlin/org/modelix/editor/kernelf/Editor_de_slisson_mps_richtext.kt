package org.modelix.editor.kernelf

import de.slisson.mps.richtext.L_de_slisson_mps_richtext
import org.modelix.aspects.languageAspects
import org.modelix.editor.editor

val Editor_de_slisson_mps_richtext =
    languageAspects(L_de_slisson_mps_richtext) {
        editor(language.Text) {
            concept.words.horizontal()
        }
        editor(language.Word) {
            concept.escapedValue.cell {
                placeholderText("")
            }
        }
    }
