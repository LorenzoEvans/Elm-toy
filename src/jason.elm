module Main exposing (Model(..), main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (Decoder, field, string)


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, CatGif )


type Model
    = Failure
    | Loading
    | Success String


type Msg
    = More
    | GotGif (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        More ->
            ( Loading, CatGif )

        GotGif result ->
            case result of
                Ok url ->
                    ( Success url, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )

subscription : Model -> Sub Msg
subscription model =
    Sub.none




main =
    Browser.element
        { init = init
        , update = update
        , subscription = subscription
        , view = view
        }
