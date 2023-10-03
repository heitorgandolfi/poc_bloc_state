import 'package:flutter/material.dart';
import 'package:poc_bloc_state/screens/home/models/home_product_data_model.dart';
import 'package:poc_bloc_state/screens/wishlist/bloc/wishlist_bloc_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final WishlistBlocBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.product, required this.wishlistBloc});

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
                        wishlistBloc.add(
                            WishlistRemoveEvent(productDataModel: product));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      )),
                  IconButton(
                      onPressed: () {
                        // wishlistBloc.add(HomeProductsCartButtonClickedEvent(
                        //     clickedProduct: product));
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
