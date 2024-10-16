import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlineiza/allproduct.dart';
import 'package:tokoonlineiza/product_search_delegate.dart';
import 'package:tokoonlineiza/productitems.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
  leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      size: 18,
      color: Colors.white,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  backgroundColor: Colors.pink.shade100,
  actions: [
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.search, size: 18, color: Colors.red),
          onPressed: () {
            showSearch(context: context, delegate: ProductSearchDelegate());
          },
        ),
        const SizedBox(width: 10),
        const Icon(CupertinoIcons.shopping_cart, size: 18, color: Colors.white),
        const SizedBox(width: 10),
        const Icon(Icons.menu_rounded, size: 18, color: Colors.white),
        const SizedBox(width: 10),
      ],
    )
  ],
),


      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'lib/assets/shop.png'
                ),
            )
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "PRDOUCT CATEGORY", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
        ),
      ),

      Container(
        
        height: 100,
        child: Padding(padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
        
        
        child: Row(
          
          children: [
            Card(
              color: Colors.pink.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/topi.png',
                  scale: 11,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.pink.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/celana.png',
                  scale: 11,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.pink.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/kemeja.png',
                  scale: 11,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.pink.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/dress.png',
                  scale: 11,
                ),
                ],
              ),
              ),
            ),
            Card(
              color: Colors.pink.shade100,
              child: Padding(padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
              child: Column(
                children: [Image.asset(
                  'lib/assets/sepatu.png',
                  scale: 10,
                ),
                ],
              ),
              ),
            ),

          ],
        ),
        ),
      ),
      Padding(padding: const EdgeInsets.all(5),
        child: Text(
          'Category Pick', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
        ),
      ),
      SizedBox(
        height: 270,
        child: Padding(padding: const EdgeInsets.fromLTRB(16, 20, 0, 20),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AllProduct())),


              child: Card(
                color: Colors.pink.shade100,
                child: Padding(padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    
                    Image.asset(
                      'lib/assets/shoping.png',
                  scale: 20,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text('ALL PRODUK', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
                
                ),
              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProductItem())),


              child: Card(
                color: Colors.pink.shade100,
                child: Padding(padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/info.png',
                  scale: 22,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('PRODUK DETIL', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
                
                ),
              ),
            ),
            
          ],
        ),
        ),
      )
        ]
          ),
    );
  }
}