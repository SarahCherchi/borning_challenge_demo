from pydantic import BaseModel
from datetime import timedelta


class StatActiviteModel(BaseModel):
    total_km: float 
    denivele_cumule: int 
    duree_totale: timedelta
    nbr_activites: int