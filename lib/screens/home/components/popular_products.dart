import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommercee/components/item_popular_product.dart';
import 'package:ui_ecommercee/model/products.dart';
import 'package:ui_ecommercee/screens/details/detail_screen.dart';
import 'package:ui_ecommercee/size_config.dart';
import 'package:ui_ecommercee/state_managements/favorite_provider.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, products, child) => SizedBox(
        height: getPropScreenWidth(
            450), // Tinggi diatur agar cukup untuk beberapa baris
        child: Padding(
          padding: EdgeInsets.only(
            right: getPropScreenWidth(10),
            left: getPropScreenWidth(10),
            bottom: getPropScreenWidth(0),
          ),
          child: GridView.builder(
            itemCount: products.listProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dua kolom
              childAspectRatio:
                  0.75, // Rasio tinggi-lebar (atur sesuai kebutuhan)
              crossAxisSpacing: getPropScreenWidth(5), // Jarak antar kolom
              mainAxisSpacing: getPropScreenWidth(10), // Jarak antar baris
            ),
            itemBuilder: (context, index) {
              final Product product = products.listProducts[index];
              return ItemPopularProduct(
                product: product,
                press: () => Navigator.pushNamed(
                  context,
                  DetailScreen.routeName,
                  arguments: product,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
