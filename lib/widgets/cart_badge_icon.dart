import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class CartBadgeIcon extends StatelessWidget {
  final int itemCount;
  final VoidCallback? onPressed;

  const CartBadgeIcon({
    super.key,
    this.itemCount = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          color: AppTheme.white,
          iconSize: 26,
          onPressed: onPressed,
          tooltip: 'View cart',
        ),

        // Only show the badge when itemCount is greater than zero
        if (itemCount > 0)
          Positioned(
            top: 6,
            right: 4,
            child: _Badge(count: itemCount),
          ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final int count;

  const _Badge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          // Show "9+" if count exceeds 9 to keep the badge compact
          count > 9 ? '9+' : '$count',
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}