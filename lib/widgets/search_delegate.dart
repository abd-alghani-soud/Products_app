import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/cubits/update_products/update_products_cubit.dart';
import 'package:freezed_code/widgets/custom_card.dart';

class ProductsSearchDelegate extends SearchDelegate {
  ProductsSearchDelegate({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final productCubits = BlocProvider.of<UpdateProductsCubit>(context);

    // التحقق من أن model ليس فارغًا
    if (productCubits.model == null || productCubits.model!.isEmpty) {
      return const Center(
        child: Text('No products available'),
      );
    }

    final filteredNotes = productCubits.model!.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredNotes.isEmpty) {
      return const Center(
        child: Text('No result'),
      );
    }

    return ListView.builder(
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        final product = filteredNotes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8,
          ),
          child: CustomCard(
            products: product,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productsCubits = BlocProvider.of<UpdateProductsCubit>(context);

    // التحقق من أن model ليس فارغًا
    if (productsCubits.model == null || productsCubits.model!.isEmpty) {
      return const Center(
        child: Text('No products available'),
      );
    }

    final filteredNotes = productsCubits.model!.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredNotes.isEmpty) {
      return const Center(
        child: Text('No result'),
      );
    }

    return ListView.builder(
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        final product = filteredNotes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8,
          ),
          child: CustomCard(
            products: product,
          ),
        );
      },
    );
  }
}