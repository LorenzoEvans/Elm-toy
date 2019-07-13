import Browser
import Html exposing (Html, text, pre)
import Http



main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

type Model = Failure | Loading | Success String