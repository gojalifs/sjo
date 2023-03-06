import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:sjo/helper/helper.dart';
import 'package:sjo/model/frame_images.dart';
import 'package:sjo/model/product.dart';
import 'package:sjo/model/transaction/transaction_data_model.dart';

import 'cutom_product_widget.dart';

class ProductPage extends StatefulWidget {
  final Frame? products;
  const ProductPage({super.key, this.products});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController rController = TextEditingController();
  TextEditingController lController = TextEditingController();
  late FrameImage imgs;
  late Future<FrameImage> future;
  var imagesPath = [];
  bool addCheckBoxValue = false;

  Map<String, dynamic> transactionData = {};
  List<Transaction> cart = [];

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    future = ApiService().getFrameImages(widget.products!.frameId);
    await future.then((value) {
      imgs = value;
      imagesPath = imgs.imgPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.products!.pictPath != null
                          ? FutureBuilder(
                              future: future,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return ImagesDisplay(imagesPath: imagesPath);
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  );
                                }
                              },
                            )
                          : const Icon(Icons.image),
                      const SizedBox(height: 20),
                      Text(
                        widget.products!.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          RatingBar(
                            itemSize: 20,
                            initialRating:
                                double.tryParse(widget.products!.rating!) ?? 0,
                            ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.amber,
                              ),
                              empty: Icon(
                                Icons.star_border,
                                color: Colors.amber.shade100,
                              ),
                            ),
                            onRatingUpdate: (value) {},
                          ),
                          const SizedBox(width: 10),
                          Text('${widget.products!.rating}/5'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rp${widget.products!.price}',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                      const SizedBox(height: 20),

                      /// Start of description section
                      DescriptionWidget(
                        contents: [
                          Text(
                            'Rincian Produk',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(widget.products!.shape),
                          const Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Deskripsi Produk',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(widget.products!.description),
                        ],
                      ),

                      const SizedBox(height: 10),
                      DescriptionWidget(
                        contents: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Customize Product?',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Check to customize the product, like mins, cylinder, etc.',
                                      style: TextStyle(color: Colors.black38),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  value: addCheckBoxValue,
                                  onChanged: (value) {
                                    addCheckBoxValue = !addCheckBoxValue;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          addCheckBoxValue == true
                              ? AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  opacity: addCheckBoxValue ? 1 : 0,
                                  child: ProductCustomizationWidget(
                                    data: (data) {
                                      transactionData = data;
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cart.add(Transaction.fromMap(transactionData));
                          setState(() {});
                          transactionData.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product Added to Cart'),
                            ),
                          );
                        },
                        child: Container(
                          color: const Color(0xFF53ff45),
                          height: 50,
                          child: const Center(child: Text('ADD TO CART')),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: const Color(0xFFff5757),
                          height: 50,
                          child: const Center(child: Text('CANCEL')),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImagesDisplay extends StatelessWidget {
  const ImagesDisplay({
    super.key,
    required this.imagesPath,
  });

  final List imagesPath;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagesPath.length,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                )
              ],
            ),
            child: Image.network(
              imagesPath[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enableInfiniteScroll: false,
        enlargeFactor: 0.5,
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  final List<Widget> contents;

  const DescriptionWidget({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contents,
        ));
  }
}
