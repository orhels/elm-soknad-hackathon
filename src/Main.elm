module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "skjemaelement" ]
        [ label [ class "skjemaelement__label", for "land" ]
            [ text "Hvilken land er best om sommeren?" ]
        , div [ class "selectContainer input--fullbredde" ]
            [ select [ class "skjemaelement__input", id "land" ]
                [ option [ value "norge" ]
                    [ text "Norge" ]
                , option [ value "sverige" ]
                    [ text "Sverige" ]
                , option [ value "danmark" ]
                    [ text "Danmark" ]
                ]
            ]
        , div [ attribute "aria-live" "assertive", attribute "role" "alert" ]
            []
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
