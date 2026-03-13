// A CartItem wraps a Product and tracks how many of that product
// the user has added to the cart.
//
// Why a separate model instead of just using Product?
// Because we need to store extra information (quantity) that does
// not belong on the Product itself.


import 'products.dart';

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  // Returns the total cost for this line item (price x quantity)
  double get subtotal => product.price * quantity;

  // Returns a copy of this CartItem with an updated quantity.
  // Dart classes are immutable by convention, so we create a new
  // object instead of mutating the existing one.
  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}