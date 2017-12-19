module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import DateTimePicker exposing (..)
import Date exposing (..)


---- MODEL ----


type alias Model =
    { state : DateTimePicker.State, value : Maybe Date }


init : ( Model, Cmd Msg )
init =
    ( { state = DateTimePicker.initialState, value = Maybe.Nothing }
    , DateTimePicker.initialCmd DateChange DateTimePicker.initialState
    )



---- UPDATE ----


type Land
    = List String


type Msg
    = VelgLand String
    | DateChange DateTimePicker.State (Maybe Date)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        VelgLand land ->
            ( model, Cmd.none )

        DateChange state maybeDate ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "skjemaelement" ]
        [ label [ class "skjemaelement__label", for "land" ]
            [ text "Hvilken land er best om sommeren?" ]
        , div [ class "selectContainer input--fullbredde" ]
            [ select
                [ class "skjemaelement__input"
                , id "land"
                , onInput VelgLand
                ]
                [ option [ value "norge" ]
                    [ text "Norge" ]
                , option [ value "sverige" ]
                    [ text "Sverige" ]
                , option [ value "danmark" ]
                    [ text "Danmark" ]
                ]
            ]
        , label [ class "skjemaelement__label", for "land" ]
            [ text "Landet jeg skal oppholde meg i: " ]
        , input [ placeholder "", onInput VelgLand, id "land" ] []
        , label [ class "skjemaelement__label", for "fom" ]
            [ text "Oppholdet varer fra og med dato " ]
        , DateTimePicker.datePicker
            DateChange
            [ class "my-datetimepicker" ]
            model.state
            model.value
        , label [ class "skjemaelement__label", for "tom" ]
            [ text " til og med dato " ]
        , DateTimePicker.datePicker
            DateChange
            [ class "my-datetimepicker" ]
            model.state
            model.value
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
