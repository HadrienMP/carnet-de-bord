-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Rome_code_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "rome\_code"

  - Rome\_codes\_label\_key - unique or primary key constraint on columns "label"
  - Rome\_codes\_pkey - unique or primary key constraint on columns "id"

-}
type Rome_code_constraint
    = Rome_codes_label_key
    | Rome_codes_pkey


list : List Rome_code_constraint
list =
    [ Rome_codes_label_key, Rome_codes_pkey ]


decoder : Decoder Rome_code_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "rome_codes_label_key" ->
                        Decode.succeed Rome_codes_label_key

                    "rome_codes_pkey" ->
                        Decode.succeed Rome_codes_pkey

                    _ ->
                        Decode.fail ("Invalid Rome_code_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Rome_code_constraint -> String
toString enum____ =
    case enum____ of
        Rome_codes_label_key ->
            "rome_codes_label_key"

        Rome_codes_pkey ->
            "rome_codes_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Rome_code_constraint
fromString enumString____ =
    case enumString____ of
        "rome_codes_label_key" ->
            Just Rome_codes_label_key

        "rome_codes_pkey" ->
            Just Rome_codes_pkey

        _ ->
            Nothing