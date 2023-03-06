import 'package:flutter/material.dart';

import '../model/product.dart';
import 'product_detail_page/product_detail.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductPage(
        products: Frame(
            frameId: 1,
            name: 'name',
            stock: 1,
            price: '100',
            material: 'material',
            shape: 'shape',
            description: 'description',
            rating: '5'),
      ),
    );
  }
}
