import 'package:flutter/material.dart';
import 'package:miniproject/pages/QR/qr_generator.dart';
import 'package:miniproject/pages/register_page.dart';
import 'package:miniproject/pages/signup_page.dart';
import 'package:miniproject/pages/splash.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: Signuppage()
        // body: Registration(),
        body: spalshscreen(),
      ),
      // body: QrGenerator()),
    );
  }
}
