module FaktumDecoder exposing (..)

import Dict exposing (Dict)
import SoknadModel exposing (..)
import Json.Decode exposing (Decoder, int, string, list, dict, nullable, maybe, andThen, succeed, fail)
import Json.Decode.Pipeline exposing (decode, required)


faktumTypeDecoder : Decoder FaktumType
faktumTypeDecoder =
    string
        |> andThen
            (\str ->
                case str of
                    "BRUKERREGISTRERT" ->
                        succeed BRUKERREGISTRERT

                    "SYSTEMREGISTRERT" ->
                        succeed SYSTEMREGISTRERT

                    somethingElse ->
                        fail <| "Ukjent faktum type: " ++ somethingElse
            )


faktumDecoder : Decoder Faktum
faktumDecoder =
    decode Faktum
        |> required "faktumId" int
        |> required "soknadId" int
        |> required "key" string
        |> required "value" (nullable string)
        |> required "type" faktumTypeDecoder
        |> required "properties" (dict (nullable string))
