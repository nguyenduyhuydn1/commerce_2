import 'package:commerce_2/data/data.dart';
import 'package:commerce_2/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        _Header(),
        SizedBox(height: 30),
        _CustomTextFormField(),
        SizedBox(height: 30),
        _TabController()
      ],
    );
  }
}

class _TabController extends StatefulWidget {
  const _TabController();

  @override
  State<_TabController> createState() => _TabControllerState();
}

class _TabControllerState extends State<_TabController>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // late final AnimationController _animationController;
  int selectedValue = 0;
  final List<String> tabs = ["Trending", "Clothing"];

  @override
  void initState() {
    super.initState();

    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 1),
    // );

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 150),
    )..addListener(() {
        // print(
        //     '----------------------- ${_tabController.index} --------------------------------');
        setState(() => selectedValue = _tabController.index);
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: kBackgroundColor,
              indicatorSize: TabBarIndicatorSize.label,
              // event slash
              splashFactory: NoSplash.splashFactory,
              onTap: (value) {
                setState(() {
                  selectedValue = value;
                });
                // _tabController.animateTo(value);
              },
              tabs: [
                ...List.generate(tabs.length, (index) {
                  final checkIndex = selectedValue == index;
                  return Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: checkIndex
                          ? kBackgroundColor
                          : kGreyColor.withOpacity(0.8),
                      boxShadow: checkIndex
                          ? [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ]
                          : null,
                    ),
                    child: Text(tabs[index]),
                  );
                })
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ...List.generate(tabs.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(product.productImageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Icon(Icons.favorite, size: 20),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
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
