from pydantic import BaseModel

class UtilisateurModel(BaseModel):
    nom: str
    prenom: str
    