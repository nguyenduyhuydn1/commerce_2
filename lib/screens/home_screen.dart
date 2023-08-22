import 'package:commerce_2/utils/colors.dart';
import 'package:commerce_2/views/cart_view.dart';
import 'package:commerce_2/views/category_view.dart';
import 'package:commerce_2/views/person_view.dart';
import 'package:commerce_2/views/views.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = const [
    ProductView(),
    CategoryView(),
    CartView(),
    PersonView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: _NavigationBottomBar(
                onpressed: (i) {
                  _pageController.jumpToPage(i);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NavigationBottomBar extends StatelessWidget {
  final Function(int) onpressed;
  const _NavigationBottomBar({required this.onpressed});

  @override
  Widget build(BuildContext context) {
    const List<IconData> icons = [
      Icons.home,
      Icons.category,
      Icons.shopping_cart,
      Icons.person,
    ];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ...icons.map(
          //   (e) => IconButton(
          //     onPressed: () => onpressed(),
          //     icon: Icon(
          //       e,
          //       color: Colors.white60,
          //       size: 30,
          //     ),
          //   ),
          // ),

          ...icons
              .asMap()
              .map(
                (i, e) => MapEntry(
                  i,
                  IconButton(
                    onPressed: () => onpressed(i),
                    icon: Icon(
                      e,
                      color: Colors.white60,
                      size: 30,
                    ),
                  ),
                ),
              )
              .values
              .toList()
        ],
      ),
    );
  }
}
