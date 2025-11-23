import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomBar - A flexible bottom navigation bar component
 * 
 * Supports icon-only and icon-with-text variants with customizable styling.
 * Handles navigation between different screens using route names.
 * 
 * @param bottomBarItemList - List of bottom bar items with their properties
 * @param onChanged - Callback function triggered when a bottom bar item is tapped
 * @param selectedIndex - Current selected index of the bottom bar (default: 0)
 * @param showLabels - Whether to show text labels below icons (default: false)
 * @param backgroundColor - Background color of the bottom bar
 * @param verticalPadding - Vertical padding of the bottom bar
 * @param horizontalPadding - Horizontal padding of the bottom bar
 * @param activeIconColor - Background color for active icon button
 * @param textColor - Color of the text labels
 */
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
    this.showLabels,
    this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.activeIconColor,
    this.textColor,
  }) : super(key: key);

  /// List of bottom bar items with their properties
  final List<CustomBottomBarItem> bottomBarItemList;

  /// Current selected index of the bottom bar
  final int selectedIndex;

  /// Callback function triggered when a bottom bar item is tapped
  final Function(int) onChanged;

  /// Whether to show text labels below icons
  final bool? showLabels;

  /// Background color of the bottom bar
  final Color? backgroundColor;

  /// Vertical padding of the bottom bar
  final double? verticalPadding;

  /// Horizontal padding of the bottom bar
  final double? horizontalPadding;

  /// Background color for active icon button
  final Color? activeIconColor;

  /// Color of the text labels
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 20.h,
        horizontal: horizontalPadding ?? 36.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFFFED95A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          bottomBarItemList.length,
          (index) => _buildBottomBarItem(
            bottomBarItemList[index],
            index == selectedIndex,
            index,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(
    CustomBottomBarItem item,
    bool isSelected,
    int index,
  ) {
    final bool shouldShowLabels = showLabels ?? false;

    return InkWell(
      onTap: () => onChanged(index),
      child: shouldShowLabels && item.title != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(item, isSelected),
                SizedBox(height: 6.h),
                Text(
                  item.title!,
                  style: TextStyleHelper.instance.body12SemiBoldInter
                      .copyWith(color: textColor ?? Color(0xFF1E1E1E)),
                ),
              ],
            )
          : _buildIcon(item, isSelected),
    );
  }

  Widget _buildIcon(CustomBottomBarItem item, bool isSelected) {
    if (isSelected && item.activeIcon != null) {
      return Container(
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          color: activeIconColor ?? Color(0xFFF7D665),
          borderRadius: BorderRadius.circular(4.h),
        ),
        child: CustomImageView(
          imagePath: item.activeIcon!,
          height: 30.h,
          width: 30.h,
        ),
      );
    }

    return CustomImageView(
      imagePath: item.icon,
      height: 30.h,
      width: 30.h,
    );
  }
}

/// Item data model for custom bottom bar
class CustomBottomBarItem {
  CustomBottomBarItem({
    required this.icon,
    required this.routeName,
    this.activeIcon,
    this.title,
  });

  /// Path to the icon image
  final String icon;

  /// Path to the active state icon (optional)
  final String? activeIcon;

  /// Title text shown below the icon (optional)
  final String? title;

  /// Route name for navigation
  final String routeName;
}
