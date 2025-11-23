import '../../../core/app_export.dart';
import '../models/cart_item_model.dart';
import '../models/shopping_cart_model.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc(ShoppingCartState initialState) : super(initialState) {
    on<ShoppingCartInitialEvent>(_onInitialize);
    on<UpdateQuantityEvent>(_onUpdateQuantity);
    on<ApplyCouponEvent>(_onApplyCoupon);
    on<ChangeAddressEvent>(_onChangeAddress);
    on<ViewPriceDetailsEvent>(_onViewPriceDetails);
    on<ContinueToCheckoutEvent>(_onContinueToCheckout);
  }

  _onInitialize(
    ShoppingCartInitialEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    List<CartItemModel> cartItems = [
      CartItemModel(
        id: '1',
        name: 'Tender',
        weight: '500g to 1.2 kg approx per pcs',
        price: 200.00,
        quantity: 4,
        imagePath: ImageConstant.imgImage27,
      ),
      CartItemModel(
        id: '2',
        name: 'Raw mango',
        weight: '1 Kg',
        price: 100.00,
        quantity: 2,
        imagePath: ImageConstant.imgRectangle,
      ),
      CartItemModel(
        id: '3',
        name: 'Sidhura',
        weight: '500g',
        price: 200.00,
        quantity: 2,
        imagePath: ImageConstant.imgRectangle120x158,
      ),
    ];

    ShoppingCartModel cartModel = ShoppingCartModel(
      cartItems: cartItems,
      totalAmount: 500.00,
      mrpTotal: 1000.00,
      deliveryFee: 40.00,
      finalTotal: 500.00,
      deliveryAddress: 'Deliver to Aone, 123456',
      fullAddress: '1/2, abc street, Gandhi nagar, Chennai',
    );

    emit(state.copyWith(
      shoppingCartModelObj: cartModel,
      isLoading: false,
    ));
  }

  _onUpdateQuantity(
    UpdateQuantityEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    List<CartItemModel> updatedItems =
        state.shoppingCartModelObj?.cartItems?.map((item) {
              if (item.id == event.itemId) {
                return item.copyWith(quantity: event.quantity);
              }
              return item;
            }).toList() ??
            [];

    double newTotal = _calculateTotal(updatedItems);

    ShoppingCartModel updatedModel = state.shoppingCartModelObj?.copyWith(
          cartItems: updatedItems,
          totalAmount: newTotal,
          finalTotal: newTotal,
        ) ??
        ShoppingCartModel();

    emit(state.copyWith(shoppingCartModelObj: updatedModel));
  }

  _onApplyCoupon(
    ApplyCouponEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Simulate coupon application
    await Future.delayed(Duration(milliseconds: 500));

    emit(state.copyWith(
      isLoading: false,
      couponApplied: true,
    ));
  }

  _onChangeAddress(
    ChangeAddressEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    // Handle address change navigation
    emit(state.copyWith(navigateToAddressChange: true));
  }

  _onViewPriceDetails(
    ViewPriceDetailsEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    // Handle price details view
    emit(state.copyWith(showPriceDetails: true));
  }

  _onContinueToCheckout(
    ContinueToCheckoutEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(Duration(milliseconds: 1000));

    emit(state.copyWith(
      isLoading: false,
      navigateToCheckout: true,
    ));
  }

  double _calculateTotal(List<CartItemModel> items) {
    double total = 0.0;
    for (CartItemModel item in items) {
      total += (item.price ?? 0.0) * (item.quantity ?? 0);
    }
    return total;
  }
}
