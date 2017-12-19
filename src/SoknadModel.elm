module SoknadModel exposing (..)

import Dict exposing (Dict)


type FaktumType
    = BRUKERREGISTRERT
    | SYSTEMREGISTRERT


type Status
    = UNDER_ARBEID
    | FERDIG
    | AVBRUTT_AV_BRUKER


type DelstegStatus
    = OPPRETTET
    | UTFYLLING
    | SAMTYKKET


type alias Faktum =
    { faktumId : Int
    , soknadId : Int
    , key : String
    , value : Maybe String
    , faktumType : FaktumType
    , properties : Dict String (Maybe String)
    }


type alias Soknad =
    { soknadId : Int
    , brukerBehandlingId : String
    , fakta : List Faktum
    , delstegStatus : DelstegStatus
    }
