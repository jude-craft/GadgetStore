import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../utils/price_formatter.dart';
import '../utils/app_theme.dart';

class CartItemRow extends StatelessWidget {
  final CartItem cartItem;

  const CartItemRow({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // Small product icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppTheme.lightBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.devices,
              size: 28,
              color: AppTheme.subtleGrey,
            ),
          ),
          const SizedBox(width: 14),

          // Product name and quantity
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Qty: ${cartItem.quantity}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.subtleGrey,
                  ),
                ),
              ],
            ),
          ),

          // Subtotal price
          Text(
            formatPrice(cartItem.subtotal),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkText,
            ),
          ),
        ],
      ),
    );
  }
}