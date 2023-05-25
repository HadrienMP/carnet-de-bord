-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Notebook_situation_select_column exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| select columns of table "notebook\_situation"

  - CreatedAt - column name
  - CreatedBy - column name
  - DeletedAt - column name
  - DeletedBy - column name
  - Id - column name
  - NotebookId - column name
  - SituationId - column name

-}
type Notebook_situation_select_column
    = CreatedAt
    | CreatedBy
    | DeletedAt
    | DeletedBy
    | Id
    | NotebookId
    | SituationId


list : List Notebook_situation_select_column
list =
    [ CreatedAt, CreatedBy, DeletedAt, DeletedBy, Id, NotebookId, SituationId ]


decoder : Decoder Notebook_situation_select_column
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "createdAt" ->
                        Decode.succeed CreatedAt

                    "createdBy" ->
                        Decode.succeed CreatedBy

                    "deletedAt" ->
                        Decode.succeed DeletedAt

                    "deletedBy" ->
                        Decode.succeed DeletedBy

                    "id" ->
                        Decode.succeed Id

                    "notebookId" ->
                        Decode.succeed NotebookId

                    "situationId" ->
                        Decode.succeed SituationId

                    _ ->
                        Decode.fail ("Invalid Notebook_situation_select_column type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Notebook_situation_select_column -> String
toString enum____ =
    case enum____ of
        CreatedAt ->
            "createdAt"

        CreatedBy ->
            "createdBy"

        DeletedAt ->
            "deletedAt"

        DeletedBy ->
            "deletedBy"

        Id ->
            "id"

        NotebookId ->
            "notebookId"

        SituationId ->
            "situationId"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Notebook_situation_select_column
fromString enumString____ =
    case enumString____ of
        "createdAt" ->
            Just CreatedAt

        "createdBy" ->
            Just CreatedBy

        "deletedAt" ->
            Just DeletedAt

        "deletedBy" ->
            Just DeletedBy

        "id" ->
            Just Id

        "notebookId" ->
            Just NotebookId

        "situationId" ->
            Just SituationId

        _ ->
            Nothing