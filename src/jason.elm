module Main exposing (Model(..), main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (Decoder, field, string)

main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type Model
    = Failure
    | Loading
    | Success String

init : () -> ( Model, Cmd Msg )
init _ =
    (Loading, getCatGif)
--    This is how you initialize an app with data, so that it loads with content available.

type Msg
    = More
    | GotGif (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        More ->
            ( Loading, getCatGif )

        GotGif result ->
            case result of
                Ok url ->
                    ( Success url, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Random Cat Gifs." ]
        , viewGif model
        ]

viewGif : Model -> Html Msg
viewGif model =
    case model of
        Failure ->
            div []
                [ text "I could not load this cat gif, sorry."
                , button [ onClick More ] [ text "Try again" ]
                ]

        Loading ->
            text "Loading.."

        Success url ->
            div []
                [ button [ onClick More, style "display" "block" ] [ text "More cat gifs!" ]
                    , img [ src url ] []
                ]



getCatGif : Cmd Msg
getCatGif =
  Http.get
    { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat"
    , expect = Http.expectJson GotGif gifDecoder
    }

gifDecoder : Decoder String
gifDecoder =
    field "data" (field "image_url" string)

