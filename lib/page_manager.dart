import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sjo/pages/ar_page.dart';
import 'package:sjo/pages/home_page.dart';
import 'package:sjo/pages/notif_page.dart';
import 'package:sjo/pages/profile_page.dart';
import 'package:sjo/pages/wishlist_page.dart';

class PageManager extends StatefulWidget {
  const PageManager({Key? key}) : super(key: key);

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  int _currentIndex = 0;
  static const List<Widget> _widgetList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child:
          // Scaffold(
          //   appBar: AppBar(
          //     leading: Image.asset('assets/images/3.png'),
          //     actions: [
          //       IconButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: ((context) => const CartPage()),
          //             ),
          //           );
          //         },
          //         icon: const Icon(
          //           Icons.shopping_cart_outlined,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //     title: ConstrainedBox(
          //       constraints: const BoxConstraints(
          //         maxHeight: 35,
          //       ),
          //       child: OutlineSearchBar(
          //         borderColor: Theme.of(context).colorScheme.primaryContainer,
          //         searchButtonIconColor: Colors.black,
          //         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          //         hideSearchButton: true,
          //         hintText: 'What\'s you looking for?',
          //       ),
          //     ),
          //   ),
          // bottomNavigationBar: ConvexAppBar(
          //   initialActiveIndex: 0,
          //   style: TabStyle.fixedCircle,
          //   color: Theme.of(context).colorScheme.tertiary,
          //   activeColor: Theme.of(context).colorScheme.primary,
          //   backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          //   onTap: (int index) {
          //     setState(() {
          //       _currentIndex = index;
          //     });
          //   },
          //   items: const [
          //     TabItem(icon: Icons.home, title: 'Home'),
          //     TabItem(icon: Icons.favorite, title: 'Wishlist'),
          //     TabItem(icon: Icons.camera_alt, title: 'AR Camera'),
          //     TabItem(icon: Icons.notifications, title: 'Notif'),
          //     TabItem(icon: Icons.person, title: 'Profile'),
          //   ],
          // ),
          // bottomNavigationBar: BottomNavigationBar(
          //     currentIndex: _currentIndex,
          //     onTap: (value) {
          //       setState(() {
          //         _currentIndex = value;
          //       });
          //     },
          //     showUnselectedLabels: true,
          //     selectedItemColor: Theme.of(context).colorScheme.primary,
          //     unselectedItemColor: Theme.of(context).colorScheme.tertiary,
          //     items: const [
          //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.favorite), label: 'Wishlist'),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.camera_alt), label: 'AR Camera'),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.notifications), label: 'Notif'),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.person), label: 'Profile'),
          //     ]),
          PersistentTabView(
        context,
        controller: controller..addListener(() {}),
        screens: [
          HomePage(
            context: context,
          ),
          WishListPage(),
          ARPage(),
          NotifPage(),
          ProfilePage(),
        ],
        navBarStyle: NavBarStyle.style15,
        floatingActionButton: const SizedBox(),
        popAllScreensOnTapOfSelectedTab: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200)),
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            inactiveIcon: const Icon(Icons.home_outlined),
            title: 'Home',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.favorite),
            inactiveIcon: const Icon(Icons.favorite_outline),
            title: 'Wishlist',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            title: 'AR Camera',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
            activeColorSecondary: Theme.of(context).colorScheme.primary,
            inactiveColorSecondary: Theme.of(context).colorScheme.tertiary,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.notifications),
            inactiveIcon: const Icon(Icons.notifications_outlined),
            title: 'Notif',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            inactiveIcon: const Icon(Icons.person_outline),
            title: 'Profile',
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
      // body: _widgetList[_currentIndex],
      // const CustomBottomBar(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
