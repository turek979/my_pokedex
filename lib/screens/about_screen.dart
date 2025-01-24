import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final double version = 1.0;
  final String legalNotice =
      'By using myPokedex, you confirm that you have read the Privacy Policy and have agreed to the Terms of Service. Read them by tapping below.';
  final String disclaimer =
      'myPokedex is an unofficial, free fan made app and is NOT affiliated, endorsed or supported by Nintendo, Game Freak or The Pokémon Company in any way. Some images used in this app are copyrighted and are supported under fair use. Pokémon and Pokémon character names are trademarks of Nintendo. No copyright infringement intended.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Version Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'v$version',
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 82, 82, 82)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Legal',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 7),
                      Text(
                        legalNotice,
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 82, 82, 82)),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(150, 40),
                            ),
                            onPressed: () {},
                            child: Text('Privacy Policy'),
                          ),
                          SizedBox(width: 12),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(150, 40),
                            ),
                            onPressed: () {},
                            child: Text('Terms of Service'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Disclaimer',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 7),
                      Text(
                        disclaimer,
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 82, 82, 82)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
