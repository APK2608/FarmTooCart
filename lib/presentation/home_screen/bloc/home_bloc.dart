import 'package:flutter/material.dart';
import '../models/home_model.dart';
import '../../../core/app_export.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<SearchTextChangedEvent>(_onSearchTextChanged);
    on<SearchSubmittedEvent>(_onSearchSubmitted);
    on<LocationIconTappedEvent>(_onLocationIconTapped);
    on<SliderIndexChangedEvent>(_onSliderIndexChanged);
    on<CategorySelectedEvent>(_onCategorySelected);
    on<ProductSelectedEvent>(_onProductSelected);
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      currentSliderIndex: 0,
      isLoading: false,
    ));
  }

  _onSearchTextChanged(
    SearchTextChangedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchText: event.searchText,
    ));
  }

  _onSearchSubmitted(
    SearchSubmittedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    // Perform search operation
    await Future.delayed(Duration(milliseconds: 500));

    emit(state.copyWith(
      isLoading: false,
      searchResults: ['Search results for: ${event.searchText}'],
    ));
  }

  _onLocationIconTapped(
    LocationIconTappedEvent event,
    Emitter<HomeState> emit,
  ) async {
    // Handle location selection
    emit(state.copyWith(
      showLocationDialog: true,
    ));
  }

  _onSliderIndexChanged(
    SliderIndexChangedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      currentSliderIndex: event.index,
    ));
  }

  _onCategorySelected(
    CategorySelectedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      selectedCategory: event.category,
    ));
  }

  _onProductSelected(
    ProductSelectedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      selectedProduct: event.productName,
    ));
  }
}
