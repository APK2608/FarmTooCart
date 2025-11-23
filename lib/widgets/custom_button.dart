import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// A customizable button widget that supports various styling options
/// including background colors, border radius, left icons, borders, and shadows.
///
/// This component can handle different button variants:
/// - Simple text button
/// - Button with left icon
/// - Button with custom styling (borders, shadows)
///
/// @param buttonText - The text to display on the button
/// @param onPressed - Callback function when button is pressed
/// @param backgroundColor - Background color of the button
/// @param borderRadius - Border radius for rounded corners
/// @param leftIcon - Optional left icon image path
/// @param width - Button width (defaults to fit content)
/// @param hasBorder - Whether to show border outline
/// @param hasBoxShadow - Whether to apply box shadow effect
/// @param textColor - Color of the button text
/// @param borderColor - Color of the button border
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.leftIcon,
    this.width,
    this.hasBorder,
    this.hasBoxShadow,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  /// Text to display on the button
  final String buttonText;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Optional left icon image path
  final String? leftIcon;

  /// Button width
  final double? width;

  /// Whether to show border outline
  final bool? hasBorder;

  /// Whether to apply box shadow effect
  final bool? hasBoxShadow;

  /// Color of the button text
  final Color? textColor;

  /// Color of the button border
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: hasBoxShadow ?? false
            ? [
                BoxShadow(
                  color: appTheme.color3F0000,
                  blurRadius: 4.h,
                  offset: Offset(0, 4.h),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((borderRadius ?? 24).h),
            side: hasBorder ?? false
                ? BorderSide(
                    color: borderColor ?? Color(0xFF000000),
                    width: 1.h,
                  )
                : BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: leftIcon != null ? 16.h : 28.h,
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) ...[
              CustomImageView(
                imagePath: leftIcon!,
                height: 30.h,
                width: 30.h,
              ),
              SizedBox(width: 8.h),
            ],
            Text(
              buttonText,
              style: TextStyleHelper.instance.title17SemiBoldInter.copyWith(
                  color: textColor ?? Color(0xFF000000), height: 1.24),
            ),
          ],
        ),
      ),
    );
  }
}
