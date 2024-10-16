import 'package:flutter/material.dart';
import 'package:tokoonlineiza/itemsdata.dart';

class ProductDetil extends StatefulWidget {
  const ProductDetil({super.key, @required this.productIndex});
  final productIndex;

  @override
  State<ProductDetil> createState() => _ProductDetilState();

  static void removeWhere(bool Function(dynamic product) param0) {}
}

class _ProductDetilState extends State<ProductDetil> {
  Color buyColor = Colors.orange;
  int buySize = 5;
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              itemsdata[widget.productIndex][0],
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: buyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    itemsdata[widget.productIndex][1],
                    scale: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(
            itemsdata[widget.productIndex][2],
            style: const TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Deskripsi Produk",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              itemsdata[widget.productIndex][3],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Other Colors",
                  style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.orange;
                        });
                      },
                      child: const CircleAvatar(
                          radius: 12, backgroundColor: Colors.orange),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.red;
                        });
                      },
                      child: const CircleAvatar(
                          radius: 12, backgroundColor: Colors.red),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.green;
                        });
                      },
                      child: const CircleAvatar(
                          radius: 12, backgroundColor: Colors.green),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.purple;
                        });
                      },
                      child: const CircleAvatar(
                          radius: 12, backgroundColor: Colors.purple),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.pink;
                        });
                      },
                      child: const CircleAvatar(
                          radius: 12, backgroundColor: Colors.pink),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Produk Size",
                  style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                    value: buySize,
                    items: const [
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "S",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10,
                        child: Text(
                          "M",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 15,
                        child: Text(
                          "L",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 20,
                        child: Text(
                          "XL",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 25,
                        child: Text(
                          "XXL",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        buySize = value!;
                      });
                    }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 30,
            width: 250,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                "ADD TO CART",
                 style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                      color: Colors.black,
                      ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
