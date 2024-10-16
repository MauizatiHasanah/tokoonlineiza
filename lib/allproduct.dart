import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlineiza/addproduct.dart';
import 'package:tokoonlineiza/addproduct.dart';
import 'package:tokoonlineiza/editproduct.dart';
import 'package:tokoonlineiza/productdetail.dart';

import 'itemsdata.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List productList = [];

  Future<void> deleteProduct(String id) async {
    String urlDeleteProduct = "https://mauizati.000webhostapp.com/deleteproduct_a.php";
    try {
      var responseDelete = await http.post(Uri.parse(urlDeleteProduct), body: {"id": id});
      var deleteDataProduct = jsonDecode(responseDelete.body);
      if (deleteDataProduct["success"] == "true") {
        print("Product successfully deleted");
        getAllProduct();  // Refresh the product list after deletion
      } else {
        print("Product deletion failed");
      }
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> getAllProduct() async {
  String urlProduct = "https://mauizati.000webhostapp.com/getallproduct.php";
  try {
    var response = await http.get(Uri.parse(urlProduct));
    setState(() {
      productList = jsonDecode(response.body);
    });
  } catch (exc) {
    print(exc);
  }
}

  @override
  void initState() {
    super.initState();
    getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "All Product",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink.shade400,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.search, color: Colors.white, size: 18),
              SizedBox(width: 10),
              Icon(Icons.notifications, color: Colors.white, size: 18),
            ],
          )
        ],
      ),
       body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "All Product",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.pink),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: (1 / 1.5)),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            itemsdata[index][1],
                            scale: 5,
                          ),
                          Text(
                            itemsdata[index][0],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: Text(
                              itemsdata[index][2],
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const addProduct()));
        },
        mini: true,
        splashColor: Colors.green.shade300,
        backgroundColor: Colors.green.shade400,
        child: const Icon(CupertinoIcons.add_circled, color: Colors.black, size: 12),
      ),
    );
  }
}