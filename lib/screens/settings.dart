import 'package:flutter/material.dart';
import 'package:my_pokedex/widgets/my_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: 'Settings', appBar: AppBar()),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Theme'),
            subtitle: Text('Light'),
            onTap: () {},
          ),
          Divider(),
          Text(
            'Notifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            value: true,
            onChanged: (value) {},
            title: Text('Push Notifications'),
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Email Notifications'),
          ),
          Divider(),
          Text(
            'Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
