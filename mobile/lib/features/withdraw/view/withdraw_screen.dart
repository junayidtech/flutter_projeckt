import 'package:flutter/material.dart';
import '../../../services/payment_service.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  PaymentMethod method = PaymentMethod.bkash;
  final numberCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<PaymentMethod>(
              value: method,
              items: PaymentMethod.values.map((m) => DropdownMenuItem(
                value: m, child: Row(children: [
                  Image.asset(m.iconPath, height: 24), const SizedBox(width: 8),
                  Text(m.name.toUpperCase()),
                ]),
              )).toList(),
              onChanged: (v)=> setState(()=> method = v ?? method),
              decoration: const InputDecoration(labelText: 'Payment Method'),
            ),
            const SizedBox(height: 12),
            TextField(controller: numberCtrl, decoration: const InputDecoration(labelText: 'Account / Number')),
            const SizedBox(height: 12),
            TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            FilledButton.icon(onPressed: _submit, icon: const Icon(Icons.send), label: const Text('Request Withdraw')),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final svc = PaymentService();
    await svc.requestWithdraw(
      uid: 'demo',
      method: method,
      number: numberCtrl.text,
      amount: int.tryParse(amountCtrl.text) ?? 0,
    );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Withdraw request submitted.')));
    }
  }
}
