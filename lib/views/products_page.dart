import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/cubits/navigate_pages/navigate_page_cubit.dart';
import 'package:freezed_code/views/favorites_page.dart';
import 'package:freezed_code/views/home_page.dart';
import 'package:freezed_code/views/profile_page.dart';
import 'package:freezed_code/views/shopping_cart_page.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  final List<Widget> _pages = const [
    HomePage(),
    ShoppingCartPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigatePageCubit(),
      child: BlocBuilder<NavigatePageCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: selectedIndex == 0
                ? AppBar(
                    automaticallyImplyLeading: false,
                    actions: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: kColorBl,
                          size: 32,
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
                  )
                : null,
            body: _pages[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) =>
                  context.read<NavigatePageCubit>().updateIndex(index),
              backgroundColor: Colors.black,
              selectedItemColor: kColorOr,
              unselectedItemColor: kColorBl,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
