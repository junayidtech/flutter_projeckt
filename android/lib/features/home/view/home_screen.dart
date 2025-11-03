import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 140,
            decoration: glass(),
            child: Ink(
              decoration: BoxDecoration(gradient: appGradient(), borderRadius: BorderRadius.circular(24)),
              child: const Center(child: Text('Daily Check-in', style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ),
          const SizedBox(height: 16),
          _tile(context, 'Watch Ads to Earn', '/wallet'),
          _tile(context, 'Mini Tasks', '/wallet'),
          _tile(context, 'Referral', '/referral'),
          _tile(context, 'Withdraw', '/withdraw'),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (i){
          switch(i){
            case 0: break;
            case 1: context.go('/wallet'); break;
            case 2: context.go('/withdraw'); break;
            case 3: context.go('/profile'); break;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.payments_outlined), label: 'Withdraw'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _tile(BuildContext c, String title, String route){
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: ()=> c.go(route),
      ),
    );
  }
}
