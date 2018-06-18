module LanguageDropdown exposing (view)

import Html exposing (Html, div, li, p, span, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Language
import Model exposing (Model)
import Msg exposing (Msg(ChangeLanguage, ShowAvailableLanguages))
import Styles
import Translations exposing (Lang)


view : Model -> Html Msg
view model =
    div [ class Styles.dropdownContainer ]
        [ currentSelection model
        , dropdownList model
        ]


currentSelection : Model -> Html Msg
currentSelection model =
    p
        [ class (Styles.currentSelection model.showAvailableLanguages)
        , onClick ShowAvailableLanguages
        ]
        [ span []
            [ text (Language.langToString model.currentLanguage) ]
        , span [ class Styles.caret ]
            [ text "▾" ]
        ]


dropdownList : Model -> Html Msg
dropdownList model =
    let
        selectableLanguages =
            List.filter
                (\language -> language /= model.currentLanguage)
                Language.availableLanguages
    in
        ul [ class (Styles.dropdownList model.showAvailableLanguages) ]
            (List.map dropdownListItem selectableLanguages)


dropdownListItem : Lang -> Html Msg
dropdownListItem language =
    li
        [ class Styles.dropdownListItem
        , onClick (ChangeLanguage language)
        ]
        [ span []
            [ text (Language.langToString language) ]
        ]
