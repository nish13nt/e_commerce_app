import 'package:e_commerce_app/homepage.dart';
import 'package:e_commerce_app/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => ProductProvider(),
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(249, 249, 249, 1  )),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}

