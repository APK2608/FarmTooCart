part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShoppingCartInitialEvent extends ShoppingCartEvent {}

class UpdateQuantityEvent extends ShoppingCartEvent {
  final String itemId;
  final int quantity;

  UpdateQuantityEvent({
    required this.itemId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [itemId, quantity];
}

class ApplyCouponEvent extends ShoppingCartEvent {}

class ChangeAddressEvent extends ShoppingCartEvent {}

class ViewPriceDetailsEvent extends ShoppingCartEvent {}

class ContinueToCheckoutEvent extends ShoppingCartEvent {}
