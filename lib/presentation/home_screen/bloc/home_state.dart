part of 'home_bloc.dart';

class HomeState extends Equatable {
  final TextEditingController? searchController;
  final String? searchText;
  final List<String>? searchResults;
  final bool? isLoading;
  final bool? showLocationDialog;
  final int? currentSliderIndex;
  final String? selectedCategory;
  final String? selectedProduct;
  final HomeModel? homeModel;

  HomeState({
    this.searchController,
    this.searchText,
    this.searchResults,
    this.isLoading = false,
    this.showLocationDialog = false,
    this.currentSliderIndex = 0,
    this.selectedCategory,
    this.selectedProduct,
    this.homeModel,
  });

  @override
  List<Object?> get props => [
        searchController,
        searchText,
        searchResults,
        isLoading,
        showLocationDialog,
        currentSliderIndex,
        selectedCategory,
        selectedProduct,
        homeModel,
      ];

  HomeState copyWith({
    TextEditingController? searchController,
    String? searchText,
    List<String>? searchResults,
    bool? isLoading,
    bool? showLocationDialog,
    int? currentSliderIndex,
    String? selectedCategory,
    String? selectedProduct,
    HomeModel? homeModel,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      searchText: searchText ?? this.searchText,
      searchResults: searchResults ?? this.searchResults,
      isLoading: isLoading ?? this.isLoading,
      showLocationDialog: showLocationDialog ?? this.showLocationDialog,
      currentSliderIndex: currentSliderIndex ?? this.currentSliderIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      homeModel: homeModel ?? this.homeModel,
    );
  }
}
