import 'package:flutter/material.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "QuickShop",
          style: TextStyle(
              fontSize: getPropScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kTextColor,
            fontSize: getPropScreenWidth(14),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getPropScreenHeight(265),
          width: getPropScreenWidth(235),
        )
      ],
    );
  }
}
