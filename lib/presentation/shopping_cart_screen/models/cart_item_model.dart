import '../../../core/app_export.dart';

class CartItemModel extends Equatable {
  CartItemModel({
    this.id,
    this.name,
    this.weight,
    this.price,
    this.quantity,
    this.imagePath,
  }) {
    id = id ?? '';
    name = name ?? '';
    weight = weight ?? '';
    price = price ?? 0.0;
    quantity = quantity ?? 1;
    imagePath = imagePath ?? '';
  }

  String? id;
  String? name;
  String? weight;
  double? price;
  int? quantity;
  String? imagePath;

  CartItemModel copyWith({
    String? id,
    String? name,
    String? weight,
    double? price,
    int? quantity,
    String? imagePath,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        weight,
        price,
        quantity,
        imagePath,
      ];
}
