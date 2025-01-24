import 'package:flutter/material.dart';

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

  String activePageTitle = 'Pokedex';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'Działa',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
