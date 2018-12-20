module Language exposing (availableLanguages, langFromFlag, langToString)

import Json.Decode as Decode exposing (Error)
import Translations exposing (Lang(..))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langFromFlag : Result Error String -> Lang
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
