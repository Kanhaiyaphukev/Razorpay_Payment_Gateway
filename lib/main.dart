import 'package:flutter/material.dart';
import 'package:razorpay_app/razorpay_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razorpay Payment Gateway App',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const RazorPayPage(),
    );
  }
}




      
