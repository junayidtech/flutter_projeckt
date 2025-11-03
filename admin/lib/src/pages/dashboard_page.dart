import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 3,
        childAspectRatio: 2.8,
        children: const [
          _CardStat(title: 'Users', value: '—'),
          _CardStat(title: 'Active Devices', value: '—'),
          _CardStat(title: 'Pending Withdrawals', value: '—'),
        ],
      ),
    );
  }
}

class _CardStat extends StatelessWidget {
  final String title;
  final String value;
  const _CardStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
  }
}
