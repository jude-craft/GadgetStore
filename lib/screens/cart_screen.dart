import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/cart_item_row.dart';
import '../widgets/empty_cart.dart';
import '../utils/price_formatter.dart';
import '../utils/app_theme.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final VoidCallback onPurchaseComplete;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onPurchaseComplete,
  });

  double get _totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.subtotal);
  }

  void _handlePurchase(BuildContext context) {
    onPurchaseComplete();
    Navigator.pop(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(" Items Purchased Successfully !"),
          backgroundColor: AppTheme.successGreen,
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: cartItems.isEmpty
          ? const EmptyCart()
          : Column(
              children: [
                // -- Cart Item List --
                Expanded(
                  child: ListView.separated(
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: AppTheme.dividerColor),
                    itemBuilder: (context, index) {
                      return CartItemRow(cartItem: cartItems[index]);
                    },
                  ),
                ),

                // -- Order Summary Footer --
                _OrderSummaryFooter(
                  totalPrice: _totalPrice,
                  onBuyNow: () {
                    _handlePurchase(context);
                  },
                ),
              ],
            ),
    );
  }
}

class _OrderSummaryFooter extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onBuyNow;

  const _OrderSummaryFooter({required this.totalPrice, required this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        children: [
          // Divider line above footer
          const Divider(height: 1, color: AppTheme.dividerColor),
          const SizedBox(height: 14),

          // Total row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkText,
                ),
              ),
              Text(
                formatPrice(totalPrice),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Buy Now button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onBuyNow,
              child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
