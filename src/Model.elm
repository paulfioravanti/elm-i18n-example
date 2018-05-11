module Model exposing (Flags, Model, init)

import Cmd
import I18Next exposing (Translations)
import Json.Decode as Decode exposing (Value)
import Language
import Msg exposing (Msg)
import Translations exposing (Lang(En))


type alias Flags =
    { language : Value }


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , translations : Translations
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
          , translations = I18Next.initialTranslations
          }
        , Cmd.fetchTranslations language
        )
