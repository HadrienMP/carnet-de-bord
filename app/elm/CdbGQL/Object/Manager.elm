-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Manager exposing (..)

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


{-| An object relationship
-}
account :
    SelectionSet decodesTo CdbGQL.Object.Account
    -> SelectionSet (Maybe decodesTo) CdbGQL.Object.Manager
account object____ =
    Object.selectionForCompositeField "account" [] object____ (Basics.identity >> Decode.nullable)


createdAt : SelectionSet CdbGQL.ScalarCodecs.Timestamptz CdbGQL.Object.Manager
createdAt =
    Object.selectionForField "ScalarCodecs.Timestamptz" "createdAt" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder)


{-| An object relationship
-}
deployment :
    SelectionSet decodesTo CdbGQL.Object.Deployment
    -> SelectionSet decodesTo CdbGQL.Object.Manager
deployment object____ =
    Object.selectionForCompositeField "deployment" [] object____ Basics.identity


deploymentId : SelectionSet CdbGQL.ScalarCodecs.Uuid CdbGQL.Object.Manager
deploymentId =
    Object.selectionForField "ScalarCodecs.Uuid" "deploymentId" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder)


email : SelectionSet CdbGQL.ScalarCodecs.Citext CdbGQL.Object.Manager
email =
    Object.selectionForField "ScalarCodecs.Citext" "email" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecCitext |> .decoder)


firstname : SelectionSet (Maybe String) CdbGQL.Object.Manager
firstname =
    Object.selectionForField "(Maybe String)" "firstname" [] (Decode.string |> Decode.nullable)


id : SelectionSet CdbGQL.ScalarCodecs.Uuid CdbGQL.Object.Manager
id =
    Object.selectionForField "ScalarCodecs.Uuid" "id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder)


lastname : SelectionSet (Maybe String) CdbGQL.Object.Manager
lastname =
    Object.selectionForField "(Maybe String)" "lastname" [] (Decode.string |> Decode.nullable)


updatedAt : SelectionSet CdbGQL.ScalarCodecs.Timestamptz CdbGQL.Object.Manager
updatedAt =
    Object.selectionForField "ScalarCodecs.Timestamptz" "updatedAt" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder)