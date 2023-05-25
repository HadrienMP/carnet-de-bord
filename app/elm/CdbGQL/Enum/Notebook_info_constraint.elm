-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Notebook_info_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "notebook\_info"

  - Notebook\_info\_pkey - unique or primary key constraint on columns "notebook\_id"

-}
type Notebook_info_constraint
    = Notebook_info_pkey


list : List Notebook_info_constraint
list =
    [ Notebook_info_pkey ]


decoder : Decoder Notebook_info_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "notebook_info_pkey" ->
                        Decode.succeed Notebook_info_pkey

                    _ ->
                        Decode.fail ("Invalid Notebook_info_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Notebook_info_constraint -> String
toString enum____ =
    case enum____ of
        Notebook_info_pkey ->
            "notebook_info_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Notebook_info_constraint
fromString enumString____ =
    case enumString____ of
        "notebook_info_pkey" ->
            Just Notebook_info_pkey

        _ ->
            Nothing