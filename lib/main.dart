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
      title: 'Razorpay Payment Gateway App',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 84, 5, 222)),
        useMaterial3: true,
      ),
      home:const RazorPayPage(),
    );
  }
}




      
