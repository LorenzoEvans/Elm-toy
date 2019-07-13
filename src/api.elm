module Main exposing (ApiResult(..), Model(..), Msg(..), init, main, subscriptions, update, view)

import Browser
import Html exposing (Html, pre, text)
import Http


type Model
    = Failure
    | Loading
    | Success String


type Msg
    = GotText (Result Http.Error String)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    ( Success fullText, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )


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


init : () -> ( Model, Cmd Msg )



{-
    In addition to our initial model, we have a command we want to execute immediately,
    that will eventually produce a Msg that will be fed to our update function.
    {-
     "Our programs can Command the runtime to make http requests."
    -}
-}


init _ =
    ( Loading
    , Http.get
        --    Http.get exposes the get request function(?), or action.
        { url = "https://elm-lang.org/assets/public-opinion.txt"

        --    We define a url variable with the string of the url we want.
        , expect = Http.expectString GotText
        }
    )



--    We then define what we expect the data to be, and we also say that when we get this response,
--      we want it to be turn into a GotText message.


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
