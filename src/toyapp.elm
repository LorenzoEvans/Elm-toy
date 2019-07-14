module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


init : () -> Url -> Key -> ( Model, Cmd msg )


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
