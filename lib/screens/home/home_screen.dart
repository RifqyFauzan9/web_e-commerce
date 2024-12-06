import 'package:flutter/material.dart';
import 'package:ui_ecommercee/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      // bottomNavigationBar: CostumNavigationBar(
      //   menu: MenuState.home,
      // ),
    );
  }
}
