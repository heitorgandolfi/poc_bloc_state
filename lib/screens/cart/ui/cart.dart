import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_bloc_state/screens/cart/bloc/cart_bloc_bloc.dart';
import 'package:poc_bloc_state/screens/cart/ui/cart_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBlocBloc cartBloc = CartBlocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: BlocConsumer<CartBlocBloc, CartBlocState>(
          bloc: cartBloc,
          listener: (context, state) {},
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      cartBloc: cartBloc,
                      product: successState.cartItems[index],
                    );
                  },
                );
              default:
            }
            return Container();
          },
        ));
  }
}
