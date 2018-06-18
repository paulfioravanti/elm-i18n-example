module Main exposing (main)

import Cmd
import Html exposing (Html, article, div, h1, main_, text)
import Html.Attributes exposing (class)
import LanguageDropdown
import Model exposing (Flags, Model)
import Mouse
import Msg
    exposing
        ( Msg
            ( ChangeLanguage
            , CloseAvailableLanguages
            , ShowAvailableLanguages
            )
        )
import Styles
import Translations exposing (Lang)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.storeLanguage language
            )

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
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view model
        , content model.currentLanguage
        ]


content : Lang -> Html Msg
content language =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading language ]
        ]


heading : Lang -> Html Msg
heading language =
    h1 [ class Styles.heading ]
        [ text (Translations.verticallyCenteringInCssIsEasy language) ]


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
