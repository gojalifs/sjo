import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sjo/helper/helper.dart';
import 'package:sjo/model/product.dart';
import 'package:sjo/pages/cart_page.dart';
import 'package:sjo/pages/notif_page.dart';
import 'package:sjo/pages/product_detail_page/product_detail.dart';
import 'package:sjo/pages/profile_page.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late Future future;
  List<Frame> products = [];
  int index = 0;

  @override
  void initState() {
    future = ApiService().getFrame();
    future.then((value) {
      products.addAll(value);

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: index == 0 ? bottomNavLabel('HOME') : const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: index == 1
                ? bottomNavLabel('All Product')
                : const ImageIcon(AssetImage('assets/icons/products.png')),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: index == 2
                ? bottomNavLabel('CART')
                : const Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: index == 3
                ? bottomNavLabel('PROFILE')
                : const Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: index == 0
            ? GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      pinned: true,
                      floating: true,
                      backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding:
                            const EdgeInsets.symmetric(horizontal: 10),
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
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const NotifPage(),
                                  ),
                                );
                              },
                              icon:
                                  const Icon(Icons.notifications_none_rounded),
                            ),
                          ],
                        ),
                        centerTitle: true,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ImageSlideshow(
                            autoPlayInterval: 3000,
                            isLoop: true,
                            height: 150,
                            children: [
                              Image.asset('assets/images/banner.webp'),
                              Image.asset('assets/images/banner2.webp'),
                              Image.asset('assets/images/1.png'),
                              Image.asset('assets/images/3.png'),
                            ],
                          ),
                          RecommendedView(future: future, products: products),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : index == 2
                ? const CartPage()
                : index == 3
                    ? ProfilePage()
                    : const Center(
                        child: Text('data'),
                      ),
      ),
    );
  }

  Text bottomNavLabel(s) => Text(
        s,
        style: const TextStyle(
          color: Color.fromRGBO(255, 87, 87, 1),
          fontSize: 20,
        ),
      );
}

class RecommendedView extends StatelessWidget {
  const RecommendedView({
    super.key,
    required this.future,
    required this.products,
  });

  final Future future;
  final List<Frame> products;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.4,
              ),
              itemBuilder: (context, index) {
                var product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            products: product,
                          ),
                        ));
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: product.pictPath != null
                                ? Image.network(
                                    product.pictPath!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image_not_supported),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 17,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      product.rating == null
                                          ? ''
                                          : product.rating!,
                                      style: const TextStyle(
                                          color: Colors.black45),
                                    )
                                  ],
                                ),
                                Text(
                                  'Rp${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.red,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
