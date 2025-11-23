import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './bloc/shopping_cart_bloc.dart';
import './models/cart_item_model.dart';
import './models/shopping_cart_model.dart';
import './widgets/cart_item_widget.dart';

class ShoppingCartInitialPage extends StatelessWidget {
  const ShoppingCartInitialPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ShoppingCartBloc>(
      create: (context) => ShoppingCartBloc(ShoppingCartState(
        shoppingCartModelObj: ShoppingCartModel(),
      ))
        ..add(ShoppingCartInitialEvent()),
      child: ShoppingCartInitialPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 8.h, left: 24.h, right: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDeliveryAddress(context, state),
                SizedBox(height: 30.h),
                _buildBasketSection(context, state),
                SizedBox(height: 30.h),
                _buildCartItemsList(context, state),
                SizedBox(height: 46.h),
                _buildApplyCouponButton(context),
                SizedBox(height: 22.h),
                _buildPaymentDetails(context, state),
                SizedBox(height: 10.h),
                _buildBottomSection(context, state),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.white_A700,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 30.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgMakiArrow,
          height: 24.h,
          width: 24.h,
          onTap: () {
            NavigatorService.goBack();
          },
        ),
      ),
      title: Text(
        'My Cart',
        style: TextStyleHelper.instance.title17SemiBoldInter
            .copyWith(color: appTheme.black_900),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 30.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgMaterialSymbol,
            height: 26.h,
            width: 26.h,
            onTap: () {
              // Handle search action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryAddress(BuildContext context, ShoppingCartState state) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      decoration: BoxDecoration(
        color: appTheme.amber_300,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(color: appTheme.black_900, width: 1.h),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver to Aone, 123456',
                    style: TextStyleHelper.instance.title17SemiBoldInter
                        .copyWith(color: appTheme.black_900),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '1/2, abc street, Gandhi nagar, Chennai',
                    style: TextStyleHelper.instance.body12ExtraLightInter,
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            buttonText: 'Change',
            onPressed: () {
              context.read<ShoppingCartBloc>().add(ChangeAddressEvent());
            },
            backgroundColor: appTheme.blue_gray_100,
            borderRadius: 16,
            hasBorder: true,
            hasBoxShadow: true,
            width: 92.h,
          ),
        ],
      ),
    );
  }

  Widget _buildBasketSection(BuildContext context, ShoppingCartState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Basket (${state.shoppingCartModelObj?.cartItems?.length ?? 0})',
            style: TextStyleHelper.instance.title17SemiBoldInter
                .copyWith(color: appTheme.black_900),
          ),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgFaRupee,
                height: 14.h,
                width: 10.h,
              ),
              SizedBox(width: 6.h),
              Text(
                '${state.shoppingCartModelObj?.totalAmount?.toStringAsFixed(2) ?? "0.00"}',
                style: TextStyleHelper.instance.title17SemiBoldInter
                    .copyWith(color: appTheme.black_900),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList(BuildContext context, ShoppingCartState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: List.generate(
          state.shoppingCartModelObj?.cartItems?.length ?? 0,
          (index) {
            CartItemModel item = state.shoppingCartModelObj!.cartItems![index];
            return Padding(
              padding: EdgeInsets.only(bottom: 34.h),
              child: CartItemWidget(
                cartItem: item,
                onQuantityChanged: (newQuantity) {
                  context.read<ShoppingCartBloc>().add(
                        UpdateQuantityEvent(
                          itemId: item.id ?? '',
                          quantity: newQuantity,
                        ),
                      );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildApplyCouponButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: CustomButton(
        buttonText: 'Apply Coupon',
        onPressed: () {
          context.read<ShoppingCartBloc>().add(ApplyCouponEvent());
        },
        backgroundColor: appTheme.lime_200,
        borderRadius: 24,
        leftIcon: ImageConstant.imgDiscount,
        hasBorder: true,
        width: double.infinity,
      ),
    );
  }

  Widget _buildPaymentDetails(BuildContext context, ShoppingCartState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Details',
            style: TextStyleHelper.instance.title17SemiBoldInter
                .copyWith(color: appTheme.black_900),
          ),
          SizedBox(height: 18.h),
          _buildPaymentRow(
            'MRP Total',
            state.shoppingCartModelObj?.mrpTotal ?? 0.0,
          ),
          SizedBox(height: 8.h),
          _buildDeliveryFeeRow(
            state.shoppingCartModelObj?.deliveryFee ?? 0.0,
          ),
          SizedBox(height: 6.h),
          _buildPaymentRow(
            'Total',
            state.shoppingCartModelObj?.finalTotal ?? 0.0,
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyleHelper.instance.title17RegularInter,
        ),
        Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgFaRupee,
              height: 14.h,
              width: 10.h,
            ),
            SizedBox(width: 6.h),
            Text(
              amount.toStringAsFixed(2),
              style: TextStyleHelper.instance.title17SemiBoldInter
                  .copyWith(color: appTheme.black_900),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryFeeRow(double deliveryFee) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Delivery Fee',
          style: TextStyleHelper.instance.title17RegularInter,
        ),
        Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgFaRupee,
              height: 14.h,
              width: 10.h,
            ),
            SizedBox(width: 6.h),
            Text(
              deliveryFee.toStringAsFixed(2),
              style: TextStyleHelper.instance.title17SemiBoldInter
                  .copyWith(color: appTheme.black_900),
            ),
            SizedBox(width: 12.h),
            Text(
              'FREE',
              style: TextStyleHelper.instance.title17SemiBoldInter
                  .copyWith(color: appTheme.green_A700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context, ShoppingCartState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFaRupee,
                    height: 14.h,
                    width: 10.h,
                  ),
                  SizedBox(width: 6.h),
                  Text(
                    '${state.shoppingCartModelObj?.finalTotal?.toStringAsFixed(2) ?? "0.00"}',
                    style: TextStyleHelper.instance.title17SemiBoldInter
                        .copyWith(color: appTheme.black_900),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: () {
                  context.read<ShoppingCartBloc>().add(ViewPriceDetailsEvent());
                },
                child: Text(
                  'View Price Details',
                  style: TextStyleHelper.instance.title17RegularInter,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          buttonText: 'Continue',
          onPressed: () {
            context.read<ShoppingCartBloc>().add(ContinueToCheckoutEvent());
          },
          backgroundColor: appTheme.amber_300_01,
          borderRadius: 24,
          width: 128.h,
        ),
      ],
    );
  }
}
