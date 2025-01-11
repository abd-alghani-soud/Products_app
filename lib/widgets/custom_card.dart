import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/views/update_products_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({required this.products, super.key});

  ProductsModel products;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updatedProduct = await Navigator.pushNamed(
          context,
          UpdateProductsPage.id,
          arguments: widget.products,
        );
        if (mounted &&
            updatedProduct != null &&
            updatedProduct is ProductsModel) {
          setState(() {
            widget.products = updatedProduct;
          });
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorWh,
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
              borderOnForeground: false,
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
                      widget.products.title.length > 7
                          ? widget.products.title.substring(0, 7)
                          : widget.products.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${widget.products.price.toString()}',
                          style: const TextStyle(
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
          Positioned(
            top: -50,
            right: 32,
            child: Image.network(
              widget.products.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
