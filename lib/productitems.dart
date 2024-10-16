import 'package:flutter/material.dart';
import 'package:tokoonlineiza/itemsdata.dart';
import 'package:tokoonlineiza/productdetail.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});
  

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket, color: Colors.black, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu_open_rounded, color: Colors.black, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Tap to Detail Product",
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
                itemCount: itemsdata.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  ProductDetil(
                            productIndex: index,
                          ),
                        ),
                      );
                    },
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
    );
  }
}
