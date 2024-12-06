import 'package:flutter/material.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/size_config.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getPropScreenWidth(20)),
      padding: EdgeInsets.only(top: getPropScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.17),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: child,
    );
  }
}