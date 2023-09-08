import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatelessWidget {
  static const detailsProduct = "/details-page";

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final productName = routeArguments["name"];
    final productBrand = routeArguments["brand"];
    final productImage = routeArguments["image"];
    final productPrice = routeArguments["price"];
    final productDescription = routeArguments["description"];
    final RxInt tempIndex = 0.obs;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue[700],
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  color: Colors.lightBlue[700],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    productBrand!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    productName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "\$$productPrice",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(productImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 25, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Color"), Text("Size")],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(25, 25),
                                elevation: 0,
                                padding: EdgeInsets.all(0),
                                backgroundColor: Colors.blue,
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                if (tempIndex.value >= 0) {
                                  tempIndex.value--;
                                }
                              },
                              child: Text(
                                " ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(25, 25),
                                elevation: 0,
                                padding: EdgeInsets.all(0),
                                backgroundColor: Colors.orange,
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                if (tempIndex.value != 3) {
                                  tempIndex.value++;
                                }
                              },
                              child: Text(
                                " ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(25, 25),
                                elevation: 0,
                                padding: EdgeInsets.all(0),
                                backgroundColor: Colors.grey,
                                shape: CircleBorder(),
                              ),
                              onPressed: () {},
                              child: Text(
                                " ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          "${tempIndex.value} CM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 5, top: 5),
                  child: Text(productDescription!),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (tempIndex.value > 0) {
                                  tempIndex.value--;
                                }
                              },
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Obx(() => Text(
                                  "${tempIndex.value}",
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                          Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                tempIndex.value++;
                              },
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(40, 40),
                            elevation: 0,
                            padding: EdgeInsets.all(0),
                            backgroundColor: Colors.redAccent,
                            shape: CircleBorder(),
                          ),
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.solidHeart),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue)),
                        child: Icon(
                          FontAwesomeIcons.cartShopping,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.lightBlue[700]),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: Text("BUY NOW"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
