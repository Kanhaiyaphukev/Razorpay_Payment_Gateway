import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({super.key});

  @override
  RazorPayPageState createState() => RazorPayPageState();
}

class RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorPay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'Name': 'Payment For Travelgeek',
      'prefill': {'contact': '8830314380', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorPay.open(options);
    } catch (e) {
      debugPrint('Error :e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: " Payment Successful ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: " Payment Failure ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: " External Wallet${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorPay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlePaymentExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 121,
          ),
          Image.asset(
            "assets/Integration icon.jpg",
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Text('Welcome to Pay Now',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              textAlign: TextAlign.center),
          Text('Powered by Razorpay',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(
            height: 105,
          ),
          Padding(
            padding: EdgeInsets.all(28),
            child: TextFormField(
              cursorColor: Colors.black,
              autofocus: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Enter Amount To Pay',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                )),
                errorStyle: TextStyle(color: Colors.greenAccent, fontSize: 15),
              ),
              controller: amtController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Amount To Be Paid';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (amtController.text.toString().isNotEmpty) {
                setState(() {
                  int amount = int.parse(amtController.text.toString());
                  openCheckout(amount);
                });
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pay Now',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
