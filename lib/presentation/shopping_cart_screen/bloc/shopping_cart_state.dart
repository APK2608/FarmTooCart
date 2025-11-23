part of 'shopping_cart_bloc.dart';

class ShoppingCartState extends Equatable {
  final ShoppingCartModel? shoppingCartModelObj;
  final bool isLoading;
  final bool couponApplied;
  final bool navigateToAddressChange;
  final bool showPriceDetails;
  final bool navigateToCheckout;

  ShoppingCartState({
    this.shoppingCartModelObj,
    this.isLoading = false,
    this.couponApplied = false,
    this.navigateToAddressChange = false,
    this.showPriceDetails = false,
    this.navigateToCheckout = false,
  });

  @override
  List<Object?> get props => [
        shoppingCartModelObj,
        isLoading,
        couponApplied,
        navigateToAddressChange,
        showPriceDetails,
        navigateToCheckout,
      ];

  ShoppingCartState copyWith({
    ShoppingCartModel? shoppingCartModelObj,
    bool? isLoading,
    bool? couponApplied,
    bool? navigateToAddressChange,
    bool? showPriceDetails,
    bool? navigateToCheckout,
  }) {
    return ShoppingCartState(
      shoppingCartModelObj: shoppingCartModelObj ?? this.shoppingCartModelObj,
      isLoading: isLoading ?? this.isLoading,
      couponApplied: couponApplied ?? this.couponApplied,
      navigateToAddressChange:
          navigateToAddressChange ?? this.navigateToAddressChange,
      showPriceDetails: showPriceDetails ?? this.showPriceDetails,
      navigateToCheckout: navigateToCheckout ?? this.navigateToCheckout,
    );
  }
}
