from datetime import timedelta
from fastapi import APIRouter, HTTPException
from app.models import activite_model, stat_activite_model
from app.database.demo_data import UTILISATEURS, ACTIVITES, EQUIPES


router = APIRouter()


def utilisateur_existe(id_utilisateur: int) -> bool:
    return any(u["id_utilisateur"] == id_utilisateur for u in UTILISATEURS)


def equipe_existe(id_equipe: int) -> bool:
    return any(u["id_equipe"] == id_equipe for u in EQUIPES)

# Activités utilisateur #

@router.get("/utilisateur/{id_utilisateur}/activites", response_model=list[activite_model.ActiviteModel])
def get_activite_utilisateur(id_utilisateur: int):
    """ Retoune une liste d'activités pour un utilisateur donné """
    if not utilisateur_existe(id_utilisateur):
        raise HTTPException(status_code=404, detail="Utilisateur non trouvé")

    # Filtre les activités de cet utilisateur
    activites = [a for a in ACTIVITES if a["id_utilisateur"] == id_utilisateur]
    return activites



# Activités equipe #

@router.get("/equipe/{id_equipe}/activites", response_model=list[activite_model.ActiviteModel])
def get_activite_equipe(id_equipe: int):
    """ Retoune une liste d'activités pour une équipe donné """
    if not equipe_existe(id_equipe):
        raise HTTPException(status_code=404, detail="Equipe non trouvée")

    # On garde uniquement les utilisateurs que sont dans l'équipe donnée
    ids_utilisateurs = {
        u["id_utilisateur"]
        for u in UTILISATEURS
        if u["id_equipe"] == id_equipe
    }

    # Filtre les activités de l'équipe
    activites = [a for a in ACTIVITES if a["id_utilisateur"] in ids_utilisateurs]
    return activites


# Statistiques utilisateur #

@router.get("/utilisateur/{id_utilisateur}/stats", response_model=stat_activite_model.StatActiviteModel)
def get_stats_utilisateur(id_utilisateur: int):
    """ Retourne les statistiques d'activités pour un utilisateur donnée """
    # Filtrer les activités de l'utilisateur
    activites_user = [
        act for act in ACTIVITES if act["id_utilisateur"] == id_utilisateur
    ]

    # Calcul des statistiques
    total_km = sum(act["distance"] for act in activites_user)
    denivele_cumule = sum(act["denivele"] for act in activites_user)

    # Somme des durées 
    duree_totale = sum(
        (act["duree"] for act in activites_user),
        start=timedelta()  # valeur initiale pour la somme
    )

    nbr_activites = len(activites_user)

   
    return stat_activite_model.StatActiviteModel(
        total_km=total_km,
        denivele_cumule=denivele_cumule,
        duree_totale=duree_totale,
        nbr_activites=nbr_activites
    )
    

