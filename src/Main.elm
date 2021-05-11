module Main exposing (main)

import Browser
import Model exposing (Flags, Model)
import Msg exposing (Msg)
import Translations
import Update
import View


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = Update.update
        , view = View.view
        , subscriptions = always Sub.none
        }



-- PRIVATE


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        language =
            Translations.getLnFromFlag flags.language
    in
    ( Model.init language, Cmd.none )
