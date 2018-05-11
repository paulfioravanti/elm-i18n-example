module Main exposing (main)

import Cmd
import Html exposing (Html, article, div, h1, main_, text)
import Html.Attributes exposing (class)
import I18Next exposing (Translations)
import LanguageDropdown
import Model exposing (Flags, Model)
import Mouse
import Msg
    exposing
        ( Msg
            ( ChangeLanguage
            , CloseAvailableLanguages
            , FetchTranslations
            , ShowAvailableLanguages
            )
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.fetchTranslations language
            )

        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }, Cmd.none )

        FetchTranslations (Ok translations) ->
            ( { model | translations = translations }, Cmd.none )

        FetchTranslations (Err msg) ->
            ( model, Cmd.none )

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
            , content model.translations
            ]


content : Translations -> Html Msg
content translations =
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
                [ heading translations ]
            ]


heading : Translations -> Html Msg
heading translations =
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
            [ text (I18Next.t translations "verticallyCenteringInCssIsEasy") ]


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.showAvailableLanguages then
        Mouse.clicks (\_ -> CloseAvailableLanguages)
    else
        Sub.none


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = Model.init
        , update = update
        , subscriptions = subscriptions
        }
