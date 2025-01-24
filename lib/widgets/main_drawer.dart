import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String indentifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.red.withValues(alpha: 0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.catching_pokemon,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    "Gotta Catch'em all!",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.catching_pokemon_sharp,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Pokedex',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('pokedex');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shield,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Movedex',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('movedex');
            },
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('settings');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.mail,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Help & Feedback',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('help');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'About',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('about');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.error_outline,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'error.debug',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('error');
            },
          ),
        ],
      ),
    );
  }
}
