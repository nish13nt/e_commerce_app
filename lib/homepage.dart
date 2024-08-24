import 'dart:convert';
import 'package:e_commerce_app/product_details.dart';
import 'package:e_commerce_app/product_provider.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List products = [];
  dynamic product;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    try {
      final res = await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = jsonDecode(res.body);
      Provider.of<ProductProvider>(context, listen: false)
          .setProducts(data['products']);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;
    int currentpage = 1;
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Padding(
            padding: EdgeInsets.fromLTRB(1, 20, 0, 0),
            child: Text(
              'Products',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  color: Color.fromRGBO(34, 34, 34, 1)),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 5, 0, 0),
            child: Text(
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
                      return InkWell(
                        onTap: () {
                          if (product != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetails(product: product),
                              ),
                            );
                          } 
                        },
                        child: ProductCard(
                          title: product['tags'],
                          img: product['thumbnail'] as String,
                          discount: product['discountPercentage'],
                          price: product['price'],
                        ),
                      );
                    }),
          ),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        currentIndex: currentpage,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
