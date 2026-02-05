
class Activite {
  final String typeActivite;
  final String date;
  final String duree;
  final double distance;
  final int denivele;

  Activite({
    required this.typeActivite,
    required this.date,
    required this.duree,
    required this.distance,
    required this.denivele,
  });

  // Pour transformer le JSON de FastAPI en objet Activite
  factory Activite.fromJson(Map<String, dynamic> json) {
    return Activite(
      typeActivite: json['type_activite'],
      date: json['date'],
      duree: json['duree'],
      distance: json['distance'],
      denivele: json['denivele'],
    );
  }
}