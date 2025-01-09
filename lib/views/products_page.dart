import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/widgets/custom_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          top: 70,
        ),
        child: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 1.4,
            mainAxisSpacing: 80,
          ),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const CustomCard();
          },
        ),
      ),
    );
  }
}
