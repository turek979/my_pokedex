import 'package:flutter/material.dart';

import 'package:my_pokedex/widgets/faq_item.dart';
import 'package:my_pokedex/widgets/my_app_bar.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: 'Help & Feedback', appBar: AppBar()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            FAQItem(
                question: 'Is myPokedex coming to IOS?',
                answer: 'Yes as soon as i can afford a MacBook'),
            FAQItem(
                question: 'How can I contact support?',
                answer: 'You can email us at support@mypokedex.com.'),
            FAQItem(
                question: 'Where can I find the app version?',
                answer: 'Go to About section on the tab.'),
            FAQItem(
                question: 'Why are all the images gone?',
                answer:
                    'There are two possible answers: Either the apps database is being updated or your connection is weak. If either is not the case, please contact us immediately!'),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('Email Us'),
              subtitle: Text('support@mypokedex.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('Call Us'),
              subtitle: Text('+1 800 123 4567'),
            ),
            SizedBox(height: 20),
            Text(
              'Feedback',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your feedback here',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Feedback submitted!'),
                ));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
