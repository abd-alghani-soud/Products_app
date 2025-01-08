import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_code/constant.dart';

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        height: 150,
        width: 220,
        child: Card(
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
                const Text(
                  "bugs",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      r"$200",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
