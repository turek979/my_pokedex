import 'package:flutter/material.dart';

class PokedexList extends StatelessWidget {
  const PokedexList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Działa',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
