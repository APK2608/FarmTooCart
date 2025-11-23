part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class SearchTextChangedEvent extends HomeEvent {
  final String searchText;

  SearchTextChangedEvent({required this.searchText});

  @override
  List<Object?> get props => [searchText];
}

class SearchSubmittedEvent extends HomeEvent {
  final String searchText;

  SearchSubmittedEvent({required this.searchText});

  @override
  List<Object?> get props => [searchText];
}

class LocationIconTappedEvent extends HomeEvent {}

class SliderIndexChangedEvent extends HomeEvent {
  final int index;

  SliderIndexChangedEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class CategorySelectedEvent extends HomeEvent {
  final String category;

  CategorySelectedEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class ProductSelectedEvent extends HomeEvent {
  final String productName;

  ProductSelectedEvent({required this.productName});

  @override
  List<Object?> get props => [productName];
}
