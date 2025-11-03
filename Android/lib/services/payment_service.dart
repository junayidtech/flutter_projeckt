import 'package:cloud_firestore/cloud_firestore.dart';

enum PaymentMethod { bkash, nagad, rocket, upay, paytm }

extension PaymentMethodX on PaymentMethod {
  String get name => toString().split('.').last;
  String get iconPath => 'assets/payment_icons/' + name + '.png';
}

class PaymentService {
  final _db = FirebaseFirestore.instance.collection('withdraw_requests');

  Future<void> requestWithdraw({
    required String uid,
    required PaymentMethod method,
    required String number,
    required int amount,
  }) async {
    await _db.add({
      'uid': uid,
      'method': method.name,
      'number': number,
      'amount': amount,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
      'approvedBy': null,
    });
  }
}
