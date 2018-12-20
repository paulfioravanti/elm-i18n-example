module Language exposing (availableLanguages, langFromFlag, langToString)

import Translations exposing (Lang(..))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langFromFlag : Result String String -> Lang
langFromFlag languageFlag =
    case languageFlag of
        Ok language ->
            Translations.getLnFromCode language

        Err _ ->
            En


langToString : Lang -> String
langToString language =
    case language of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"
