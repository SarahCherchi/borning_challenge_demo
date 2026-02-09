import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/stat_user_activite.dart';
import 'package:flutter_application_1/services/activite_service.dart';
import 'package:flutter_application_1/tools/activite_tool.dart';

class ActivitiesStatsScreen extends StatefulWidget {
  const ActivitiesStatsScreen({super.key});

  @override
  State<ActivitiesStatsScreen> createState() => ActivitiesStatsScreenState();
}

class ActivitiesStatsScreenState extends State<ActivitiesStatsScreen> {
  final ApiService apiService = ApiService();
  late Future<StatUserActivite> futureStats;

  @override
  void initState() {
    super.initState();
    futureStats = apiService.getStatUserActivities(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Mes Statistiques",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[900],
        elevation: 1,
        centerTitle: true,
      ),
      body: FutureBuilder<StatUserActivite>(
        future: futureStats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.redAccent),
                  const SizedBox(height: 16),
                  Text(
                    'Erreur : ${snapshot.error}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        futureStats = apiService.getStatUserActivities(1);
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Réessayer"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.grey[900],
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text(
                "Aucune donnée disponible",
                style: TextStyle(color: Colors.grey[600], fontSize: 18),
              ),
            );
          }

          final stats = snapshot.data!;

          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.all(24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.4,
                shrinkWrap: true,
                children: [
                  _buildStatCard(
                    icon: Icons.route_outlined,
                    title: "Total distance parcourue",
                    value: "${stats.totalKm.toStringAsFixed(2)} km",
                    color: Colors.blueAccent,
                  ),
                  _buildStatCard(
                    icon: Icons.trending_up_outlined,
                    title: "Dénivelé cumulé total",
                    value: "${stats.deniveleCumule} m",
                    color: Colors.greenAccent.shade700,
                  ),
                  _buildStatCard(
                    icon: Icons.schedule_outlined,
                    title: "Durée totale d'activité",
                    value: formatDuree(stats.dureeTotale),
                    color: Colors.orangeAccent,
                  ),
                  _buildStatCard(
                    icon: Icons.directions_bike_outlined,
                    title: "Nombre total d'activités",
                    value: stats.nbrActivites.toString(),
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Titre + icône
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}