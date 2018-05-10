module Model exposing (Model, init)

import Cmd
import I18Next exposing (Translations)
import Msg exposing (Msg)
import Translations exposing (Lang(En))


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , translations : Translations
    }


init : ( Model, Cmd Msg )
init =
    ( { currentLanguage = En
      , showAvailableLanguages = False
      , translations = I18Next.initialTranslations
      }
    , Cmd.fetchTranslations En
    )
