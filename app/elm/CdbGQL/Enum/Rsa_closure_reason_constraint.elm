-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Rsa_closure_reason_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "rsa\_closure\_reason"

  - Rsa\_closure\_reason\_pkey - unique or primary key constraint on columns "code"

-}
type Rsa_closure_reason_constraint
    = Rsa_closure_reason_pkey


list : List Rsa_closure_reason_constraint
list =
    [ Rsa_closure_reason_pkey ]


decoder : Decoder Rsa_closure_reason_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "rsa_closure_reason_pkey" ->
                        Decode.succeed Rsa_closure_reason_pkey

                    _ ->
                        Decode.fail ("Invalid Rsa_closure_reason_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Rsa_closure_reason_constraint -> String
toString enum____ =
    case enum____ of
        Rsa_closure_reason_pkey ->
            "rsa_closure_reason_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Rsa_closure_reason_constraint
fromString enumString____ =
    case enumString____ of
        "rsa_closure_reason_pkey" ->
            Just Rsa_closure_reason_pkey

        _ ->
            Nothing