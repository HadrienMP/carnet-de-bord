-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Action_status_update_column exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| update columns of table "action\_status"

  - Status - column name

-}
type Action_status_update_column
    = Status


list : List Action_status_update_column
list =
    [ Status ]


decoder : Decoder Action_status_update_column
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "status" ->
                        Decode.succeed Status

                    _ ->
                        Decode.fail ("Invalid Action_status_update_column type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Action_status_update_column -> String
toString enum____ =
    case enum____ of
        Status ->
            "status"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Action_status_update_column
fromString enumString____ =
    case enumString____ of
        "status" ->
            Just Status

        _ ->
            Nothing