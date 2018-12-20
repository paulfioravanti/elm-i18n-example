port module Cmd exposing (storeLanguage)

import Translations exposing (Lang)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> Translations.getCodeFromLn
        |> storeLanguageInLocalStorage
