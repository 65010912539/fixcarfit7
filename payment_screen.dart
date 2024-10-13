import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าชำระเงิน'),
      ),
      body: const Center(
        child: Text('ที่นี่จะเป็นหน้าชำระเงิน'),
      ),
    );
  }
}
