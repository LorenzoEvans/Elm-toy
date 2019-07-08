module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg = Inc | Dec | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | count = model.count + 1 }

        Dec ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Inc ] [ text "+1" ]
        , div [] [ text <| String.fromInt model.count ]
        , button [ onClick Dec ] [ text "-1" ]
        , button [ onClick Reset ] [ text "Reset"]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

