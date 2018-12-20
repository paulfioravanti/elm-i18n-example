module Subscriptions exposing (subscriptions)

import Browser.Events as Events
import Json.Decode as Decode
import Model exposing (Model)
import Msg exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    -- There is currently an issue in Elm with conditional subscriptions,
    -- so this app cannot be upgraded as-is to 0.19. See:
    -- https://github.com/elm/core/issues/980
    -- https://github.com/elm/core/issues/993
    if model.showAvailableLanguages then
        Events.onClick (Decode.succeed CloseAvailableLanguages)

    else
        Sub.none
