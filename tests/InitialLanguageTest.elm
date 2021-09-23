module InitialLanguageTest exposing (all)

import Expect
import Json.Encode exposing (null, string)
import Main
import Model exposing (Flags)
import Test exposing (Test, describe, test)
import Translations exposing (Lang)


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
        expectedLanguage : Lang
        expectedLanguage =
            Translations.En

        flags : Flags
        flags =
            { language = string "en" }

        ( model, _ ) =
            Main.init flags

        actualLanguage : Lang
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
        expectedLanguage : Lang
        expectedLanguage =
            Translations.It

        flags : Flags
        flags =
            { language = string "it" }

        ( model, _ ) =
            Main.init flags

        actualLanguage : Lang
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
        expectedLanguage : Lang
        expectedLanguage =
            Translations.Ja

        flags : Flags
        flags =
            { language = string "ja" }

        ( model, _ ) =
            Main.init flags

        actualLanguage : Lang
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
        expectedLanguage : Lang
        expectedLanguage =
            Translations.En

        flags : Flags
        flags =
            { language = null }

        ( model, _ ) =
            Main.init flags

        actualLanguage : Lang
        actualLanguage =
            model.currentLanguage
    in
    describe "when given an invalid language flag"
        [ test "returns the default En language" <|
            \() ->
                Expect.equal expectedLanguage actualLanguage
        ]
