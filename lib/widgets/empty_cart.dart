// lib/widgets/empty_cart.dart
//
// Shown on the CartScreen when there are no items in the cart.
// Keeping this as a separate widget avoids cluttering the CartScreen
// with conditional layout logic.

import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: AppTheme.subtleGrey.withOpacity(0.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.darkText,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add items from the home screen to get started.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.subtleGrey,
            ),
          ),
        ],
      ),
    );
  }
}