module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }


type alias Model =
    { quote : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "", Cmd.none )


type Msg
    = GetQuote
