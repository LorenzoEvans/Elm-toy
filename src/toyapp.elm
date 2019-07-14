import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url

init : () -> Url -> Key -> (Model, Cmd msg)
view : Model -> Document msg
update: msg -> Model -> (Model, Cmd msg)
subscriptions: Model -> Sub msg
onUrlRequest : UrlRequest -> msg
onUrlChange: Url -> msg

main =
    Browser.document
    {init = init
     , view = view
     , update = update
     , subscriptions = subscriptions
     , onUrlRequest = onUrlRequest
     , onUrlChange = onUrlChange
    }