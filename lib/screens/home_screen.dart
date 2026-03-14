import 'package:flutter/material.dart';
import 'package:provider/models/cart_item.dart';
import 'package:provider/models/products.dart';
import 'package:provider/screens/cart_screen.dart';

import '../data/dummy_products.dart';
import '../widgets/cart_badge_icon.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CartItem> _cartItems = [];

  int get _cartItemCount {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  void _addToCart(Product product) {
    setState(() {
      final existingIndex = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingIndex >= 0) {
        _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
          quantity: _cartItems[existingIndex].quantity + 1,
        );
      } else {
        _cartItems.add(CartItem(product: product, quantity: 1));
      }
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
    });
  }

  void _openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CartScreen(
          cartItems: List.unmodifiable(_cartItems),
          onPurchaseComplete: _clearCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GadgetStore'),
        actions: [
          CartBadgeIcon(itemCount: _cartItemCount, onPressed: _openCart),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Section Header ---
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text(
              'Featured Gadgets',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),

          // --- Product Grid ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: dummyProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return ProductCard(
                    product: product,
                    onAddToCart: () => _addToCart(product),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
