module LanguageMenuTest exposing (all)

import Expect
import Html exposing (Html)
import Json.Encode exposing (string)
import Main
import Model exposing (Model)
import Msg exposing (Msg)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event exposing (click)
import Test.Html.Query as Query
import Test.Html.Selector exposing (class, tag)
import Utils


all : Test
all =
    let
        ( model, _ ) =
            Main.init { language = string "en" }
    in
    describe "Language Menu"
        [ initialStateTest model
        , openMenuStateTest model
        , clickingCurrentLanguageTest model
        , closeMenuByClickingElsewhereTest model
        ]



-- PRIVATE


initialStateTest : Model -> Test
initialStateTest model =
    let
        html : Html Msg
        html =
            Utils.html model
    in
    describe "initial state"
        [ test "menu is closed" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Query.find [ tag "ul" ]
                    |> Expect.all
                        [ Query.has [ class "dn" ]
                        , Query.hasNot [ class "flex" ]
                        ]
        ]


openMenuStateTest : Model -> Test
openMenuStateTest model =
    let
        html : Html Msg
        html =
            Utils.html { model | showAvailableLanguages = True }
    in
    describe "menu state when available languages are shown"
        [ test "menu is open" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Query.find [ tag "ul" ]
                    |> Expect.all
                        [ Query.has [ class "flex" ]
                        , Query.hasNot [ class "dn" ]
                        ]
        ]


clickingCurrentLanguageTest : Model -> Test
clickingCurrentLanguageTest model =
    let
        html : Html Msg
        html =
            Utils.html model
    in
    describe "clicking the current language"
        [ test "toggles visibility of the available languages" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Query.find [ tag "p" ]
                    |> Event.simulate click
                    |> Event.expect Msg.ToggleAvailableLanguages
        ]


closeMenuByClickingElsewhereTest : Model -> Test
closeMenuByClickingElsewhereTest model =
    let
        html : Html Msg
        html =
            Utils.html { model | showAvailableLanguages = True }
    in
    describe "closing the menu by clicking elsewhere on the page"
        [ test "hides the available languages" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Event.simulate click
                    |> Event.expect Msg.CloseAvailableLanguages
        ]
