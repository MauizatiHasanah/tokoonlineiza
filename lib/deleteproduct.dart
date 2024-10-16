import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlineiza/productdetail.dart';

Future<void> deleteProduct(String id) async {
  String urlDeleteProduct =
      "https://mauizati.000webhostapp.com/deleteproduct_a.phpp";

  try {
    setState(() {
      var _isLoading = true;
    });
    var responseDelete = await http.post(
      Uri.parse(urlDeleteProduct),
      body: {"id": id},
    );

    var deleteDataProduct = jsonDecode(responseDelete.body);
    if (deleteDataProduct['success'] == "true") {
      print("Product deleted successfully");
      setState(() {
        ProductDetil.removeWhere((product) => product['id'] == id);
        var filteredProductList;
        filteredProductList.removeWhere((product) => product['id'] == id);
        var _isLoading = false;
      });
    } else {
      print("Failed to delete product");
      setState(() {
        var _isLoading = false;
      });
    }
  } catch (exc) {
    print(exc);
    setState(() {
      var _isLoading = false;
    });
  }
}

void setState(Null Function() param0) {
}
