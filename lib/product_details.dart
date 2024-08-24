import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final dynamic product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double dp =
        product['price'] - (product['price'] / product['discountPercentage']);
    String dprice = dp.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${product['title']}',
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product['images'][0] as String),
              Title(
                color: Colors.black,
                child: Row(
                  children: [
                    Text(
                      '${product['tags'][1]}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Text(
                      '\$$dprice',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${product['tags'][0]}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                textAlign: TextAlign.left,
              ),
              const Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                ),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Text(
                  '(5)',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Text(
                '${product['description']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
