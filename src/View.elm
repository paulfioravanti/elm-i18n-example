module View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, article, div, h1, main_, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import LanguageDropdown
import Model exposing (Model)
import Msg exposing (Msg)
import Styles
import Translations exposing (Lang)


view : Model -> Document Msg
view model =
    { title = model.title
    , body =
        [ main_ [ class Styles.main_, onClick Msg.CloseAvailableLanguages ]
            [ LanguageDropdown.view model
            , content model.currentLanguage
            ]
        ]
    }


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
