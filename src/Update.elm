module Update exposing (update)

import Cmd
import Model exposing (Model)
import Msg exposing (Msg)
import Translations


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.ChangeLanguage language ->
            ( { model
                | currentLanguage = language
                , title = Translations.title language
              }
            , Cmd.storeLanguage language
            )

        Msg.CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }, Cmd.none )

        Msg.ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )
