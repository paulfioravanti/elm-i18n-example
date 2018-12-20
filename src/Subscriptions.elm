module Subscriptions exposing (subscriptions)

import Model exposing (Model)
import Mouse
import Msg exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.showAvailableLanguages then
        Mouse.clicks (\_ -> CloseAvailableLanguages)

    else
        Sub.none
