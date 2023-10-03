import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_bloc_state/screens/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:poc_bloc_state/screens/wishlist/ui/wishlist_tile_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBlocBloc wishlistBloc = WishlistBlocBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
        ),
        body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
          bloc: wishlistBloc,
          listener: (context, state) {},
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      wishlistBloc: wishlistBloc,
                      product: successState.wishlistItems[index],
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
