import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addProduct extends StatefulWidget {
  const addProduct({super.key});

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  final _nama = TextEditingController();
  final _price = TextEditingController();
  final _description = TextEditingController();
  final _promo = TextEditingController();
  final _images = TextEditingController();

  void clearData() {
    _nama.clear();
    _price.clear();
    _description.clear();
    _promo.clear();
    _images.clear();
  }

  Future<void> addProduct() async {
    String urlAddProduct =
        "https://mauizati.000webhostapp.com/entryproduct.php";

    try {
      final responseAdd = await http.post(Uri.parse(urlAddProduct), body: {
        "nama": _nama.text.toString(),
        "price": _price.text.toString(),
        "description": _description.text.toString(),
        "promo": _promo.text.toString(),
        "images": _images.text.toString(),
      });
      var addNewProduct = json.decode(responseAdd.body);

      if (addNewProduct == "true") {
        print("New Product successfully added");
      } else {
        print("New Product failed added");
      }
    } catch (exc) {
      print(exc);
    }
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
          "Add Product List",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 4, 165, 12),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _nama,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  hintText: "Entry Product Name",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.shop, color: Colors.amber),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _price,
                decoration: InputDecoration(
                  labelText: "Price",
                  hintText: "Entry Price",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.pin, color: Colors.amber),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Entry Description",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.description, color: Colors.amber),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _promo,
                decoration: InputDecoration(
                  labelText: "Promo",
                  hintText: "Entry Promo",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.discount, color: Colors.amber),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: TextField(
                controller: _images,
                decoration: InputDecoration(
                  labelText: "Images url",
                  hintText: "Entry Images url",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.image, color: Colors.amber),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  addProduct();
                  clearData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 4, 165, 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                        color: Colors.green,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
                child: Text(
                  "Add Product",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}