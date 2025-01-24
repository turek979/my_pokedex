import 'package:flutter/material.dart';

import 'package:my_pokedex/screens/help_and_feedback.dart';
import 'package:my_pokedex/widgets/my_app_bar.dart';

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
        builder: (context) => HelpAndFeedbackScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: '404 Not Found', appBar: AppBar()),
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
