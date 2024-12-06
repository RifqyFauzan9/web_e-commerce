import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/constant.dart';
import 'package:ui_ecommercee/model/cart.dart';
import 'package:ui_ecommercee/model/products.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/cart_provider.dart';
import 'package:ui_ecommercee/state_managements/favorite_provider.dart';
import 'package:ui_ecommercee/state_managements/theme_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favourite, child) => ListView.builder(
          itemCount: favourite.favouriteProducts.length,
          itemBuilder: (context, index) {
            final Product product = favourite.favouriteProducts[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10),
              ),
              child: Slidable(
                key: Key(product.id.toString()),
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      Provider.of<CartProvider>(context, listen: false)
                          .addCartItem(
                        Cart(product: product, numOfItem: 1),
                      );
                      favourite.toggleFavoriteStatus(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icons.shopping_cart,
                    foregroundColor: Colors.white,
                    label: 'Cart',
                    padding: EdgeInsets.all(getPropScreenWidth(10)),
                    backgroundColor: kPrimaryColor,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      favourite.toggleFavoriteStatus(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Removed from favourite'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icons.delete,
                    label: 'Delete',
                    padding: EdgeInsets.all(getPropScreenWidth(10)),
                    backgroundColor: Colors.red,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ]),
                child: Row(
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
                            product.images[0],
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
                            product.title,
                            style: TextStyle(
                              color: theme.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: getPropScreenWidth(16),
                            ),
                            // style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "\$${product.price}",
                            style: TextStyle(
                                fontSize: getPropScreenWidth(15),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          ),
                        ])),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
