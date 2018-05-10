module Translations exposing (Lang(..), getLnFromCode)


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
