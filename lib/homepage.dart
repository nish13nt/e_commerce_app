import 'dart:convert';

import 'package:e_commerce_app/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> products = [];
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    try {
      final res = await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = jsonDecode(res.body);
      setState(() {
        products = data['products'];
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Padding(
          padding:  EdgeInsets.fromLTRB(1, 20, 0, 0),
          child:  Text(
            'Products',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50,
                color: Color.fromRGBO(34, 34, 34, 1)),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:  EdgeInsets.fromLTRB(18, 5, 0, 0),
            child:  Text(
              'Super Summer Sale',
              style: TextStyle(color: Color.fromRGBO(155, 155, 155, 1)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: products.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        title: product['tags'],
                        img: product['thumbnail'] as String,
                        discount: product['discountPercentage'],
                        price: product['price'],
                      );
                    }),
          )
        ],
      ),
    );
  }
}
