import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/model/cart.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: getPropScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getPropScreenWidth(20)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kSecondaryColor.withOpacity(0.2)),
              child: Image.asset(
                cart.product.images[0],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ThemeProvider>(
              builder: (context, theme, child) => Text(
                cart.product.title,
                style: TextStyle(
                  fontSize: 16,
                  color: theme.isDarkMode ? Colors.white : Colors.black,
                ),
                // style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(
                    fontSize: getPropScreenWidth(15),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor),
              ),
              TextSpan(
                text: " x${cart.numOfItem}",
                style: const TextStyle(color: kTextColor),
              )
            ])),
          ],
        )
      ],
    );
  }
}
