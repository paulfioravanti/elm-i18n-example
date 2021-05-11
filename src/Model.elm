module Model exposing (Flags, Model, init)

import Json.Decode exposing (Value)
import Translations exposing (Lang)


type alias Flags =
    { language : Value }


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , title : String
    }


init : Lang -> Model
init language =
    { currentLanguage = language
    , showAvailableLanguages = False
    , title = Translations.title language
    }
