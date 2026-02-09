class StatUserActivite {
  final double totalKm; 
  final int deniveleCumule;
  final String dureeTotale;
  final int nbrActivites;

  StatUserActivite({
    required this.totalKm,
    required this.deniveleCumule,
    required this.dureeTotale,
    required this.nbrActivites
  });

  factory StatUserActivite.fromJson(Map<String, dynamic> json) {
    return StatUserActivite(
      totalKm: json['total_km'],
      deniveleCumule: json['denivele_cumule'],
      dureeTotale: json['duree_totale'],
      nbrActivites: json['nbr_activites'],
    );
  }

}

 