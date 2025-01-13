import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/cubits/update_products/update_products_cubit.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/widgets/custom_button.dart';
import 'package:freezed_code/widgets/custom_text_field.dart';

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
  void initState() {
    super.initState();
    context.read<UpdateProductsCubit>().loadSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProductsCubit()..loadSavedData(),
      child: BlocListener<UpdateProductsCubit, UpdateProductsState>(
        listener: (context, state) {
          if (state is UpdateProductsSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product updated successfully')),
            );
            Navigator.pop(context, true);
          } else if (state is UpdateProductsFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
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
            child: BlocBuilder<UpdateProductsCubit, UpdateProductsState>(
              builder: (context, state) {
                if (state is UpdateProductsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is UpdateProductsLoadedState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        CustomTextField(
                          hintText: 'Product Name',
                          initialValue: state.title,
                          onChanged: (data) {
                            context.read<UpdateProductsCubit>().title = data;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          keyboardType: TextInputType.number,
                          hintText: 'Price',
                          initialValue: state.price,
                          onChanged: (data) {
                            context.read<UpdateProductsCubit>().price = data;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          hintText: 'Description',
                          initialValue: state.description,
                          onChanged: (data) {
                            context.read<UpdateProductsCubit>().description = data;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          hintText: 'Image URL',
                          initialValue: state.image,
                          onChanged: (data) {
                            context.read<UpdateProductsCubit>().image = data;
                          },
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          text: 'Update',
                          onTap: () async {
                            final products = ModalRoute.of(context)!
                                .settings
                                .arguments as ProductsModel;
                            await context
                                .read<UpdateProductsCubit>()
                                .updateProducts(products);
                          },
                        ),
                      ],
                    ),
                  );
                }

                return const Center(child: Text('No data loaded'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
