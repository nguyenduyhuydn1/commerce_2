import 'package:commerce_2/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          _Header(),
          SizedBox(height: 30),
          _CustomTextFormField()
        ],
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField();

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        style: const TextStyle(decoration: TextDecoration.none),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          hintText: "Search ...",
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.close),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            "Aliquip adipisicing ad.",
            style: kNormalStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: const Icon(Icons.notifications),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              "https://images.pexels.com/photos/675920/pexels-photo-675920.jpeg?cs=srgb&dl=pexels-min-an-675920.jpg&fm=jpg",
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
    );
  }
}
