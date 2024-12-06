import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommercee/components/costum_navigation_bar.dart';
import 'package:ui_ecommercee/routes.dart';
import 'package:ui_ecommercee/screens/splash/splash_screen.dart';
import 'package:ui_ecommercee/state_managements/auth_provider.dart';
import 'package:ui_ecommercee/state_managements/cart_provider.dart';
import 'package:ui_ecommercee/state_managements/favorite_provider.dart';
import 'package:ui_ecommercee/state_managements/search_provider.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';
import 'package:ui_ecommercee/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MainApp(isLoggedIn: isLoggedIn),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedIn
              ? CustomNavigationBar.routeName
              : SplashScreen.routeName,
          theme: themeData(theme.isDarkMode),
          routes: routes,
        );
      },
    );
  }
}
