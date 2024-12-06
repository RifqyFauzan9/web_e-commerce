import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/size_config.dart';

class ItemButtonProfile extends StatelessWidget {
  const ItemButtonProfile({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.press,
    required this.isDarkTheme,
  });

  final String svgIcon, title;
  final VoidCallback press;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getPropScreenWidth(20),
          vertical: getPropScreenWidth(10),
        ),
        padding: EdgeInsets.all(getPropScreenWidth(20)),
        decoration: BoxDecoration(
            color: isDarkTheme
                ? const Color.fromARGB(255, 54, 49, 49)
                : const Color(0xfff5f6f9),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: kPrimaryColor,
              width: 22,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getPropScreenWidth(14),
                  color: isDarkTheme ? Colors.white : Colors.black),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: isDarkTheme ? Colors.white : kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
