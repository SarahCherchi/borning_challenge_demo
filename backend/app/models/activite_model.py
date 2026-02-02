from pydantic import BaseModel
from datetime import date, timedelta
from enum import Enum

class EnumActivites(str, Enum):
    """Enum pour les types d'activités"""
    COURSE = "Course à pied"
    VELO = "Vélo"
    NATATION = "Natation"
    RANDONNEE = "Randonnée"

# Données retournées dans une réponse JSON lorsqu'on interroge une activité
class ActiviteModel(BaseModel):
    """ Modèle de réponse pour une activité """
    type_activite: EnumActivites
    date: date
    duree: timedelta  
    distance: float
    denivele: int

