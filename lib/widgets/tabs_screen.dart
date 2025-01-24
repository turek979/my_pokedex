import 'package:flutter/material.dart';
import 'package:my_pokedex/screens/about_screen.dart';

import 'package:my_pokedex/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        ),
      );
    }
  }

  String activePageTitle = 'Pokedex';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: Center(
        child: Text(
          'Działa',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
