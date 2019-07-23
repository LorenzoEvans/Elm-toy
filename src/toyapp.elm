module Main exposing (main)

import Browser exposing (UrlRequest)
import Browser.Navigation as Nav exposing (Key)
import Html exposing (..)
import Html.Attributes exposing (..)
import Url exposing (Url)


type alias Model =
    { key : Nav.Key
    , url : Url
    }


type Msg
    = LinkClicked UrlRequest
    | UrlChanged Url


init : () -> Url -> Key -> ( Model, Cmd msg )
init flags url key =
    ( Model key url, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )



subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none


view : Model -> Browser.Document Msg
view model =
    { title = "Url Interceptor"
    , body =
        [ text "The current url is: "
        , b [] [ text (Url.toString model.url) ]
        , ul []
            [ viewLink "/home"
						, viewLink "/profile"
						, viewLink "/reviews/the-century-of-the-self"
						, viewLink "/reviews/public-opinion"
						, viewLink "/reviews/shah-of-shahs"
            ]
        ]
    }

viewLink: String -> Html msg
viewLink path =
    li [] [a [href path]
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
