import '../../../core/app_export.dart';

/// This class is used in the [HomeScreen] screen.

// ignore_for_file: must_be_immutable
class HomeModel extends Equatable {
  HomeModel({
    this.searchText,
    this.selectedCategory,
    this.selectedProduct,
    this.currentSliderIndex,
    this.categories,
    this.featuredProducts,
    this.id,
  }) {
    searchText = searchText ?? "";
    selectedCategory = selectedCategory ?? "";
    selectedProduct = selectedProduct ?? "";
    currentSliderIndex = currentSliderIndex ?? 0;
    categories = categories ??
        [
          "Coconut Oil",
          "Summer Off",
          "Tender",
          "Mango juice",
          "Sweet Mango",
          "Raw mango"
        ];
    featuredProducts = featuredProducts ?? ["Coconut", "Mango"];
    id = id ?? "";
  }

  String? searchText;
  String? selectedCategory;
  String? selectedProduct;
  int? currentSliderIndex;
  List<String>? categories;
  List<String>? featuredProducts;
  String? id;

  HomeModel copyWith({
    String? searchText,
    String? selectedCategory,
    String? selectedProduct,
    int? currentSliderIndex,
    List<String>? categories,
    List<String>? featuredProducts,
    String? id,
  }) {
    return HomeModel(
      searchText: searchText ?? this.searchText,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      currentSliderIndex: currentSliderIndex ?? this.currentSliderIndex,
      categories: categories ?? this.categories,
      featuredProducts: featuredProducts ?? this.featuredProducts,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        searchText,
        selectedCategory,
        selectedProduct,
        currentSliderIndex,
        categories,
        featuredProducts,
        id,
      ];
}
