import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(),
        SizedBox(width: 10.h),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductDetails(),
                SizedBox(height: 20.h),
                _buildPriceAndQuantity(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        Container(
          width: 126.h,
          height: 134.h,
          child: Column(
            children: [
              Container(
                width: 124.h,
                height: 124.h,
                decoration: BoxDecoration(
                  color: appTheme.lime_100,
                  borderRadius: BorderRadius.circular(24.h),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomImageView(
            imagePath: cartItem.imagePath ?? '',
            height: 104.h,
            width: 122.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetails() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${cartItem.name ?? ''}\n',
            style: TextStyleHelper.instance.title20MediumInter
                .copyWith(height: 1.1),
          ),
          TextSpan(
            text: '(${cartItem.weight ?? ''})',
            style: TextStyleHelper.instance.body14MediumInter,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
              '${cartItem.price?.toStringAsFixed(2) ?? "0.00"}',
              style: TextStyleHelper.instance.title17SemiBoldInter
                  .copyWith(color: appTheme.black_900),
            ),
          ],
        ),
        _buildQuantityControls(),
      ],
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if ((cartItem.quantity ?? 0) > 1) {
              onQuantityChanged((cartItem.quantity ?? 1) - 1);
            }
          },
          child: Container(
            width: 24.h,
            height: 24.h,
            child: CustomImageView(
              imagePath: ImageConstant.imgMinus,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ),
        SizedBox(width: 12.h),
        Text(
          '${cartItem.quantity ?? 0}',
          style: TextStyleHelper.instance.title20BoldInter,
        ),
        SizedBox(width: 12.h),
        GestureDetector(
          onTap: () {
            onQuantityChanged((cartItem.quantity ?? 0) + 1);
          },
          child: Container(
            width: 24.h,
            height: 24.h,
            child: CustomImageView(
              imagePath: ImageConstant.imgPlus,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ),
      ],
    );
  }
}
