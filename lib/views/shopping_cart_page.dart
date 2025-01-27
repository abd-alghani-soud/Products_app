import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/blocs/counter/counter_bloc.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/widgets/item_shopping.dart';
import '../services/get_all_products_services.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  Future<List<ProductsModel>>? future;

  @override
  void initState() {
    super.initState();
    future = GetAllProductsServices().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kColorOr,
      ),
      body: FutureBuilder<List<ProductsModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kColorOr,
              ),
            );
          } else if (snapshot.hasError) {
            debugPrint('${snapshot.error}');
            return const Center(
              child: Text(
                'Error: Network failed',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<ProductsModel> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (context) => CounterBloc(),
                  child: ItemShopping(
                    products: products[index],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No products available.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}