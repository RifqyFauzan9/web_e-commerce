import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/components/my_default_button.dart';
import 'package:ui_ecommercee/components/rounded_icon_button.dart';
import 'package:ui_ecommercee/model/cart.dart';
import 'package:ui_ecommercee/model/products.dart';
import 'package:ui_ecommercee/screens/details/components/color_picker.dart';
import 'package:ui_ecommercee/screens/details/components/detail_description.dart';
import 'package:ui_ecommercee/screens/details/components/image_detail.dart';
import 'package:ui_ecommercee/screens/details/components/rounded_container.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/cart_provider.dart';
import 'package:ui_ecommercee/state_managements/favorite_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentSelectedColor = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetail(product: widget.product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(product: widget.product),
                  SizedBox(
                    height: getPropScreenWidth(40),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropScreenWidth(20)),
                    child: SizedBox(
                      height: getPropScreenWidth(40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                            widget.product.colors.length,
                            (index) {
                              final Color color = widget.product.colors[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentSelectedColor = index;
                                  });
                                },
                                child: ItemColorDot(
                                  color: color,
                                  isSelected: index == currentSelectedColor,
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              RoundedIconBtn(
                                  icon: Icons.remove,
                                  press: totalSelected > 1
                                      ? () {
                                          setState(() {
                                            totalSelected--;
                                          });
                                        }
                                      : null),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "$totalSelected",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              RoundedIconBtn(
                                  icon: Icons.add,
                                  showShadow: true,
                                  press: () {
                                    setState(() {
                                      totalSelected++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropScreenWidth(70),
                        vertical: getPropScreenWidth(40)),
                    child: MyDefaultButton(
                        text: "Add To Cart",
                        press: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCartItem(Cart(
                                  product: widget.product,
                                  numOfItem: totalSelected));

                          if (widget.product.isFavourite) {
                            Provider.of<FavoriteProvider>(context,
                                    listen: false)
                                .toggleFavoriteStatus(widget.product.id);
                          }

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Added to cart"),
                          ));
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
