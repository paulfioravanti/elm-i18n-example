module LanguageDropdown exposing (view)

import Html exposing (Html, div, li, p, span, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


-- import Language

import Model exposing (Model)
import Msg exposing (Msg(ShowAvailableLanguages))


-- import Translations exposing (Lang)


view : Model -> Html Msg
view model =
    let
        classes =
            [ "center"
            , "f3"
            , "flex"
            , "h3"
            , "items-center"
            , "justify-end"
            , "w-90"
            ]
                |> String.join " "
                |> class
    in
        div [ classes ]
            [ currentSelection model
            , dropdownList model
            ]


currentSelection : Model -> Html Msg
currentSelection model =
    let
        displayClasses =
            if model.showAvailableLanguages then
                [ "br--top" ]
            else
                []

        classes =
            [ "b--white"
            , "ba"
            , "br2"
            , "pa2"
            , "pointer"
            , "tc"
            , "w4"
            ]
                ++ displayClasses
                |> String.join " "
                |> class

        caretClasses =
            [ "absolute"
            , "ml2"
            ]
                |> String.join " "
                |> class
    in
        p [ classes, onClick ShowAvailableLanguages ]
            [ span []
                -- [ text (Language.toString model.currentLanguage) ]
                [ text "English" ]
            , span [ caretClasses ]
                [ text "▾" ]
            ]


dropdownList : Model -> Html Msg
dropdownList model =
    let
        displayClasses =
            if model.showAvailableLanguages then
                [ "flex", "flex-column" ]
            else
                [ "dn" ]

        classes =
            [ "absolute"
            , "b--white"
            , "bb"
            , "bl"
            , "br"
            , "br--bottom"
            , "br2"
            , "items-center"
            , "list"
            , "mt5"
            , "pl0"
            , "pointer"
            , "pr0"
            , "pt1"
            , "tc"
            , "top-0"
            , "w4"
            ]
                ++ displayClasses
                |> String.join " "
                |> class

        selectableLanguages =
            [ "Italiano", "日本語" ]

        -- List.filter
        --     (\language -> language /= model.currentLanguage)
        --     Language.availableLanguages
    in
        ul [ classes ]
            (List.map dropdownListItem selectableLanguages)


dropdownListItem : String -> Html Msg
dropdownListItem language =
    let
        classes =
            [ "hover-bg-white"
            , "hover-dark-pink"
            , "ph1"
            , "pv2"
            , "pt0"
            , "w-100"
            ]
                |> String.join " "
                |> class
    in
        -- li [ classes, onClick (ChangeLanguage language) ]
        li [ classes ]
            [ span []
                -- [ text (Language.toString language) ]
                [ text language ]
            ]
