module Main exposing (main)

import Html exposing (Html, article, div, h1, main_, text)
import Html.Attributes exposing (class)
import LanguageDropdown
import Model exposing (Model)
import Mouse
import Msg exposing (Msg(CloseAvailableLanguages, ShowAvailableLanguages))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }, Cmd.none )

        ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    let
        classes =
            [ "bg-dark-pink"
            , "pt3"
            , "overflow-container"
            , "sans-serif"
            , "vh-100"
            , "white"
            ]
                |> String.join " "
                |> class
    in
        main_ [ classes ]
            [ LanguageDropdown.view model
            , content
            ]


content : Html Msg
content =
    let
        articleClasses =
            [ "dt"
            , "vh-75"
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


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.showAvailableLanguages then
        Mouse.clicks (\_ -> CloseAvailableLanguages)
    else
        Sub.none


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = Model.init
        , update = update
        , subscriptions = subscriptions
        }
