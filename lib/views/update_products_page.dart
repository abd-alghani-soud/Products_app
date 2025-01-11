import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/cubits/update_products/update_products_cubit.dart';
import 'package:freezed_code/helper/show_snack_bar_with_color.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/widgets/custom_button.dart';
import 'package:freezed_code/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductsPage extends StatelessWidget {
  const UpdateProductsPage({super.key});

  static String id = 'Update Products Page';

  @override
  Widget build(BuildContext context) {
    final ProductsModel products =
    ModalRoute.of(context)!.settings.arguments as ProductsModel;

    return BlocProvider(
      create: (context) => UpdateProductsCubit()..loadSavedData(),
      child: BlocBuilder<UpdateProductsCubit, UpdateProductsState>(
        builder: (context, state) {
          final cubit = context.read<UpdateProductsCubit>();
          return ModalProgressHUD(
            inAsyncCall: cubit.isLoading,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kColorOr,
                centerTitle: true,
                title: const Text(
                  "Update page",
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
                      const SizedBox(height: 100),
                      CustomTextField(
                        hintText: 'Product Name',
                        onChanged: (data) {
                          cubit.title = data;
                        },
                        initialValue: cubit.title,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        hintText: 'Price',
                        onChanged: (data) {
                          cubit.price = data;
                        },
                        initialValue: cubit.price,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'Description',
                        onChanged: (data) {
                          cubit.description = data;
                        },
                        initialValue: cubit.description,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'image',
                        onChanged: (data) {
                          cubit.image = data;
                        },
                        initialValue: cubit.image,
                      ),
                      const SizedBox(height: 50),
                      CustomButton(
                        text: 'Update',
                        onTap: () async {
                          await cubit.updateProducts(products);
                          if (cubit.state is UpdateProductsSuccessState) {
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } else if (cubit.state is UpdateProductsFailureState) {
                            showSnackBarWithColor(
                              // ignore: use_build_context_synchronously
                              context,
                              (cubit.state as UpdateProductsFailureState).error,
                              Colors.red,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}