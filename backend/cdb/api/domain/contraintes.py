import json
from datetime import datetime
from typing import List
from uuid import UUID

from attr import dataclass
from pydantic import BaseModel

from cdb.api.db.crud.account import POLE_EMPLOI_SERVICE_ACCOUNT_ID
from cdb.api.v1.routers.pe_diagnostic.pe_diagnostic_models import Focus
from cdb.cdb_csv.json_encoder import CustomEncoder
from cdb.pe.models.dossier_individu_api import (
    Contrainte,
    ContrainteValeurEnum,
    Objectif,
    ObjectifValeurEnum,
)


@dataclass
class TargetPayload:
    target: str
    createdAt: datetime | None = None


@dataclass
class FocusToAdd:
    theme: str
    creator_id: UUID
    created_at: datetime | None = None
    targets: List[TargetPayload] = []


class TargetToAdd(BaseModel):
    target: str
    creatorId: UUID
    focusId: UUID
    createdAt: datetime | None = None

    def jsonb(self):
        return json.loads(json.dumps(self.dict(exclude_none=True), cls=CustomEncoder))


@dataclass
class TargetDifferences:
    targets_to_add: List[TargetToAdd]
    target_ids_to_cancel: List[UUID]
    target_ids_to_end: List[UUID]


@dataclass
class FocusDifferences:
    focuses_to_add: List[FocusToAdd]
    focus_ids_to_delete: List[UUID]
    target_differences: TargetDifferences


def getThemeFromContrainteId(id: str) -> str | None:
    if id == "23":
        return "mobilite"
    if id == "24":
        return "contraintes_familiales"
    if id == "25":
        return "sante"
    if id == "26":
        return "maitrise_langue"
    if id == "27":
        return "logement"
    if id == "28":
        return "difficulte_financiere"
    if id == "29":
        return "difficulte_administrative"


def getContrainteIdFromTheme(theme: str) -> str | None:
    if theme == "mobilite":
        return "23"
    if theme == "contraintes_familiales":
        return "24"
    if theme == "sante":
        return "25"
    if theme == "maitrise_langue":
        return "26"
    if theme == "logement":
        return "27"
    if theme == "difficulte_financiere":
        return "28"
    if theme == "difficulte_administrative":
        return "29"


def diff_objectifs(
    focuses: List[Focus], contraintes: List[Contrainte]
) -> TargetDifferences:
    shared_contraintes_focuses = [
        (focus, contrainte)
        for focus in focuses
        for contrainte in contraintes
        if contrainte.valeur == ContrainteValeurEnum.OUI
        and getContrainteIdFromTheme(focus.theme) == contrainte.code
    ]
    targets_to_add = []
    target_ids_to_cancel = []
    target_ids_to_end = []
    for shared_focus, shared_contrainte in shared_contraintes_focuses:
        targets = shared_focus.targets or []
        objectifs = shared_contrainte.objectifs

        for objectif in objectifs:
            if (
                objectif.valeur == ObjectifValeurEnum.EN_COURS
                and objectif.libelle not in [target.target for target in targets]
            ):
                targets_to_add.append(
                    TargetToAdd(
                        target=objectif.libelle,
                        focusId=shared_focus.id,
                        createdAt=shared_contrainte.date,
                        creatorId=POLE_EMPLOI_SERVICE_ACCOUNT_ID,
                    )
                )

        for target in targets:
            if target.target in [
                objectif.libelle
                for objectif in objectifs
                if objectif.valeur == ObjectifValeurEnum.ABANDONNE
            ]:
                target_ids_to_cancel.append(target.id)

        for target in targets:
            if target.target in [
                objectif.libelle
                for objectif in objectifs
                if objectif.valeur == ObjectifValeurEnum.REALISE
            ]:
                target_ids_to_end.append(target.id)

    # TODO @lionelb 17/07/23
    # handle case where the cdb target is not found in PE

    return TargetDifferences(
        targets_to_add=targets_to_add,
        target_ids_to_cancel=target_ids_to_cancel,
        target_ids_to_end=target_ids_to_end,
    )


def contraintes_to_focus(contrainte: Contrainte) -> FocusToAdd:
    theme = getThemeFromContrainteId(contrainte.code)
    if not theme:
        raise Exception("unkonwn contrainte code")
    return FocusToAdd(theme=theme, creator_id=POLE_EMPLOI_SERVICE_ACCOUNT_ID)


# TODO : Il faut ajouter une entrée dans notebook_event quand on supprime un objectif
def diff_contraintes(
    focuses: List[Focus], contraintes: List[Contrainte]
) -> FocusDifferences:
    return FocusDifferences(
        focuses_to_add=[
            contrainte_to_focus(contrainte)
            for contrainte in contraintes
            if contrainte.code
            not in [getContrainteIdFromTheme(focus.theme) for focus in focuses]
            and contrainte.valeur == ContrainteValeurEnum.OUI
            and getThemeFromContrainteId(contrainte.code)
        ],
        focus_ids_to_delete=[
            focus.id
            for focus in focuses
            if getContrainteIdFromTheme(focus.theme)
            not in [
                contrainte.code
                for contrainte in contraintes
                if contrainte.valeur == ContrainteValeurEnum.OUI
            ]
        ],
        target_differences=diff_objectifs(contraintes=contraintes, focuses=focuses),
    )


def contrainte_to_focus(contrainte: Contrainte) -> FocusToAdd:
    theme = getThemeFromContrainteId(contrainte.code)
    if not theme:
        raise Exception(
            "error: unknonw contrainte.code %s. " "can't found a matching theme",
            contrainte.code,
        )

    return FocusToAdd(
        theme=theme,
        created_at=contrainte.date,
        creator_id=POLE_EMPLOI_SERVICE_ACCOUNT_ID,
        targets=[
            objectif_to_target(objectif, createdAt=contrainte.date)
            for objectif in contrainte.objectifs
            if objectif.valeur == ObjectifValeurEnum.EN_COURS
        ],
    )


def objectif_to_target(objectif: Objectif, createdAt: datetime | None) -> TargetPayload:
    return TargetPayload(target=objectif.libelle, createdAt=createdAt)
