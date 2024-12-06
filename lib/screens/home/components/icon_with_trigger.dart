import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/screens/cart/cart_screen.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';

class IconWithTrigger extends StatelessWidget {
  const IconWithTrigger({
    super.key,
    required this.svgIcon,
    this.trigger,
  });

  final String svgIcon;
  final String? trigger;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CartScreen.routeName);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: getPropScreenWidth(46),
            width: getPropScreenWidth(46),
            padding: EdgeInsets.all(getPropScreenWidth(12)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kSecondaryColor.withOpacity(0.5)),
            ),
            child: Consumer<ThemeProvider>(
              builder: (context, theme, child) =>  SvgPicture.asset(
                svgIcon,
                color: theme.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          if (trigger != null && trigger != "0")
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                width: getPropScreenWidth(16),
                height: getPropScreenWidth(16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    trigger!,
                    style: TextStyle(
                        fontSize: getPropScreenWidth(10),
                        color: Colors.white,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
