module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import DateTimePicker exposing (..)
import Date exposing (..)


---- MODEL ----


type alias Model =
    { datePickerState : DateTimePicker.State, selectedDate : Maybe Date }


init : ( Model, Cmd Msg )
init =
    ( { datePickerState = DateTimePicker.initialState, selectedDate = Maybe.Nothing }
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

        DateChange datePickerState selectedDate ->
            ( { model | selectedDate = selectedDate, datePickerState = datePickerState }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "skjemaelement" ]
        [ label [ class "skjemaelement__label", for "land" ]
            [ text "Landet jeg skal oppholde meg i: " ]
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
        , div [ attribute "aria-live" "assertive", attribute "role" "alert" ]
            []
        , div []
            [ label [ class "skjemaelement__label", for "fom" ]
                [ text "Oppholdet varer fra og med dato: " ]
            , DateTimePicker.datePicker
                DateChange
                [ class "my-datetimepicker" ]
                model.datePickerState
                model.selectedDate
            , label [ class "skjemaelement__label", for "tom" ]
                [ text " til og med dato: " ]
            , DateTimePicker.datePicker
                DateChange
                [ class "my-datetimepicker" ]
                model.datePickerState
                model.selectedDate
            ]
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
