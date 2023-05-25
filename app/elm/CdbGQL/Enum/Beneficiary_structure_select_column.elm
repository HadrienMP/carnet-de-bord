-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Beneficiary_structure_select_column exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| select columns of table "beneficiary\_structure"

  - BeneficiaryId - column name
  - CreatedAt - column name
  - Data - column name
  - Id - column name
  - Status - column name
  - StructureId - column name
  - UpdatedAt - column name

-}
type Beneficiary_structure_select_column
    = BeneficiaryId
    | CreatedAt
    | Data
    | Id
    | Status
    | StructureId
    | UpdatedAt


list : List Beneficiary_structure_select_column
list =
    [ BeneficiaryId, CreatedAt, Data, Id, Status, StructureId, UpdatedAt ]


decoder : Decoder Beneficiary_structure_select_column
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "beneficiaryId" ->
                        Decode.succeed BeneficiaryId

                    "createdAt" ->
                        Decode.succeed CreatedAt

                    "data" ->
                        Decode.succeed Data

                    "id" ->
                        Decode.succeed Id

                    "status" ->
                        Decode.succeed Status

                    "structureId" ->
                        Decode.succeed StructureId

                    "updatedAt" ->
                        Decode.succeed UpdatedAt

                    _ ->
                        Decode.fail ("Invalid Beneficiary_structure_select_column type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Beneficiary_structure_select_column -> String
toString enum____ =
    case enum____ of
        BeneficiaryId ->
            "beneficiaryId"

        CreatedAt ->
            "createdAt"

        Data ->
            "data"

        Id ->
            "id"

        Status ->
            "status"

        StructureId ->
            "structureId"

        UpdatedAt ->
            "updatedAt"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Beneficiary_structure_select_column
fromString enumString____ =
    case enumString____ of
        "beneficiaryId" ->
            Just BeneficiaryId

        "createdAt" ->
            Just CreatedAt

        "data" ->
            Just Data

        "id" ->
            Just Id

        "status" ->
            Just Status

        "structureId" ->
            Just StructureId

        "updatedAt" ->
            Just UpdatedAt

        _ ->
            Nothing