import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'detailsScreen.dart';
import 'model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final int index;

  ProductTile(this.product, this.index);

  void NavDetailsPage(BuildContext context, index) {
    Navigator.of(context).pushNamed(DetailsPage.detailsProduct, arguments: {
      "name": product.name.toString(),
      "brand": product.brand.toString(),
      "image": product.image.toString(),
      "price": product.price.toString(),
      "description": product.description.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => NavDetailsPage(context, index),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.image ?? ""),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(25)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                product.name ?? "",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 3),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    size: 15,
                  ),
                  Text(
                    product.price ?? "",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
