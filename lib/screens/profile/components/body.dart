import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/screens/profile/components/item_button_profile.dart';
import 'package:ui_ecommercee/screens/profile/components/profile_picture.dart';
import 'package:ui_ecommercee/screens/sign_in/sign_in_screen.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/auth_provider.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: getPropScreenWidth(30)),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => Column(
          children: [
            const ProfilePicture(),
            SizedBox(height: getPropScreenWidth(20)),
            Consumer<AuthProvider>(
              builder: (context, auth, child) => Text(
                auth.email ?? '', 
                style: const TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: getPropScreenWidth(10)),
            ItemButtonProfile(
              svgIcon: "assets/icons/User Icon.svg",
              title: "My Account",
              isDarkTheme: theme.isDarkMode,
              press: () {},
            ),
            ItemButtonProfile(
              svgIcon: "assets/icons/Bell.svg",
              title: "Notification",
              isDarkTheme: theme.isDarkMode,
              press: () {},
            ),
            ItemButtonProfile(
              svgIcon: "assets/icons/Settings.svg",
              title: "Settings",
              isDarkTheme: theme.isDarkMode,
              press: () {},
            ),
            ItemButtonProfile(
              svgIcon: "assets/icons/Question mark.svg",
              title: "Help Center",
              isDarkTheme: theme.isDarkMode,
              press: () {},
            ),
            ItemButtonProfile(
              svgIcon: "assets/icons/Log out.svg",
              title: "Log Out",
              isDarkTheme: theme.isDarkMode,
              press: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .setAuth(false);
                Navigator.pushNamedAndRemoveUntil(context,
                    SignInScreen.routeName, (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
