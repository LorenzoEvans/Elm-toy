module Main exposing (main)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
    { count : Int }

initialModel : Model

initialModel =
    {count = 0}

type Msg = Inc | Dec | Reset

update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | count = model.count + 1}
        Dec ->
            { model | count = model.count - 1}
        Reset ->
            { model | count = 0}

view : Model -> Html Msg
view =
    div []
    [ button [ onClick Inc ] [ text "Increment Value."]
    , div [] [ text <| String.fromInt initialModel.count]
    , button [ onClick Dec ] [ text "Decrement Value."]
    , button [ onClick Reset ] [ text "Reset Value."]
    ]

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update}