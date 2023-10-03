part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class CartInitalEvent extends CartBlocEvent {}

class CartRemoveEvent extends CartBlocEvent {
  final ProductDataModel productDataModel;

  CartRemoveEvent({required this.productDataModel});
}
