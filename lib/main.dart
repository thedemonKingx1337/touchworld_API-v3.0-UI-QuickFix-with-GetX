import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apiController.dart';
import 'package:get/get.dart';
import 'detailsScreen.dart';
import 'producttile.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => HomeMain(),
      DetailsPage.detailsProduct: (context) => DetailsPage(),
    },
  ));
}

class HomeMain extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ),
            )
          ],
          bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Women",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[850]),
                      ),
                    ),
                    TabBar(
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.black,
                        labelPadding: EdgeInsets.symmetric(vertical: 10),
                        tabs: [
                          Text(
                            "Hand bag",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Jewllery",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Footware",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Dresses",
                            style: TextStyle(color: Colors.black),
                          ),
                        ])
                  ],
                ),
              ),
              preferredSize: Size(double.infinity, 70)),
        ),
        body: Obx(() {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: .7),
              itemCount: productController.productList.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return ProductTile(productController.productList[index], index);
              },
            );
          }
        }),
      ),
    );
  }
}
