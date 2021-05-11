module LanguageDropdown exposing (view)

import Html exposing (Html, div, li, p, span, text, ul)
import Html.Attributes exposing (class)
import Html.Events as Events exposing (onClick)
import Json.Decode as Decode
import Model exposing (Model)
import Msg exposing (Msg)
import Styles
import Translations exposing (Lang)


view : Model -> Html Msg
view { currentLanguage, showAvailableLanguages } =
    let
        selectableLanguages : List Lang
        selectableLanguages =
            List.filter
                (\language -> language /= currentLanguage)
                Translations.availableLanguages
    in
    div [ class Styles.dropdownContainer ]
        [ currentSelection currentLanguage showAvailableLanguages
        , dropdownList showAvailableLanguages selectableLanguages
        ]


currentSelection : Lang -> Bool -> Html Msg
currentSelection currentLanguage showAvailableLanguages =
    p
        [ class (Styles.currentSelection showAvailableLanguages)
        , Events.custom "click"
            (Decode.succeed
                { message = Msg.ShowAvailableLanguages
                , stopPropagation = True
                , preventDefault = False
                }
            )
        ]
        [ span []
            [ text (Translations.language currentLanguage) ]
        , span [ class Styles.caret ]
            [ text "▾" ]
        ]


dropdownList : Bool -> List Lang -> Html Msg
dropdownList showAvailableLanguages selectableLanguages =
    ul [ class (Styles.dropdownList showAvailableLanguages) ]
        (List.map dropdownListItem selectableLanguages)


dropdownListItem : Lang -> Html Msg
dropdownListItem language =
    li
        [ class Styles.dropdownListItem
        , onClick (Msg.ChangeLanguage language)
        ]
        [ span []
            [ text (Translations.language language) ]
        ]
