import Browser
import Html exposing (Html, text, pre)
import Http

type Model = Failure | Loading | Success String
type Msg =
    GotText (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    (Success fullText, Cmd.none)
                Err _ ->
                    (Failure, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> Html Msg
view model =
    case model of
        Failure ->
            text "I was unable to find your book."
        Loading ->
            text "Loading.."
        Success fullText ->
            pre [] [ text fullText ]



init : () -> (Model, Cmd Msg)
init _ =
    ( Loading
    , Http.get
        {url = "https://elm-lang.org/assets/public-opinion.txt"
        , expect = Http.expectString GotText})
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


