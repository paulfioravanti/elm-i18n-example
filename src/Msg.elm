module Msg exposing (Msg(..))

import Translations exposing (Lang)


type Msg
    = ChangeLanguage Lang
    | CloseAvailableLanguages
    | ShowAvailableLanguages
