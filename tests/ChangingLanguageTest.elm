module ChangingLanguageTest exposing (all)

import Expect
import Html exposing (Html)
import Json.Encode exposing (null, string)
import Main
import Model exposing (Model)
import Msg exposing (Msg)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event exposing (click)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (class, containing, tag, text)
import Translations
import Utils
import View


all : Test
all =
    let
        ( model, _ ) =
            Main.init { language = null }
    in
    describe "Changing language"
        [ changeLanguageToItalianTest model
        , changeLanguageToJapaneseTest model
        , changeLanguageToEnglishTest model
        ]



-- PRIVATE


changeLanguageToItalianTest : Model -> Test
changeLanguageToItalianTest model =
    let
        html =
            Utils.html { model | showAvailableLanguages = True }
    in
    describe "changing the language to Italian"
        [ test "sends a message to change the language to Italian" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Query.find [ tag "li", containing [ text "Italiano" ] ]
                    |> Event.simulate click
                    |> Event.expect (Msg.ChangeLanguage Translations.It)
        ]


changeLanguageToJapaneseTest : Model -> Test
changeLanguageToJapaneseTest model =
    let
        html =
            Utils.html { model | showAvailableLanguages = True }
    in
    describe "changing the language to Japanese"
        [ test "sends a message to change the language to Japanese" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Query.find [ tag "li", containing [ text "日本語" ] ]
                    |> Event.simulate click
                    |> Event.expect (Msg.ChangeLanguage Translations.Ja)
        ]


changeLanguageToEnglishTest : Model -> Test
changeLanguageToEnglishTest model =
    let
        html =
            Utils.html
                { model
                    | showAvailableLanguages = True
                    , currentLanguage = Translations.It
                }
    in
    describe "changing the language to English"
        [ test "sends a message to change the language to English" <|
            \() ->
                html
                    |> Query.fromHtml
                    |> Query.find [ tag "li", containing [ text "English" ] ]
                    |> Event.simulate click
                    |> Event.expect (Msg.ChangeLanguage Translations.En)
        ]
