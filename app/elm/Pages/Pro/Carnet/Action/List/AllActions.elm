module Pages.Pro.Carnet.Action.List.AllActions exposing (Action, Creator, fetchAllByTargetId)

import Date
import Domain.Action.Id exposing (ActionId)
import Domain.Action.Status exposing (ActionStatus)
import Extra.Date
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline as Decode
import Json.Encode as Json


type alias Action =
    { id : ActionId
    , description : String
    , statut : ActionStatus
    , startingAt : Date.Date
    , creator : Creator
    }


type alias Creator =
    { firstName : String, lastName : String }


decoder : Decode.Decoder Action
decoder =
    Decode.succeed Action
        |> Decode.required "id" Domain.Action.Id.decoder
        |> Decode.required "action" Decode.string
        |> Decode.required "status" Domain.Action.Status.decoder
        |> Decode.required "createdAt" Extra.Date.decoder
        |> Decode.required "creator" creatorDecoder


creatorDecoder : Decode.Decoder Creator
creatorDecoder =
    Decode.keyValuePairs (Decode.maybe personDecoder)
        |> Decode.andThen
            (List.filterMap Tuple.second
                >> List.head
                >> Maybe.map Decode.succeed
                >> Maybe.withDefault
                    (Decode.fail "Une action doit avoir un créateur professional ou orientation manager")
            )


personDecoder : Decode.Decoder Creator
personDecoder =
    Decode.succeed Creator
        |> Decode.required "firstname" Decode.string
        |> Decode.required "lastname" Decode.string


fetchAllByTargetId : { id : String, responseMsg : Result Http.Error (List Action) -> msg } -> Cmd msg
fetchAllByTargetId { id, responseMsg } =
    let
        query =
            """
query GetActionsByTargetId($id: uuid!) {
  target: notebook_target_by_pk(id: $id) {
    id
    actions {
      id
      action
      status
      createdAt
      creator {
        orientation_manager {
          firstname, lastname
        }
        professional {
          firstname, lastname
        }
      }
    }
  }
}
            """
    in
    Http.request
        { method = "POST"
        , url = "/graphql"
        , headers =
            [ ]
        , body =
            Http.jsonBody
                (Json.object
                    [ ( "query", Json.string query )
                    , ( "variables"
                      , Json.object
                            [ ( "id", Json.string id )
                            ]
                      )
                    ]
                )
        , expect =
            Http.expectJson
                responseMsg
                (Decode.at [ "data", "target", "actions" ]
                    (Decode.list decoder)
                )
        , timeout = Nothing
        , tracker = Nothing
        }