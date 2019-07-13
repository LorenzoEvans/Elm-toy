import Browser
import Http
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Json.Decode exposing (Decoder, field, string)

main =
    Browser.element
    { init = init
    , update = update
    , subscription = subscription
    , view = view
    }

type Model =
    Failure
    | Loading
    | Success