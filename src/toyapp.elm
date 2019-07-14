import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url

init : () -> (Model, Cmd Msg)

main =
    Browser.document
    {init = init
     , view = view
     , update = update
     , subscriptions = subscriptions
     , onUrlRequest = onUrlRequest
     , onUrlChange = onUrlChange
    }