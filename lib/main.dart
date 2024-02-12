import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/pages/cart_page.dart';
import 'package:sushi_app/pages/favorite_page.dart';

import 'package:sushi_app/pages/intro_page.dart';
import 'package:sushi_app/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroPage.routeName,
      routes: {
        IntroPage.routeName: (context) => const IntroPage(),
        MenuPage.routeName: (context) => const MenuPage(),
        CartPage.routeName: (context) => const CartPage(),
        FavoritePage.routeName: (context) => const FavoritePage(),
      },
    );
  }
}
