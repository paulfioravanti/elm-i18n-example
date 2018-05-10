module Msg exposing (Msg(..))

import Http exposing (Error)
import I18Next exposing (Translations)
import Translations exposing (Lang)


type Msg
    = ChangeLanguage Lang
    | CloseAvailableLanguages
    | FetchTranslations (Result Error Translations)
    | ShowAvailableLanguages
