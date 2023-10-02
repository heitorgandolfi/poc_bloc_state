part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

abstract class HomeActionState extends HomeBlocState {}

class HomeInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadingDoneState extends HomeBlocState {
  final List<ProductDataModel> products;

  HomeLoadingDoneState({required this.products});
}

class HomeLoadingFailState extends HomeBlocState {}

class HomeNavigateToWishlistScreenActionState extends HomeActionState {}

class HomeNavigateToCarStcreenActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
