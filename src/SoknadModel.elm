module SoknadModel exposing (..)


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


type alias Property =
    { key : String
    , value : Maybe String
    }


type alias Faktum =
    { faktumId : Int
    , soknadId : Int
    , key : String
    , value : Maybe String
    , faktumType : FaktumType
    , faktumEgenskaper : List ()
    , properties : List Property
    }


type alias Soknad =
    { soknadId : Int
    , brukerBehandlingId : String
    , fakta : List Faktum
    , delstegStatus : DelstegStatus
    }
