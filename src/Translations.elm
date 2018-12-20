module Translations exposing
    ( Lang(..)
    , getCodeFromLn
    , getLnFromCode
    , verticallyCenteringInCssIsEasy
    )


type Lang
    = En
    | It
    | Ja


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


getCodeFromLn : Lang -> String
getCodeFromLn code =
    case code of
        En ->
            "en"

        It ->
            "it"

        Ja ->
            "ja"


verticallyCenteringInCssIsEasy : Lang -> String
verticallyCenteringInCssIsEasy lang =
    case lang of
        En ->
            "Vertically centering things in css is easy!"

        It ->
            "Centrare verticalmente con css è facile!"

        Ja ->
            "CSSで垂直センタリングは簡単だよ！"
