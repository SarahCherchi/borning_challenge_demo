import 'dart:convert';
import 'package:flutter_application_1/models/stat_user_activite.dart';
import 'package:http/http.dart' as http;
import '../models/activite.dart';

class ApiService {
  
  final String baseUrl = "http://127.0.0.1:8000";

  // Récupérer les activités d'un utilisateur
  Future<List<Activite>> getUserActivities(int idUtilisateur) async {
    final response = await http.get(Uri.parse('$baseUrl/utilisateur/$idUtilisateur/activites'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Activite.fromJson(data)).toList();
    } else {
      throw Exception('Erreur lors du chargement des activités');
    }
  }

  // Récupérer les activités d'une équipe
  Future<List<Activite>> getTeamActivities(int idEquipe) async {
    final response = await http.get(Uri.parse('$baseUrl/equipe/$idEquipe/activites'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Activite.fromJson(data)).toList();
    } else {
      throw Exception('Erreur lors du chargement des activités de l\'équipe');
    }
  }


  Future<StatUserActivite> getStatUserActivities(int idUtilisateur) async{
    final response = await http.get(.parse('$baseUrl/utilisateur/$idUtilisateur/stats'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return StatUserActivite.fromJson(jsonResponse);
    } else {
      throw Exception('Erreur lors du chargement des statistiques : ${response.statusCode}');
      }
  }
}