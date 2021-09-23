module Utils exposing (html)

import Html exposing (Html)
import Model exposing (Model)
import Msg exposing (Msg)
import View


html : Model -> Html Msg
html model =
    model
        |> View.view
        |> .body
        |> List.head
        |> Maybe.withDefault (Html.text "")
