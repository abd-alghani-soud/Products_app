import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/cubits/add_favorite/add_favorite_cubit.dart';
import 'package:freezed_code/models/products_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: kColorOr,
      ),
      body: BlocBuilder<FavoritesCubit, List<ProductsModel>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                "No Favorite's Products Found",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
              return ListTile(
                leading: Image.network(product.image, width: 100, height: 100),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    context.read<FavoritesCubit>().removeFromFavorites(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}