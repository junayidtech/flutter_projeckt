import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Content & Remote Config')),
      body: ListView(children: const [ListTile(title: Text('App notices, toggles'))]),
    );
  }
}
