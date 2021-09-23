module UpdateTest exposing (all)

import Expect
import Model exposing (Model)
import Msg exposing (Msg)
import Test exposing (Test, describe, test)
import Translations
import Update


all : Test
all =
    describe "Update"
        [ changeLanguageTest
        , closeAvailableLanguagesTest
        , toggleAvailableLanguagesTest
        ]


{-| NOTE: It's possible, and probably more correct here, to use a custom Fuzzer
to pick a language at random, but for this toy application, this amount of
testing is probably enough.
-}
changeLanguageTest : Test
changeLanguageTest =
    let
        msg : Msg
        msg =
            Msg.ChangeLanguage Translations.It

        model : Model
        model =
            Model.init Translations.En

        ( actualModel, _ ) =
            Update.update msg model

        expectedModel : Model
        expectedModel =
            Model.init Translations.It
    in
    describe "Msg.ChangeLanguage"
        [ test "updates the model to the specified language" <|
            \() ->
                Expect.equal expectedModel actualModel
        ]


closeAvailableLanguagesTest : Test
closeAvailableLanguagesTest =
    let
        msg : Msg
        msg =
            Msg.CloseAvailableLanguages

        model : Model
        model =
            Model Translations.En True ""

        ( actualModel, _ ) =
            Update.update msg model
    in
    describe "Msg.CloseAvailableLanguages"
        [ test "sets showAvailableLanguages to false" <|
            \() ->
                Expect.false
                    "Expected showAvailableLanguages to be false"
                    actualModel.showAvailableLanguages
        ]


toggleAvailableLanguagesTest : Test
toggleAvailableLanguagesTest =
    let
        msg : Msg
        msg =
            Msg.ToggleAvailableLanguages
    in
    describe "Msg.ToggleAvailableLanguages"
        [ test "will toggle the showAvailableLanguages to true when false" <|
            \() ->
                let
                    model : Model
                    model =
                        Model Translations.En False ""

                    ( actualModel, _ ) =
                        Update.update msg model
                in
                Expect.true
                    "Expected showAvailableLanguages to be true"
                    actualModel.showAvailableLanguages
        , test "will toggle the showAvailableLanguages to false when true" <|
            \() ->
                let
                    model : Model
                    model =
                        Model Translations.En True ""

                    ( actualModel, _ ) =
                        Update.update msg model
                in
                Expect.false
                    "Expected showAvailableLanguages to be false"
                    actualModel.showAvailableLanguages
        ]
