from datetime import date, timedelta
from app.models.activite_model import EnumActivites

# J'utilise des fausse données pour simuler une base de données

EQUIPES = [
    {"id_equipe": 1, "nom_equipe": "Equipe IT"},
    {"id_equipe": 2, "nom_equipe": "Equipe RH"},
    {"id_equipe": 3, "nom_equipe": "Equipe Communication"},
]

UTILISATEURS = [
    # Équipe 1
    {"id_utilisateur": 1, "nom": "Dupont", "prenom": "Jean", "id_equipe": 1},
    {"id_utilisateur": 2, "nom": "Martin", "prenom": "Alice", "id_equipe": 1},
    {"id_utilisateur": 3, "nom": "Bernard", "prenom": "Luc", "id_equipe": 1},
    {"id_utilisateur": 4, "nom": "Petit", "prenom": "Emma", "id_equipe": 1},
    {"id_utilisateur": 5, "nom": "Robert", "prenom": "Nicolas", "id_equipe": 1},
    {"id_utilisateur": 6, "nom": "Moreau", "prenom": "Sarah", "id_equipe": 1},

    # Équipe 2
    {"id_utilisateur": 7, "nom": "Durand", "prenom": "Pierre", "id_equipe": 2},
    {"id_utilisateur": 8, "nom": "Lefevre", "prenom": "Julie", "id_equipe": 2},
    {"id_utilisateur": 9, "nom": "Garcia", "prenom": "Miguel", "id_equipe": 2},
    {"id_utilisateur": 10, "nom": "Roux", "prenom": "Claire", "id_equipe": 2},
    {"id_utilisateur": 11, "nom": "Fournier", "prenom": "Antoine", "id_equipe": 2},
    {"id_utilisateur": 12, "nom": "Blanc", "prenom": "Sophie", "id_equipe": 2},

    # Équipe 3
    {"id_utilisateur": 13, "nom": "Gauthier", "prenom": "Thomas", "id_equipe": 3},
    {"id_utilisateur": 14, "nom": "Chevalier", "prenom": "Laura", "id_equipe": 3},
    {"id_utilisateur": 15, "nom": "Perrin", "prenom": "Maxime", "id_equipe": 3},
    {"id_utilisateur": 16, "nom": "Lopez", "prenom": "Isabel", "id_equipe": 3},
    {"id_utilisateur": 17, "nom": "Nguyen", "prenom": "Minh", "id_equipe": 3},
    {"id_utilisateur": 18, "nom": "Marchand", "prenom": "Paul", "id_equipe": 3},
]

ACTIVITES = [
    # Utilisateur 1
    {"id_activite": 101, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 26),
     "duree": timedelta(minutes=35, seconds=12), "distance": 5.2, "denivele": 50, "id_utilisateur": 1},
    {"id_activite": 102, "type_activite": EnumActivites.VELO, "date": date(2025, 10, 28),
     "duree": timedelta(hours=1, minutes=40), "distance": 38.5, "denivele": 420, "id_utilisateur": 1},

    # Utilisateur 2
    {"id_activite": 103, "type_activite": EnumActivites.VELO, "date": date(2025, 10, 27),
     "duree": timedelta(hours=2, minutes=15), "distance": 45.8, "denivele": 450, "id_utilisateur": 2},
    {"id_activite": 104, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 29),
     "duree": timedelta(minutes=50), "distance": 9.3, "denivele": 90, "id_utilisateur": 2},

    # Utilisateur 3
    {"id_activite": 105, "type_activite": EnumActivites.RANDONNEE, "date": date(2025, 10, 28),
     "duree": timedelta(hours=4), "distance": 12.1, "denivele": 890, "id_utilisateur": 3},
    {"id_activite": 106, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 30),
     "duree": timedelta(minutes=42), "distance": 7.5, "denivele": 110, "id_utilisateur": 3},

    # Utilisateur 4
    {"id_activite": 107, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 25),
     "duree": timedelta(minutes=30), "distance": 4.8, "denivele": 40, "id_utilisateur": 4},
    {"id_activite": 108, "type_activite": EnumActivites.NATATION, "date": date(2025, 10, 27),
     "duree": timedelta(minutes=60), "distance": 0.0, "denivele": 0, "id_utilisateur": 4},

    # Utilisateur 5
    {"id_activite": 109, "type_activite": EnumActivites.VELO, "date": date(2025, 10, 26),
     "duree": timedelta(hours=3), "distance": 62.4, "denivele": 700, "id_utilisateur": 5},
    {"id_activite": 110, "type_activite": EnumActivites.RANDONNEE, "date": date(2025, 10, 29),
     "duree": timedelta(hours=5), "distance": 15.2, "denivele": 1200, "id_utilisateur": 5},

    # Utilisateur 6
    {"id_activite": 111, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
     "duree": timedelta(minutes=45), "distance": 8.4, "denivele": 95, "id_utilisateur": 6},
    {"id_activite": 112, "type_activite": EnumActivites.VELO, "date": date(2025, 10, 30),
     "duree": timedelta(hours=1, minutes=20), "distance": 29.0, "denivele": 310, "id_utilisateur": 6},

    # Utilisateur 7
    {"id_activite": 113, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
     "duree": timedelta(minutes=45), "distance": 8.4, "denivele": 95, "id_utilisateur": 6},

    # Utilisateur 8
    {"id_activite": 114, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=38), "distance": 7.6, "denivele": 80, "id_utilisateur": 8},

    # Utilisateur 9
    {"id_activite": 115, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=42), "distance": 8.1, "denivele": 90, "id_utilisateur": 9},

    # Utilisateur 10
    {"id_activite": 116, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=47), "distance": 9.0, "denivele": 105, "id_utilisateur": 10},

    # Utilisateur 11
    {"id_activite": 117, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=33), "distance": 6.2, "denivele": 60, "id_utilisateur": 11},

    # Utilisateur 12
    {"id_activite": 118, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=50), "distance": 10.3, "denivele": 120, "id_utilisateur": 12},

    # Utilisateur 13
    {"id_activite": 119, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=40), "distance": 7.9, "denivele": 85, "id_utilisateur": 13},

    # Utilisateur 14
    {"id_activite": 120, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=55), "distance": 11.0, "denivele": 140, "id_utilisateur": 14},

    # Utilisateur 15
    {"id_activite": 121, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=29), "distance": 5.5, "denivele": 45, "id_utilisateur": 15},

    # Utilisateur 16
    {"id_activite": 122, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=48), "distance": 9.6, "denivele": 110, "id_utilisateur": 16},

    # Utilisateur 17
    {"id_activite": 123, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=36), "distance": 6.9, "denivele": 70, "id_utilisateur": 17},

    # Utilisateur 18
    {"id_activite": 124, "type_activite": EnumActivites.COURSE, "date": date(2025, 10, 28),
    "duree": timedelta(minutes=52), "distance": 10.8, "denivele": 130, "id_utilisateur": 18}

    ]