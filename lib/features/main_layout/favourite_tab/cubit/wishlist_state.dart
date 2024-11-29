part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistErrorState extends WishlistState {
  final Failure failure;

  WishlistErrorState({required this.failure});
}

final class WishlistSuccessState extends WishlistState {
  final GetWishListResponseEntity responseEntity;

  WishlistSuccessState({required this.responseEntity});
}

final class DeleteFromWishlistErrorState extends WishlistState {
  final Failure failure;

  DeleteFromWishlistErrorState({required this.failure});
}

final class DeleteFromWishlistSuccessState extends WishlistState {
  final String responseEntity;

  DeleteFromWishlistSuccessState({required this.responseEntity});
}
