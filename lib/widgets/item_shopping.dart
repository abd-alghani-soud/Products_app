import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/blocs/counter/counter_bloc.dart';

class ItemShopping extends StatelessWidget {
  const ItemShopping({
    super.key,
    required this.products,
  });

  final ProductsModel products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        int counter = 0;
        if (state is TheValueWasChangedState) {
          counter = state.counter;
        }
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 16,
          ),
          child: ListTile(
            style: ListTileStyle.list,
            title: Text(
              products.title.substring(0, 7),
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(
              r'$' '${products.price.toString()}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            leading: Image.network(
              products.image,
              width: 100,
              height: 100,
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecreamentValueEvent());
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncreamentValueEvent());
                        },
                        icon: const Icon(
                          Icons.plus_one,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(ResetValueEvent());
                        },
                        icon: const Icon(
                          size: 20,
                          FontAwesomeIcons.cartShopping,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            iconColor: kColorOr,
          ),
        );
      },
    );
  }
}