import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/services/get_all_products_services.dart';
import 'package:freezed_code/widgets/custom_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: kColorBl,
              size: 26,
            ),
          ),
        ],
        backgroundColor: kColorOr,
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: kColorBl,
          ),
        ),
        elevation: 0,
      ),
      // ignore: sized_box_for_whitespace
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          top: 60,
        ),
        child: FutureBuilder<List<ProductsModel>>(
          future: GetAllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> productsData = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 80,
                ),
                itemCount: productsData.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    products: productsData[index],
                  );
                },
              );
            } else {
              return  Center(
                  child: Image.asset('assets/images/log.jpg'),
                  );
            }
          },
        ),
      ),
    );
  }
}
