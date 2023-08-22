import 'dart:async';
import 'dart:math';

import 'package:commerce_2/data/data.dart';
import 'package:commerce_2/data/size_config.dart';
import 'package:commerce_2/screens/screens.dart';
import 'package:commerce_2/utils/colors.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: [
                _ImageListView(startIndex: 0),
                _ImageListView(startIndex: 1),
                _ImageListView(startIndex: 2),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.65,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white60,
                    Colors.white,
                    Colors.white,
                  ],
                  // stops: [],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Voluptate laborum commodo quis enim excepteur irure ea dolor.",
                    style: kNormalStyle.copyWith(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Culpa deserunt ea cupidatat irure reprehenderit.",
                    style: kNormalStyle.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const _Indicator()
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            left: 20,
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text("Sign Up"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Indicator extends StatefulWidget {
  const _Indicator();

  @override
  State<_Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<_Indicator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(5, (index) {
          final isActive = currentIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              duration: const Duration(milliseconds: 300),
              height: 8.0,
              width: isActive ? 30.0 : 8.0,
              decoration: BoxDecoration(
                color: isActive ? kOrangeColor : Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
        })
      ],
    );
  }
}

class _ImageListView extends StatefulWidget {
  final int startIndex;
  const _ImageListView({required this.startIndex});

  @override
  State<_ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<_ImageListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        print(
            '----------------------- ${_scrollController.position.atEdge} --------------------------------');
        _autoScroll();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrolllEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
        currentScrollPosition == scrolllEndPosition ? 0 : scrolllEndPosition,
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: Transform.rotate(
        angle: 1.96 * pi,
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          height: SizeConfig.screenHeight * 0.6,
          child: ListView.builder(
            // controller: _scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              final product = products[widget.startIndex + index];

              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(product.productImageUrl),
                    height: SizeConfig.screenHeight * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
