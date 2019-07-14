module Main exposing (main)

import Browser
import Browser.Navigation as Nav exposing (Key)
import Html exposing (..)
import Html.Attributes exposing (..)
import Url exposing (Url)


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Key -> ( Model, Cmd msg )
init flags url key =
    ( Model key url, Cmd.none)

view : Model -> Document msg


update : msg -> Model -> ( Model, Cmd msg )


subscriptions : Model -> Sub msg


onUrlRequest : UrlRequest -> msg


onUrlChange : Url -> msg


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlChanged
        , onUrlChange = LinkClicked
        }
