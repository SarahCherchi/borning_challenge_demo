import 'package:flutter/material.dart';
import '../services/activite_service.dart';
import '../models/activite.dart';
import '../tools/activite_tool.dart';



class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  ActivitiesScreenState createState() => ActivitiesScreenState();
}

class ActivitiesScreenState extends State<ActivitiesScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Activite>> futureActivites;

  @override
  void initState() {
    super.initState();
    // On appelle les activités de l'utilisateur 1 au démarrage
    futureActivites = apiService.getUserActivities(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes Activités")),
      body: FutureBuilder<List<Activite>>(
        future: futureActivites,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucune activité trouvée."));
          } else {
            final activities = snapshot.data!;
            return ListView.builder(
              itemCount: activities.length,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 75), // padding global
              itemBuilder: (context, index) {
                final act = activities[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        getActivityIcon(act.typeActivite),
                        size: 32,
                        color: getActivityColor(act.typeActivite),
                      ),
                    ),
                    title: Text(
                      act.typeActivite,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      " ${formatDate(act.date)} - Distance : ${act.distance} km -  Dénivelé : ${act.denivele} m",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      " ${formatDuree(act.duree)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}