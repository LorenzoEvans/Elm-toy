module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, button, div, input, text)
import Html.Attributes exposing ( .. )
import Html.Events exposing (onClick, onInput)
import String exposing (..)


type alias Model =
    { count : Int
    , content : String
    , name : String
    , password : String
    , pw_conf : String
    , age : String
    }


initialModel : Model
initialModel =
    { count = 0
    , content = ""
    , name = ""
    , password = ""
    , pw_conf = ""
    , age = ""
    }


type Msg
    = Inc
    | Dec
    | Reset
    | Change String
    | Name String
    | Password String
    | Pw_conf String
    | Age String


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
        Name name_val ->
            { model | name = name_val}
        Password pw ->
            { model | password = pw}
        Pw_conf pw_conf ->
            { model | pw_conf = pw_conf}
        Age age ->
            { model | age = age}

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Inc ] [ text "Increment Value" ]
        , div [] [ text <| String.fromInt model.count ]
        , button [ onClick Dec ] [ text "Decrement Value" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , input [ placeholder "Text to reverse", value model.content, onInput Change] []
        , input [ placeholder "Enter your age", value model.age, onInput Age] []
        , div [] [ text (String.reverse model.content)]
        , div []
        [ viewInput "text" "Name" model.name Name
        , viewInput "password" "Password" model.password Password
        , viewInput "password" "Re-enter Password" model.pw_conf Pw_conf
        , viewValidator model
        ]
        ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []

--ageInput : String -> String -> String -> (String -> msg) -> Html msg
--ageInput t p v toMsg  =
    --input [type_ t, placeholder p, value v, onInput toMsg]

--ageValidator : Model -> Html msg
--ageValidator model =
--    if model.age < 0 || model.age > 120 then
--        div [ style "color" "red"] [ text "Age is out of acceptable range."]
--     else
--        div [ style "color" "green"] [ text "OK"]
viewValidator : Model -> Html msg
viewValidator model =
    if model.password == model.pw_conf then
        div [ style "color" "green"] [ text "OK"]
    else
        div [ style "color" "red"] [ text "Passwords do not match!"]

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
