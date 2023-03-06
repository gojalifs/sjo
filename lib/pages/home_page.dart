import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sjo/model/product_model.dart';
import 'package:sjo/pages/product_detail_page/product_detail.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:sjo/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  final BuildContext context;

  const HomePage({super.key, required this.context});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<ProductModel> eyeGlassModel = [
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
      discountPercent: '5',
      discountedPrice: '285.000',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRays',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
    ProductModel(
      price: '300.000',
      name: 'Rayban BluRay',
      rating: '4.5',
      image: 'assets/images/rayban_aviator.jpg',
      category: 'Kacamata',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            floating: false,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 10),
              title: Row(
                children: [
                  ImageIcon(
                    const AssetImage('assets/images/3.png'),
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Cari Sesuatu . . .',
                            hintStyle: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(widget.context).push(
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none_rounded))
                ],
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      ImageSlideshow(
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          Image.asset('assets/images/banner.webp'),
                          Image.asset('assets/images/banner2.webp'),
                          Image.asset('assets/images/1.png'),
                          Image.asset('assets/images/3.png'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                DefaultTabController(
                  length: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: const TabBar(
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Tab 1'),
                            Tab(text: 'Tab 2'),
                            Tab(text: 'Tab 3'),
                            Tab(text: 'Tab 4'),
                          ],
                        ),
                      ),
                      Container(
                        height: 400, //height of TabBarView
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                        child: TabBarView(
                          children: <Widget>[
                            GridView(
                              primary: false,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              children: eyeGlassModel
                                  .map(
                                    (e) => InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductPage(
                                              // title: e.name,
                                              ),
                                        ),
                                      ),
                                      child: Card(
                                        child: Image.asset(
                                          e.image!,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            Container(
                              child: const Center(
                                child: Text(
                                  'Display Tab 2',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              child: const Center(
                                child: Text(
                                  'Display Tab 3',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              child: const Center(
                                child: Text(
                                  'Display Tab 4',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Section(
                //   newContext: widget.context,
                //   title: Container(
                //     color: Colors.white,
                //     padding: const EdgeInsets.all(10),
                //     child: const Text(
                //       'Best Seller',
                //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   gridItems: eyeGlassModel,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCategoryButton extends StatefulWidget {
  bool? isSelected;

  CustomCategoryButton({super.key, this.isSelected = false});

  @override
  State<CustomCategoryButton> createState() => _CustomCategoryButtonState();
}

class _CustomCategoryButtonState extends State<CustomCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: widget.isSelected! ? Colors.amber : Colors.black),
        onPressed: () {
          setState(() {
            widget.isSelected = !widget.isSelected!;
            print(widget.isSelected);
          });
        },
        child: const Text('favourite '));
  }
}

class Section extends MultiSliver {
  final Key? key;
  final BuildContext newContext;
  final Widget title;
  // final List<Widget> items;
  final List<ProductModel>? gridItems;

  Section({
    this.key,
    this.gridItems,
    required this.newContext,
    required this.title,
    // required this.items,
  }) : super(
          key: key,
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(child: title),
            // SliverList(
            //   delegate: SliverChildListDelegate.fixed(items),
            // ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: gridItems!.length,
                  (context, index) => InkWell(
                    onTap: () =>
                        Navigator.of(newContext).push(MaterialPageRoute(
                      builder: (context) => ProductPage(
                          // title: '${gridItems[index].name} $index',
                          // products: gridItems[index],
                          ),
                    )),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // LayoutBuilder(
                            //   builder: (context, constraint) {
                            //     return Container(
                            //       height: 0.9 * constraint.maxWidth,
                            //       color: Colors.red,
                            //     );
                            //   },
                            // ),
                            Expanded(
                              child: Image.asset(
                                  'assets/images/rayban_aviator.jpg'),
                            ),
                            Text(gridItems[index].name),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  Text(
                                    gridItems[index].price,
                                    style: gridItems[index]
                                            .discountedPrice
                                            .isNotEmpty
                                        ? TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                          )
                                        : const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  gridItems[index].discountedPrice.isNotEmpty
                                      ? Text(
                                          gridItems[index].discountedPrice,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : const SizedBox(),
                                  gridItems[index].discountPercent.isNotEmpty
                                      ? Text(
                                          ' ${gridItems[index].discountPercent}% off',
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_sharp,
                                  size: 15,
                                  color: Colors.yellow.shade700,
                                ),
                                Text(gridItems[index].rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
}
