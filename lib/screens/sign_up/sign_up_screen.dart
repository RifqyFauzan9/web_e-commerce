import 'package:flutter/material.dart';
import 'package:ui_ecommercee/screens/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
