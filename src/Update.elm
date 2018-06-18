module Update exposing (update)

import Cmd
import Model exposing (Model)
import Msg
    exposing
        ( Msg
            ( ChangeLanguage
            , CloseAvailableLanguages
            , ShowAvailableLanguages
            )
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.storeLanguage language
            )

        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }, Cmd.none )

        ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )
