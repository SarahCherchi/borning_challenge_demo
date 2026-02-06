import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/activites_groupe.dart';
//import 'package:flutter_application_1/screens/activites_stats.dart';
import 'activites_utilisateur.dart';


class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;

  // Liste des écrans à afficher selon l'index sélectionné
  final List<Widget> _screens = const [
    ActivitiesScreen(),
    ActivitiesGroupeScreen(),
    //ActivitiesStatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.directions_run),
                  selectedIcon: Icon(Icons.directions_run),
                  label: Text('Activités'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.groups),
                  selectedIcon: Icon(Icons.groups),
                  label: Text('Groupe'),
                ),
                // NavigationRailDestination(
                //   icon: Icon(Icons.bar_chart),
                //   selectedIcon: Icon(Icons.bar_chart),
                //   label: Text('Stats'),
                // ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // Affiche l'écran correspondant à l'index sélectionné
            Expanded(
              child: _screens[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
