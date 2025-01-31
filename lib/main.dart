import 'package:flutter/material.dart';
import 'package:razorpay_payment_gateway_ug/razorpay_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayNow Powered By Razorpay',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const RazorPayPage(),
    );
  }
}
