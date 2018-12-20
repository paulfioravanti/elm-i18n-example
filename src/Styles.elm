module Styles exposing
    ( article
    , articleContainer
    , caret
    , currentSelection
    , dropdownContainer
    , dropdownList
    , dropdownListItem
    , heading
    , main_
    )


article : String
article =
    [ "dt"
    , "vh-75"
    , "w-100"
    ]
        |> String.join " "


articleContainer : String
articleContainer =
    [ "dtc"
    , "ph3 ph4-l"
    , "tc"
    , "v-mid"
    ]
        |> String.join " "


caret : String
caret =
    [ "absolute"
    , "ml2"
    ]
        |> String.join " "


currentSelection : Bool -> String
currentSelection showAvailableLanguages =
    let
        availableLanguagesClasses =
            if showAvailableLanguages then
                [ "br--top" ]

            else
                []
    in
    [ "b--white"
    , "ba"
    , "br2"
    , "pa2"
    , "pointer"
    , "tc"
    , "w4"
    ]
        ++ availableLanguagesClasses
        |> String.join " "


dropdownContainer : String
dropdownContainer =
    [ "center"
    , "f3"
    , "flex"
    , "h3"
    , "items-center"
    , "justify-end"
    , "w-90"
    ]
        |> String.join " "


dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                [ "flex", "flex-column" ]

            else
                [ "dn" ]
    in
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


dropdownListItem : String
dropdownListItem =
    [ "hover-bg-white"
    , "hover-dark-pink"
    , "ph1"
    , "pv2"
    , "pt0"
    , "w-100"
    ]
        |> String.join " "


heading : String
heading =
    [ "f6 f2m"
    , "f-subheadline-l"
    , "fw6"
    , "tc"
    ]
        |> String.join " "


main_ : String
main_ =
    [ "bg-dark-pink"
    , "pt3"
    , "overflow-container"
    , "sans-serif"
    , "vh-100"
    , "white"
    ]
        |> String.join " "
