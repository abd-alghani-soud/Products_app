import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/services/update_products.dart';
import 'package:freezed_code/widgets/custom_button.dart';
import 'package:freezed_code/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductsPage extends StatefulWidget {
  const UpdateProductsPage({super.key});

  static String id = 'Update Products Page';

  @override
  State<UpdateProductsPage> createState() => _UpdateProductsPageState();
}

class _UpdateProductsPageState extends State<UpdateProductsPage> {
  String? title, price, image, description;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel products =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    title = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  hintText: 'Price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (data) {
                    description = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    text: 'Update',
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProducts(products);
                        debugPrint('Succses');
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProducts(ProductsModel products) async {
    await UpdateProducts().updateProducts(
      id: products.id,
      title: title ?? products.title,
      image: image ?? products.image,
      price: price ?? products.price.toString(),
      desc: description ?? products.description,
      category: products.category,
    );
  }
}
