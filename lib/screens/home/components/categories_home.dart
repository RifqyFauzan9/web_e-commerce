import 'package:flutter/material.dart';
import 'package:ui_ecommercee/model/category_data.dart';
import 'package:ui_ecommercee/screens/home/components/item_category.dart';
import 'package:ui_ecommercee/screens/home/components/section_title.dart';
import 'package:ui_ecommercee/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getPropScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(title: 'Categories', isDarkMode: isDarkMode,),
          SizedBox(height: getPropScreenHeight(10)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(listCategory.length, (index) {
                final CategoryData category = listCategory[index];
                return ItemCategory(
                  name: category.name,
                  icon: category.icon,
                  isDarkMode: isDarkMode,
                  isFirst: index == 0,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
