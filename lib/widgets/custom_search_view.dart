import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomSearchView - A reusable search input component with customizable styling
 * 
 * Features:
 * - Customizable prefix icon with SVG/image support
 * - Configurable background colors and border radius
 * - Form validation support
 * - Responsive design with SizeUtils
 * - Search-optimized keyboard and input handling
 * 
 * @param hintText - Placeholder text for the search input
 * @param prefixIconPath - Path to the prefix icon (SVG/image)
 * @param fillColor - Background fill color for the search field
 * @param borderRadius - Border radius for rounded corners
 * @param validator - Form validation function
 * @param onChanged - Callback function when text changes
 * @param onSubmitted - Callback function when search is submitted
 * @param controller - Text editing controller for the input
 * @param focusNode - Focus node for managing input focus
 */
class CustomSearchView extends StatelessWidget {
  const CustomSearchView({
    Key? key,
    this.hintText,
    this.prefixIconPath,
    this.fillColor,
    this.borderRadius,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  /// Placeholder text displayed in the search field
  final String? hintText;

  /// Path to the prefix icon image
  final String? prefixIconPath;

  /// Background fill color for the search input
  final Color? fillColor;

  /// Border radius for the search field corners
  final double? borderRadius;

  /// Validation function for form integration
  final String? Function(String?)? validator;

  /// Callback triggered when search text changes
  final Function(String)? onChanged;

  /// Callback triggered when search is submitted
  final Function(String)? onSubmitted;

  /// Controller for managing the text input
  final TextEditingController? controller;

  /// Focus node for managing input focus state
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style:
          TextStyleHelper.instance.title17RegularInter.copyWith(height: 1.24),
      decoration: InputDecoration(
        hintText: hintText ?? "Search",
        hintStyle: TextStyleHelper.instance.title17RegularInter
            .copyWith(color: Color(0xFF000000).withAlpha(153)),
        prefixIcon: prefixIconPath != null
            ? Padding(
                padding: EdgeInsets.all(12.h),
                child: CustomImageView(
                  imagePath: prefixIconPath!,
                  height: 24.h,
                  width: 24.h,
                ),
              )
            : null,
        filled: true,
        fillColor: fillColor ?? Color(0xFFF7D665),
        contentPadding: EdgeInsets.only(
          top: 12.h,
          right: 12.h,
          bottom: 12.h,
          left: prefixIconPath != null ? 46.h : 12.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.h),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.h),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.h),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.h),
          borderSide: BorderSide(
            color: appTheme.redCustom,
            width: 1.h,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.h),
          borderSide: BorderSide(
            color: appTheme.redCustom,
            width: 1.h,
          ),
        ),
      ),
    );
  }
}
