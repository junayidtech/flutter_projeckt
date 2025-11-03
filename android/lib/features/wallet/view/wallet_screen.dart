import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Coins'), subtitle: Text('Real-time balance')),
          ListTile(title: Text('History'), subtitle: Text('All wallet transactions')),
        ],
      ),
    );
  }
}
