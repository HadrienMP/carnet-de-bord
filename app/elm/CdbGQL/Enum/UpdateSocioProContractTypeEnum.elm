-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.UpdateSocioProContractTypeEnum exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-|

  - Apprentissage - Apprentissage
  - Cdd - CDD
  - Cdi - CDI
  - Contrat\_professionnalisation - Contrat de professionnalisation
  - Interim - Interim
  - Liberal - Libéral
  - Portage\_salarial - Portage salarial
  - Saisonnier - Saisonnier

-}
type UpdateSocioProContractTypeEnum
    = Apprentissage
    | Cdd
    | Cdi
    | Contrat_professionnalisation
    | Interim
    | Liberal
    | Portage_salarial
    | Saisonnier


list : List UpdateSocioProContractTypeEnum
list =
    [ Apprentissage, Cdd, Cdi, Contrat_professionnalisation, Interim, Liberal, Portage_salarial, Saisonnier ]


decoder : Decoder UpdateSocioProContractTypeEnum
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "apprentissage" ->
                        Decode.succeed Apprentissage

                    "cdd" ->
                        Decode.succeed Cdd

                    "cdi" ->
                        Decode.succeed Cdi

                    "contrat_professionnalisation" ->
                        Decode.succeed Contrat_professionnalisation

                    "interim" ->
                        Decode.succeed Interim

                    "liberal" ->
                        Decode.succeed Liberal

                    "portage_salarial" ->
                        Decode.succeed Portage_salarial

                    "saisonnier" ->
                        Decode.succeed Saisonnier

                    _ ->
                        Decode.fail ("Invalid UpdateSocioProContractTypeEnum type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : UpdateSocioProContractTypeEnum -> String
toString enum____ =
    case enum____ of
        Apprentissage ->
            "apprentissage"

        Cdd ->
            "cdd"

        Cdi ->
            "cdi"

        Contrat_professionnalisation ->
            "contrat_professionnalisation"

        Interim ->
            "interim"

        Liberal ->
            "liberal"

        Portage_salarial ->
            "portage_salarial"

        Saisonnier ->
            "saisonnier"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe UpdateSocioProContractTypeEnum
fromString enumString____ =
    case enumString____ of
        "apprentissage" ->
            Just Apprentissage

        "cdd" ->
            Just Cdd

        "cdi" ->
            Just Cdi

        "contrat_professionnalisation" ->
            Just Contrat_professionnalisation

        "interim" ->
            Just Interim

        "liberal" ->
            Just Liberal

        "portage_salarial" ->
            Just Portage_salarial

        "saisonnier" ->
            Just Saisonnier

        _ ->
            Nothing