module Main exposing (main)

import Browser
import Char exposing (isDigit, isLower, isUpper)
import Html exposing (Attribute, Html, button, div, input, li, text, ul)
import Html.Attributes exposing (..)
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
            { model | content = newContent }

        Name name_val ->
            { model | name = name_val }

        Password pw ->
            { model | password = pw }

        Pw_conf pw_conf ->
            { model | pw_conf = pw_conf }

        Age age ->
            { model | age = age }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Inc ] [ text "Increment Value" ]
        , div [] [ text <| String.fromInt model.count ]
        , button [ onClick Dec ] [ text "Decrement Value" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , input [ placeholder "Text to reverse", value model.content, onInput Change ] []
        , input [ placeholder "Enter your age", value model.age, onInput Age ] []
        , ageValidator model
        , div [] [ text (String.reverse model.content) ]
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


ageValidator : Model -> Html msg
ageValidator model =
    let
        int_age =
            Maybe.withDefault 0 (String.toInt model.age)
    in
    if int_age < 0 || int_age > 120 then
        div [ style "color" "red" ] [ text "Age is out of acceptable range." ]

    else
        div [ style "color" "green" ] [ text "OK" ]


viewValidator : Model -> Html msg
viewValidator model =
    if model.password == model.pw_conf && length model.password > 8 then
        if String.any isDigit model.password && String.any isUpper model.password then
            div [ style "color" "green" ] [ text "OK" ]

        else
            div [ style "color" "red" ] [ text "Password must contain numbers, uppercase characters" ]

    else
        div [ style "border" " 1px solid black" ]
            [ div [ style "color" "red" ] [ text "Password doesn't meet requirements." ]
            , ul []
                [ li [] [ text "Make sure your passwords match!" ]
                , li [] [ text "Make sure your password(s) are over 8 characters in length." ]
                , li [] [ text "Password must contain numbers, uppercase characters" ]
                ]
            ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
