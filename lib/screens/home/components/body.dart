import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/screens/home/components/banner_discount_home.dart';
import 'package:ui_ecommercee/screens/home/components/categories_home.dart';
import 'package:ui_ecommercee/screens/home/components/icon_with_trigger.dart';
import 'package:ui_ecommercee/screens/home/components/popular_products.dart';
import 'package:ui_ecommercee/screens/home/components/search_field.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/cart_provider.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => Column(
          children: [
            discoverText(theme.isDarkMode),
            const SearchField(),
            SizedBox(height: getPropScreenWidth(10)),
            const BannerDiscountHome(),
            Categories(
              isDarkMode: theme.isDarkMode,
            ),
            SizedBox(height: getPropScreenHeight(20)),
            const PopularProducts(),
            SizedBox(height: getPropScreenHeight(20)),
          ],
        ),
      ),
    ));
  }

  Padding discoverText(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Discover',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) => IconWithTrigger(
              svgIcon: "assets/icons/Cart Icon.svg",
              trigger: cart.cartItems.length.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
