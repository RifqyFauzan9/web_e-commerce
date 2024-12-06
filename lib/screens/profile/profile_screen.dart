import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/screens/profile/components/body.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const Body(),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    forceMaterialTransparency: true,
    automaticallyImplyLeading: true,
    centerTitle: true,
    title: Text(
      "Profile",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    actions: [
      Consumer<ThemeProvider>(
        builder: (context, theme, child) => IconButton(
          icon: Icon(
            theme.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            theme.toggleTheme(!theme.isDarkMode);
          },
        ),
      ),
    ],
  );
}
