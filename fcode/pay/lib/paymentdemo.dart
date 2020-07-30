import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentDemo extends StatefulWidget {
  @override
  _PaymentDemoState createState() => _PaymentDemoState();
}

class _PaymentDemoState extends State<PaymentDemo> {
  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse res) {
      Fluttertoast.showToast(msg: 'Payment Done ${res.paymentId}');
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse res) {
      Fluttertoast.showToast(msg: 'Problem in Payment $res');
    });
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (ExternalWalletResponse res) {
      Fluttertoast.showToast(msg: 'External Wallet  $res');
    });
  }

  void checkOut(double amount) {
    var options = {
      'key': 'RazorPayKey',
      'amount': amount,
      'name': 'PayBill',
      'description': 'Test',
      'prefill': {'contact': 'PhoneNo', 'email': 'example@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print("CheckOut Issue $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  _payNow() {
    checkOut(500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RaisedButton(
            child: Text('Pay 500'),
            onPressed: () {
              _payNow();
            },
          ),
        ),
      ),
    );
  }
}
