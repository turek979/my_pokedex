import 'package:flutter/material.dart';
import 'package:my_pokedex/screens/about_screen.dart';

class NotFound extends StatefulWidget {
  const NotFound({super.key});

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  void _goToSettings() async {
    Navigator.pop(context);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AboutScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404 Not found'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Page not found. Report an error here:'),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _goToSettings, child: Text('Help & Feedback'))
          ],
        ),
      ),
    );
  }
}
