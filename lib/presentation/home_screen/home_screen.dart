import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/text_style_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_search_view.dart';
import './bloc/home_bloc.dart';
import './models/home_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CarouselSliderController carouselController =
      CarouselSliderController(); // Modified: Replaced CarouselControllerPlus with CarouselSliderController

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModel: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.white_A700,
      appBar: _buildAppBar(context),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                left: 16.h,
                right: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopPicksSlider(context, state),
                  SizedBox(height: 8.h),
                  _buildTopPicksLabel(context),
                  SizedBox(height: 8.h),
                  _buildCategoryGrid(context, state),
                  SizedBox(height: 22.h),
                  _buildFeaturedProducts(context, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.white_A700,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 56.h,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: Row(
          children: [
            Expanded(
              child: BlocSelector<HomeBloc, HomeState, TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    hintText: "Search",
                    prefixIconPath: ImageConstant.imgMaterialSymbol,
                    fillColor: appTheme.amber_300_01,
                    borderRadius: 24.h,
                    controller: searchController,
                    onChanged: (value) {
                      context
                          .read<HomeBloc>()
                          .add(SearchTextChangedEvent(searchText: value));
                    },
                    onSubmitted: (value) {
                      context
                          .read<HomeBloc>()
                          .add(SearchSubmittedEvent(searchText: value));
                    },
                  );
                },
              ),
            ),
            SizedBox(width: 20.h),
            GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(LocationIconTappedEvent());
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 42.h,
                width: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPicksSlider(BuildContext context, HomeState state) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
        left: 4.h,
        right: 4.h,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            controller:
                carouselController, // Fixed: Changed from carouselController to controller
            options: CarouselOptions(
              height: 186.h,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                context
                    .read<HomeBloc>()
                    .add(SliderIndexChangedEvent(index: index));
              },
            ),
            items: [
              _buildSliderItem(context),
            ],
          ),
          Positioned(
            bottom: 8.h,
            child: BlocSelector<HomeBloc, HomeState, int>(
              selector: (state) => state.currentSliderIndex ?? 0,
              builder: (context, currentIndex) {
                return SmoothPageIndicator(
                  controller: PageController(initialPage: currentIndex),
                  count: 1,
                  effect: WormEffect(
                    dotColor: appTheme.colorFFCCCC,
                    activeDotColor: appTheme.black_900,
                    dotHeight: 10.h,
                    dotWidth: 10.h,
                    spacing: 8.h,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderItem(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 186.h,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26.h),
            decoration: BoxDecoration(
              color: appTheme.lime_200,
              borderRadius: BorderRadius.circular(24.h),
              border: Border.all(
                color: appTheme.black_900,
                width: 1.h,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgImage1,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            right: 16.h,
            child: CustomImageView(
              imagePath: ImageConstant.imgImage2,
              height: 64.h,
              width: 136.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopPicksLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h),
      child: Text(
        "Top Picks",
        style: TextStyleHelper.instance.title17SemiBoldInter
            .copyWith(color: appTheme.black_900),
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context, HomeState state) {
    return Column(
      children: [
        Row(
          children: [
            _buildCategoryItem(
              context,
              imagePath: ImageConstant.imgImage4,
              title: "Coconut Oil",
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(CategorySelectedEvent(category: "Coconut Oil"));
              },
            ),
            SizedBox(width: 16.h),
            _buildCategoryItem(
              context,
              imagePath: ImageConstant.imgImage3,
              title: "Summer Off",
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(CategorySelectedEvent(category: "Summer Off"));
              },
            ),
            SizedBox(width: 16.h),
            _buildCategoryItem(
              context,
              imagePath: ImageConstant.imgImage27,
              title: "Tender",
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(CategorySelectedEvent(category: "Tender"));
              },
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 20.h),
          child: Row(
            children: [
              _buildCategoryItem(
                context,
                imagePath: ImageConstant.imgImage6,
                title: "Mango juice",
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(CategorySelectedEvent(category: "Mango juice"));
                },
              ),
              SizedBox(width: 16.h),
              _buildCategoryItem(
                context,
                imagePath: ImageConstant.imgRectangle134x134,
                title: "Sweet Mango",
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(CategorySelectedEvent(category: "Sweet Mango"));
                },
              ),
              SizedBox(width: 10.h),
              _buildCategoryItem(
                context,
                imagePath: ImageConstant.imgRectangle,
                title: "Raw mango",
                isRawMango: true,
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(CategorySelectedEvent(category: "Raw mango"));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(
    BuildContext context, {
    required String imagePath,
    required String title,
    required VoidCallback onTap,
    bool isRawMango = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100.h,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: appTheme.lime_200,
                    borderRadius: BorderRadius.circular(50.h),
                  ),
                ),
                CustomImageView(
                  imagePath: imagePath,
                  height: isRawMango
                      ? 72.h
                      : (title == "Sweet Mango" ? 134.h : 128.h),
                  width: isRawMango
                      ? 98.h
                      : (title == "Sweet Mango" ? 134.h : 128.h),
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyleHelper.instance.title17SemiBoldInter
                  .copyWith(color: appTheme.black_900),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedProducts(BuildContext context, HomeState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(ProductSelectedEvent(productName: "Coconut"));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle5,
                      height: 152.h,
                      width: 152.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 34.h),
                    child: Text(
                      "Coconut",
                      style: TextStyleHelper.instance.title17SemiBoldInter
                          .copyWith(color: appTheme.black_900),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(ProductSelectedEvent(productName: "Mango"));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle6,
                      height: 152.h,
                      width: 152.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.only(right: 50.h),
                    child: Text(
                      "Mango",
                      style: TextStyleHelper.instance.title17SemiBoldInter
                          .copyWith(color: appTheme.black_900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
