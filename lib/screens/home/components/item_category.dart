import 'package:flutter/material.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/size_config.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.name,
    required this.icon,
    this.isFirst = false,
    required this.isDarkMode,
  });

  final String name, icon;
  final bool isFirst;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getPropScreenWidth(10)),
      padding: EdgeInsets.symmetric(
          horizontal: getPropScreenWidth(15),
          vertical: getPropScreenHeight(10)),
      decoration: BoxDecoration(
        color: isFirst ? kPrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: isFirst || isDarkMode
            ? Border.all(color: kPrimaryColor, width: 2)
            : Border.all(color: Colors.black, width: 2),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isFirst || isDarkMode ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
