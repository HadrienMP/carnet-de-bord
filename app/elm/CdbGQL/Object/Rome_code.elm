-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Rome_code exposing (..)

import CdbGQL.Enum.Professional_project_select_column
import CdbGQL.InputObject
import CdbGQL.Interface
import CdbGQL.Object
import CdbGQL.Scalar
import CdbGQL.ScalarCodecs
import CdbGQL.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


code : SelectionSet String CdbGQL.Object.Rome_code
code =
    Object.selectionForField "String" "code" [] Decode.string


description : SelectionSet String CdbGQL.Object.Rome_code
description =
    Object.selectionForField "String" "description" [] Decode.string


id : SelectionSet CdbGQL.ScalarCodecs.Uuid CdbGQL.Object.Rome_code
id =
    Object.selectionForField "ScalarCodecs.Uuid" "id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder)


label : SelectionSet String CdbGQL.Object.Rome_code
label =
    Object.selectionForField "String" "label" [] Decode.string


type alias ProfessionalProjectsOptionalArguments =
    { distinct_on : OptionalArgument (List CdbGQL.Enum.Professional_project_select_column.Professional_project_select_column)
    , limit : OptionalArgument Int
    , offset : OptionalArgument Int
    , order_by : OptionalArgument (List CdbGQL.InputObject.Professional_project_order_by)
    , where_ : OptionalArgument CdbGQL.InputObject.Professional_project_bool_exp
    }


{-| An array relationship

  - distinct\_on - distinct select on columns
  - limit - limit the number of rows returned
  - offset - skip the first n rows. Use only with order\_by
  - order\_by - sort the rows by one or more columns
  - where\_ - filter the rows returned

-}
professionalProjects :
    (ProfessionalProjectsOptionalArguments -> ProfessionalProjectsOptionalArguments)
    -> SelectionSet decodesTo CdbGQL.Object.Professional_project
    -> SelectionSet (List decodesTo) CdbGQL.Object.Rome_code
professionalProjects fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { distinct_on = Absent, limit = Absent, offset = Absent, order_by = Absent, where_ = Absent }

        optionalArgs____ =
            [ Argument.optional "distinct_on" filledInOptionals____.distinct_on (Encode.enum CdbGQL.Enum.Professional_project_select_column.toString |> Encode.list), Argument.optional "limit" filledInOptionals____.limit Encode.int, Argument.optional "offset" filledInOptionals____.offset Encode.int, Argument.optional "order_by" filledInOptionals____.order_by (CdbGQL.InputObject.encodeProfessional_project_order_by |> Encode.list), Argument.optional "where" filledInOptionals____.where_ CdbGQL.InputObject.encodeProfessional_project_bool_exp ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "professionalProjects" optionalArgs____ object____ (Basics.identity >> Decode.list)


type alias ProfessionalProjectsAggregateOptionalArguments =
    { distinct_on : OptionalArgument (List CdbGQL.Enum.Professional_project_select_column.Professional_project_select_column)
    , limit : OptionalArgument Int
    , offset : OptionalArgument Int
    , order_by : OptionalArgument (List CdbGQL.InputObject.Professional_project_order_by)
    , where_ : OptionalArgument CdbGQL.InputObject.Professional_project_bool_exp
    }


{-| An aggregate relationship

  - distinct\_on - distinct select on columns
  - limit - limit the number of rows returned
  - offset - skip the first n rows. Use only with order\_by
  - order\_by - sort the rows by one or more columns
  - where\_ - filter the rows returned

-}
professionalProjects_aggregate :
    (ProfessionalProjectsAggregateOptionalArguments -> ProfessionalProjectsAggregateOptionalArguments)
    -> SelectionSet decodesTo CdbGQL.Object.Professional_project_aggregate
    -> SelectionSet decodesTo CdbGQL.Object.Rome_code
professionalProjects_aggregate fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { distinct_on = Absent, limit = Absent, offset = Absent, order_by = Absent, where_ = Absent }

        optionalArgs____ =
            [ Argument.optional "distinct_on" filledInOptionals____.distinct_on (Encode.enum CdbGQL.Enum.Professional_project_select_column.toString |> Encode.list), Argument.optional "limit" filledInOptionals____.limit Encode.int, Argument.optional "offset" filledInOptionals____.offset Encode.int, Argument.optional "order_by" filledInOptionals____.order_by (CdbGQL.InputObject.encodeProfessional_project_order_by |> Encode.list), Argument.optional "where" filledInOptionals____.where_ CdbGQL.InputObject.encodeProfessional_project_bool_exp ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "professionalProjects_aggregate" optionalArgs____ object____ Basics.identity