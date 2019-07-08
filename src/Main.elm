module Main exposing (main)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
    { count : Int }

init: Model
init =
    {count = 0}


main : Program () Model Msg