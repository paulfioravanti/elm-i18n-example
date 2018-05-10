module Main exposing (main)

import Html exposing (Html, article, div, h1, main_, text)
import Html.Attributes exposing (class)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        classes =
            [ "bg-dark-pink"
            , "overflow-container"
            , "sans-serif"
            , "white"
            ]
                |> String.join " "
                |> class
    in
        main_ [ classes ]
            [ content ]


content : Html Msg
content =
    let
        articleClasses =
            [ "dt"
            , "vh-100"
            , "w-100"
            ]
                |> String.join " "
                |> class

        divClasses =
            [ "dtc"
            , "ph3 ph4-l"
            , "tc"
            , "v-mid"
            ]
                |> String.join " "
                |> class
    in
        article [ articleClasses ]
            [ div [ divClasses ]
                [ heading ]
            ]


heading : Html Msg
heading =
    let
        classes =
            [ "f6 f2m"
            , "f-subheadline-l"
            , "fw6"
            , "tc"
            ]
                |> String.join " "
                |> class
    in
        h1 [ classes ]
            [ text "Vertically centering things in css is easy!" ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
