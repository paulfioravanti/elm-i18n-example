module Translations exposing
    ( Lang
    , availableLanguages
    , getCodeFromLn
    , getLnFromFlag
    , language
    , title
    , verticallyCenteringInCssIsEasy
    )

import Json.Decode as Decode exposing (Error, Value)


type Lang
    = En
    | It
    | Ja


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


getCodeFromLn : Lang -> String
getCodeFromLn code =
    case code of
        En ->
            "en"

        It ->
            "it"

        Ja ->
            "ja"


getLnFromFlag : Value -> Lang
getLnFromFlag languageFlag =
    let
        decodedLanguage : Result Error String
        decodedLanguage =
            Decode.decodeValue Decode.string languageFlag
    in
    case decodedLanguage of
        Ok lang ->
            getLnFromCode lang

        Err _ ->
            En


language : Lang -> String
language lang =
    case lang of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"


title : Lang -> String
title lang =
    case lang of
        En ->
            "Multilingualisation in Elm"

        It ->
            "Multilingualizzazione in Elm"

        Ja ->
            "Elmにおける多言語化"


verticallyCenteringInCssIsEasy : Lang -> String
verticallyCenteringInCssIsEasy lang =
    case lang of
        En ->
            "Vertically centering things in css is easy!"

        It ->
            "Centrare verticalmente con css è facile!"

        Ja ->
            "CSSで垂直センタリングは簡単だよ！"



-- PRIVATE


getLnFromCode : String -> Lang
getLnFromCode code =
    case code of
        "en" ->
            En

        "it" ->
            It

        "ja" ->
            Ja

        _ ->
            En
