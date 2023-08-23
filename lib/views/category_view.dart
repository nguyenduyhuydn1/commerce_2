import 'package:commerce_2/data/data.dart';
import 'package:commerce_2/data/size_config.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final category = categories[index % categories.length];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: SizeConfig.screenWidth * 0.8,
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(category.thumbnailImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
