import 'package:flutter/material.dart';
import 'package:ui_ecommercee/model/products.dart';
import 'package:ui_ecommercee/screens/details/components/body.dart';
import 'package:ui_ecommercee/size_config.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
            child: Row(
              children: [
                Text(
                  "${product.rating}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
