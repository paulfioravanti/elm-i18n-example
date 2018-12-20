module Main exposing (main)

import Browser
import Model exposing (Flags, Model)
import Msg exposing (Msg)
import Subscriptions
import Update
import View


main : Program Flags Model Msg
main =
    Browser.element
        { init = Model.init
        , update = Update.update
        , view = View.view
        , subscriptions = Subscriptions.subscriptions
        }
