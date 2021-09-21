module InitialLanguageTest exposing (all)

import Expect
import Json.Encode exposing (null, string)
import Main
import Test exposing (Test, describe, test)
import Translations


all : Test
all =
    describe "Initial language"
        [ enFlagTest
        , itFlagTest
        , jaFlagTest
        , invalidFlagTest
        ]


enFlagTest : Test
enFlagTest =
    let
        expectedLanguage =
            Translations.En

        flags =
            { language = string "en" }

        ( model, _ ) =
            Main.init flags

        actualLanguage =
            model.currentLanguage
    in
    describe "when given an 'en' string language flag"
        [ test "returns the En language" <|
            \() ->
                Expect.equal expectedLanguage actualLanguage
        ]


itFlagTest : Test
itFlagTest =
    let
        expectedLanguage =
            Translations.It

        flags =
            { language = string "it" }

        ( model, _ ) =
            Main.init flags

        actualLanguage =
            model.currentLanguage
    in
    describe "when given an 'it' string language flag"
        [ test "returns the It language" <|
            \() ->
                Expect.equal expectedLanguage actualLanguage
        ]


jaFlagTest : Test
jaFlagTest =
    let
        expectedLanguage =
            Translations.Ja

        flags =
            { language = string "ja" }

        ( model, _ ) =
            Main.init flags

        actualLanguage =
            model.currentLanguage
    in
    describe "when given a 'ja' string language flag"
        [ test "returns the Ja language" <|
            \() ->
                Expect.equal expectedLanguage actualLanguage
        ]


invalidFlagTest : Test
invalidFlagTest =
    let
        expectedLanguage =
            Translations.En

        flags =
            { language = null }

        ( model, _ ) =
            Main.init flags

        actualLanguage =
            model.currentLanguage
    in
    describe "when given an invalid language flag"
        [ test "returns the default En language" <|
            \() ->
                Expect.equal expectedLanguage actualLanguage
        ]
