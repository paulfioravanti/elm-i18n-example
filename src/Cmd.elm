port module Cmd exposing (storeLanguage)

import Debug
import Translations exposing (Lang)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> Debug.toString
        |> String.toLower
        |> storeLanguageInLocalStorage
