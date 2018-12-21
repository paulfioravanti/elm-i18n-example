module Model exposing (Flags, Model, init)

import Json.Decode as Decode exposing (Value)
import Language
import Msg exposing (Msg)
import Translations exposing (Lang)


type alias Flags =
    { language : Value }


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , title : String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        language =
            flags.language
                |> Decode.decodeValue Decode.string
                |> Language.langFromFlag
    in
    ( { currentLanguage = language
      , showAvailableLanguages = False
      , title = Translations.title language
      }
    , Cmd.none
    )
