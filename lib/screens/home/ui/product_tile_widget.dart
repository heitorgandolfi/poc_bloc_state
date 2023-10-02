import 'package:flutter/material.dart';
import 'package:poc_bloc_state/screens/home/bloc/home_bloc_bloc.dart';
import 'package:poc_bloc_state/screens/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final HomeBlocBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(product.imageURL)),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(product.description),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price.toString()}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductsWishListButtonClickedEvent(
                            clickedProduct: product));
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductsCartButtonClickedEvent(
                            clickedProduct: product));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
