import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';
import 'package:shopping_app/screens/products_display_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffA16AE8),
          ),
          primaryColor: const Color(0xffA16AE8),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xffB4FEE7),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              color: Color(0xffA16AE8),
              fontSize: 16,
            ),
          ),
        ),
        home: const ProductsDisplay(),
        routes: {
          ProductsDisplay.routeName: (context) => const ProductsDisplay(),
          ProductDetails.routeName: (context) => const ProductDetails(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
        },
      ),
    );
  }
}
