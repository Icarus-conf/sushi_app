import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/pages/cart_page.dart';
import 'package:sushi_app/pages/favorite_page.dart';
import 'package:sushi_app/pages/food_detials.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = 'MenuPage';
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // FOOD MENU

  // Navigate to food items details
  void navigateTofoodDetials(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetialsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  addToFav(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    shop.addToFavorite(foodMenu[index]);
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, FavoritePage.routeName);
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CartPage.routeName);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/shopping-bag.png',
                  width: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: const Text(
                'What would you like to order?',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "FOOD MENU",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // food

            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateTofoodDetials(index),
                  favTap: () {
                    addToFav(index);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Speical for you",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Popular  food
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0.2),
                      blurRadius: 0.5,
                    )
                  ]),
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 15,
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/distilled-beverage-sake-soju-sashimi-sushi-sashimi-sushi-aa5c3ea11eeff846b884f2c1cbcd7271.png',
                        height: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text('Only Today'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '25% OFF',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Shrimp Nigiri",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 18,
                            ),
                          ),
                          const Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\$8.99',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                TextSpan(
                                  text: ' \$3.99',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
