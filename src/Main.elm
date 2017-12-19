module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import DateTimePicker exposing (..)
import DateTimePicker.Config exposing (..)
import DateTimePicker.SharedStyles exposing (..)
import Date exposing (..)


---- MODEL ----


type alias Model =
    { fromDatePickerState : DateTimePicker.State, fromSelectedDate : Maybe Date, toDatePickerState : DateTimePicker.State, toSelectedDate : Maybe Date }


init : ( Model, Cmd Msg )
init =
    ( { fromDatePickerState = DateTimePicker.initialState
      , fromSelectedDate = Maybe.Nothing
      , toDatePickerState = DateTimePicker.initialState
      , toSelectedDate = Maybe.Nothing
      }
    , Cmd.batch
        [ DateTimePicker.initialCmd FromDateChange DateTimePicker.initialState
        , DateTimePicker.initialCmd ToDateChange DateTimePicker.initialState
        ]
    )



---- UPDATE ----


type Land
    = List String


type Msg
    = VelgLand String
    | FromDateChange DateTimePicker.State (Maybe Date)
    | ToDateChange DateTimePicker.State (Maybe Date)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        VelgLand land ->
            ( model, Cmd.none )

        FromDateChange fromDatePickerState fromSelectedDate ->
            ( { model | fromSelectedDate = fromSelectedDate, fromDatePickerState = fromDatePickerState }, Cmd.none )

        ToDateChange toDatePickerState toSelectedDate ->
            ( { model | toSelectedDate = toSelectedDate, toDatePickerState = toDatePickerState }, Cmd.none )



---- VIEW ----


customConfig =
    let
        default =
            DateTimePicker.Config.defaultDatePickerConfig FromDateChange
    in
        { default
            | firstDayOfWeek = Date.Mon
        }


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
            , DateTimePicker.datePickerWithConfig
                customConfig
                [ class "my-datepicker" ]
                model.fromDatePickerState
                model.fromSelectedDate
            , label [ class "skjemaelement__label", for "tom" ]
                [ text " til og med dato: " ]
            , DateTimePicker.datePicker
                ToDateChange
                [ class "my-datetimepicker" ]
                model.toDatePickerState
                model.toSelectedDate
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
