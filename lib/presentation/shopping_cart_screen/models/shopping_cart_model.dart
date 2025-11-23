import '../../../core/app_export.dart';
import './cart_item_model.dart';

class ShoppingCartModel extends Equatable {
  ShoppingCartModel({
    this.cartItems,
    this.totalAmount,
    this.mrpTotal,
    this.deliveryFee,
    this.finalTotal,
    this.deliveryAddress,
    this.fullAddress,
  }) {
    cartItems = cartItems ?? [];
    totalAmount = totalAmount ?? 0.0;
    mrpTotal = mrpTotal ?? 0.0;
    deliveryFee = deliveryFee ?? 0.0;
    finalTotal = finalTotal ?? 0.0;
    deliveryAddress = deliveryAddress ?? '';
    fullAddress = fullAddress ?? '';
  }

  List<CartItemModel>? cartItems;
  double? totalAmount;
  double? mrpTotal;
  double? deliveryFee;
  double? finalTotal;
  String? deliveryAddress;
  String? fullAddress;

  ShoppingCartModel copyWith({
    List<CartItemModel>? cartItems,
    double? totalAmount,
    double? mrpTotal,
    double? deliveryFee,
    double? finalTotal,
    String? deliveryAddress,
    String? fullAddress,
  }) {
    return ShoppingCartModel(
      cartItems: cartItems ?? this.cartItems,
      totalAmount: totalAmount ?? this.totalAmount,
      mrpTotal: mrpTotal ?? this.mrpTotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      finalTotal: finalTotal ?? this.finalTotal,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      fullAddress: fullAddress ?? this.fullAddress,
    );
  }

  @override
  List<Object?> get props => [
        cartItems,
        totalAmount,
        mrpTotal,
        deliveryFee,
        finalTotal,
        deliveryAddress,
        fullAddress,
      ];
}
