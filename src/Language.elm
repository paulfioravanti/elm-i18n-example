module Language exposing (availableLanguages, langToString)

import Translations exposing (Lang(En, It, Ja))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langToString : Lang -> String
langToString language =
    case language of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"
