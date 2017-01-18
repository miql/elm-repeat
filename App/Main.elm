module Main where

import Html exposing (Html, div, input, text)
import Html.Events exposing (on, targetValue)
import Html.Attributes exposing (attribute, class, type')
import List exposing (repeat)
import Signal exposing (Address)
import List
import String

-- StartApp takes Model, View, and Update
-- Model -> View Trigger an Action, Action is passed to the Update function
-- new Model is passed into the view again
import StartApp.Simple exposing (start)

main =
  start {model = model, view = view, update = update}

-- define a model
type alias Model = String
model : Model
model = "What it do, breh?"

-- create an action type
-- can pass UpdateText anywhere a function
-- expects an action
type Action = UpdateText String
-- Update function
-- Update takes an Actions

-- reaction to action types are specified in
-- the update function
update : Action -> Model -> Model
update action model =
  case action of
    UpdateText newStr -> newStr

-- View consumes and address that passes to an Action
-- Type for our view:
view : Address Action -> Model -> Html
view address model =
  div [class "mdl-grid"]
  [
    div[ class "mdl-textfield mdl-js-textfield"]
    [ input [ class "mdl-textfield__input"
            , type' "text"
            , on "input" targetValue
                    (\phrase -> Signal.message address (UpdateText phrase))]
              []
            , text (String.repeat 5 model)
    ]
  ]
