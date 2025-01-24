import 'package:flutter/material.dart';

import 'package:my_pokedex/screens/about_screen.dart';
import 'package:my_pokedex/screens/help_and_feedback.dart';
import 'package:my_pokedex/screens/pokemon_list_screen.dart';
import 'package:my_pokedex/screens/not_found.dart';
import 'package:my_pokedex/screens/movedex_screen.dart';
import 'package:my_pokedex/screens/settings.dart';
import 'package:my_pokedex/widgets/main_drawer.dart';
import 'package:my_pokedex/widgets/my_app_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'about') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AboutScreen(),
        ),
      );
    } else if (identifier == 'help') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HelpAndFeedbackScreen(),
        ),
      );
    } else if (identifier == 'settings') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ),
      );
    } else if (identifier == 'movedex') {
      activePageTitle = 'Movedex';
      _selectPage(0);
    } else if (identifier == 'pokedex') {
      activePageTitle = 'Pokedex';
      _selectPage(1);
    } else {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NotFound(),
        ),
      );
    }
  }

  String activePageTitle = 'Pokedex';

  @override
  Widget build(BuildContext context) {
    Widget activePage = MovedexScreen();

    if (_selectedPageIndex == 1) {
      activePage = PokemonListScreen();
    }

    return Scaffold(
      appBar: MyAppBar(text: activePageTitle, appBar: AppBar()),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
    );
  }
}
