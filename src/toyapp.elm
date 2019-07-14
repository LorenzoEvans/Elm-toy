module Main exposing (main)

import Browser exposing ()
import Browser.Navigation as Nav exposing (Key)
import Html exposing (..)
import Html.Attributes exposing (..)
import Url exposing (Url)


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }

type Msg =
	LinkClicked Browser.UrlRequest
	| UrlChanged Url


init : () -> Url.Url -> Key -> ( Model, Cmd msg )
init flags url key =
    ( Model key url, Cmd.none)

view : Model -> Document msg


update : msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url)



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
