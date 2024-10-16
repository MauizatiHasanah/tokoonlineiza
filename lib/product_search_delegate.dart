import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlineiza/productdetail.dart';

class ProductSearchDelegate extends SearchDelegate {
  List allProducts = [];

  ProductSearchDelegate() {
    // Memanggil fungsi untuk mendapatkan semua produk
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    String urlProduct = "https://mauizati.000webhostapp.com/getallproduct.php";
    try {
      var response = await http.get(Uri.parse(urlProduct));
      allProducts = jsonDecode(response.body);
    } catch (exc) {
      print(exc);
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List filteredProducts = allProducts.where((product) {
      return product['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        var product = filteredProducts[index];
        return ListTile(
          title: Text(product['name']),
          subtitle: Text(product['price'].toString()),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetil(productIndex: product),
            ));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filteredProducts = allProducts.where((product) {
      return product['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        var product = filteredProducts[index];
        return ListTile(
          title: Text(product['name']),
          subtitle: Text(product['price'].toString()),
          onTap: () {
            query = product['name'];
            showResults(context);
          },
        );
      },
    );
  }
}
