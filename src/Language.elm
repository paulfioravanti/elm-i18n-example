module Language exposing (availableLanguages, langFromFlag, langToString)

import Json.Decode as Decode exposing (Value)
import Translations exposing (Lang)


availableLanguages : List Lang
availableLanguages =
    [ Translations.En, Translations.It, Translations.Ja ]


langFromFlag : Value -> Lang
langFromFlag languageFlag =
    let
        decodedLanguage =
            languageFlag
                |> Decode.decodeValue Decode.string
    in
    case decodedLanguage of
        Ok language ->
            Translations.getLnFromCode language

        Err _ ->
            Translations.En


langToString : Lang -> String
langToString language =
    case language of
        Translations.En ->
            "English"

        Translations.It ->
            "Italiano"

        Translations.Ja ->
            "日本語"
