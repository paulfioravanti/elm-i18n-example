port module Cmd exposing (storeLanguage)

import Json.Encode as Encode exposing (Value)
import Translations exposing (Lang)


port outbound : Value -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> Translations.getCodeFromLn
        |> Encode.string
        |> outbound
