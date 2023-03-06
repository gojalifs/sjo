import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Cart Page'),
        )
        // DefaultTabController(
        //   length: 3,
        //   child: SizedBox(
        //     height: 300,
        //     width: 300,
        //     child: Column(
        //       children: const [
        //         TabBar(
        //           tabs: [
        //             Tab(icon: Icon(Icons.directions_car)),
        //             Tab(icon: Icon(Icons.directions_transit)),
        //             Tab(icon: Icon(Icons.directions_bike)),
        //           ],
        //         ),
        //         TabBarView(
        //           children: [
        //             Icon(Icons.directions_car),
        //             Icon(Icons.directions_transit),
        //             Icon(Icons.directions_bike),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
