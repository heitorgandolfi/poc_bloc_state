part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistInitalEvent extends WishlistBlocEvent {}

class WishlistRemoveEvent extends WishlistBlocEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveEvent({required this.productDataModel});
}
