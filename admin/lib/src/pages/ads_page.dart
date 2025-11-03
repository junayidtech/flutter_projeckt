import 'package:flutter/material.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ads Management')),
      body: ListView(children: const [ListTile(title: Text('Configure AdMob IDs & frequency'))]),
    );
  }
}
