module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, button, div, input, text)
import Html.Attributes exposing ( .. )
import Html.Events exposing (onClick, onInput)


type alias Model =
    { count : Int
    , content : String
    }


initialModel : Model
initialModel =
    { count = 0
    , content = ""
    }


type Msg
    = Inc
    | Dec
    | Reset
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | count = model.count + 1 }

        Dec ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }
        Change newContent ->
            { model | content = newContent}


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Inc ] [ text "Increment Value" ]
        , div [] [ text <| String.fromInt model.count ]
        , button [ onClick Dec ] [ text "Decrement Value" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , input [ placeholder "Text to reverse", value model.content, onInput Change] []
        , div [] [ text (String.reverse model.content)]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
