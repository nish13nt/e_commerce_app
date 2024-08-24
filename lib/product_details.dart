import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final dynamic product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double dp = product['price'] -
        (product['price'] * (product['discountPercentage'] / 100));
    String dprice = dp.toStringAsFixed(2);
    List<String> images = List<String>.from(product['images'] ?? []);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: Text(
          '${product['title']}',
          style: const TextStyle(fontWeight: FontWeight.w900),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: images.length >1? 
                      SizedBox(
                        height: 413,
                        child: PageView.builder(itemCount: images.length, itemBuilder: (context,index){
                          return Image.network(images[index]);
                        }),
                      )
                      :SizedBox(
                        height: 413,
                        child: Image.network(product['images'][0] as String),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Title(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Text(
                            '${product['tags'][1]}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          const Spacer(),
                          Text(
                            '\$$dprice',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      '${product['tags'][0]}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${product['description']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
            width: double.infinity,
            height: 150,
            child: Center(
              child:
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text('ADD TO CART',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(343, 70)),),
            ),
          ),
        ],
      ),
    );
  }
}
