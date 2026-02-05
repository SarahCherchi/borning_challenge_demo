import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iso_duration_parser/iso_duration_parser.dart';

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat('dd/MM/yyyy').format(date);
  
}

String formatDuree(String dureeString){
  final duration = IsoDuration.parse(dureeString);
  if(duration.hours == 0 ) {
    return duration.format("{m}m:{s}s");
  }else{
    return duration.format("{h}h:{m}m:{s}s");

  }
}

final Map<String, Map<String, dynamic>> activityConfig = {
  'course à pied': {'icon': Icons.directions_run, 'color': Colors.orange},
  'vélo': {'icon': Icons.directions_bike, 'color': Colors.green},
  'natation': {'icon': Icons.pool, 'color': Colors.blue},
  'randonnée': {'icon': Icons.hiking, 'color': Colors.brown},
};

IconData getActivityIcon(String typeActivite) {
  return activityConfig[typeActivite.toLowerCase()]?['icon'] ?? Icons.sports;
}

Color getActivityColor(String typeActivite) {
  return activityConfig[typeActivite.toLowerCase()]?['color'] ?? Colors.grey;
}
