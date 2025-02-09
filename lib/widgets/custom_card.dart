import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/cubits/add_favorite/add_favorite_cubit.dart';
import 'package:freezed_code/models/products_model.dart';


class CustomCard extends StatelessWidget {
  final ProductsModel products;

  const CustomCard({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = context.read<FavoritesCubit>();
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(10, 10),
                  color: Colors.grey.withOpacity(.2),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.title.substring(0, 7),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${products.price.toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        BlocBuilder<FavoritesCubit, List<ProductsModel>>(
                          builder: (context, favorites) {
                            return IconButton(
                              onPressed: () {
                                if (favoritesCubit.isFavorite(products)) {
                                  favoritesCubit.removeFromFavorites(products);
                                } else {
                                  favoritesCubit.addToFavorites(products);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: favoritesCubit.isFavorite(products)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: 32,
            child: Image.network(
              products.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}