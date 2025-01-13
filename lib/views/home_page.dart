import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/services/get_all_products_services.dart';
import 'package:freezed_code/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ProductsModel>>? future;

  @override
  void initState() {
    super.initState();
    future = GetAllProductsServices().getAllProducts();
  }

  void reloadProducts() {
    setState(() {
      future = GetAllProductsServices().getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          top: 60,
        ),
        child: FutureBuilder<List<ProductsModel>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: kColorOr,
                  ));
            } else if (snapshot.hasError) {
              debugPrint('${snapshot.error}');
              return const Center(
                child: Text(
                  'Error: NetWork failed',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<ProductsModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 80,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    products: products[index],
                    onReload: reloadProducts,
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
      ),
    );
  }
}
