import 'package:flutter/material.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw Management')),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Row(children: [Text('Filter by method: Bkash/Nagad/Paytm ...')]),
        ),
        Expanded(child: ListView(children: const [
          ListTile(title: Text('Approve/Reject, export CSV')),
        ])),
      ]),
    );
  }
}
