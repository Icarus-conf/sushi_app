import 'package:flutter/material.dart';

import 'package:sushi_app/models/food.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  final void Function()? onTap;
  final Function favTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
    required this.favTap,
  });

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  Color favBtnColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0.2),
              blurRadius: 0.5,
            )
          ],
        ),
        margin: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 10,
          bottom: 10,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.favorite, color: favBtnColor),
              onPressed: () {
                widget.favTap();
                setState(() {
                  favBtnColor = Colors.red;
                });
              },
            ),
            Image.asset(
              widget.food.imagePath,
              height: 140,
              width: 140,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.food.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            widget.food.rating,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
