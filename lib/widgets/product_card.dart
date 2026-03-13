import 'package:flutter/material.dart';
import '../models/products.dart';
import '../utils/price_formatter.dart';
import '../utils/app_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCart; 

  const ProductCard({
    super.key,
    required this.product,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Product Image --
          _ProductImage(
            imagePath: product.imagePath,
            category: product.category,
          ),

          // -- Product Info --
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category label
                  Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.subtleGrey,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 3),

                  // Product name
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.darkText,
                      height: 1.3,
                    ),
                  ),

                  const Spacer(),

                  // Price
                  Text(
                    formatPrice(product.price),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryOrange,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Add to Cart button
                  SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: ElevatedButton(
                      onPressed: onAddToCart,
                      child: const Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _ProductImage extends StatelessWidget {
  final String imagePath;
  final String category;

  const _ProductImage({
    required this.imagePath,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,

          errorBuilder: (context, error, stackTrace) {
            return _FallbackPlaceholder(category: category);
          },
        ),
      ),
    );
  }
}


class _FallbackPlaceholder extends StatelessWidget {
  final String category;

  const _FallbackPlaceholder({required this.category});

  static const Map<String, _PlaceholderStyle> _styles = {
    'Smartphones': _PlaceholderStyle(Color(0xFFE8F4FD), Icons.smartphone,    Color(0xFF2980B9)),
    'Audio':       _PlaceholderStyle(Color(0xFFFEF9E7), Icons.headphones,     Color(0xFFD4AC0D)),
    'Computers':   _PlaceholderStyle(Color(0xFFEBF5FB), Icons.laptop,         Color(0xFF1A5276)),
    'Tablets':     _PlaceholderStyle(Color(0xFFF4ECF7), Icons.tablet,         Color(0xFF7D3C98)),
    'Accessories': _PlaceholderStyle(Color(0xFFE9F7EF), Icons.cable,          Color(0xFF1E8449)),
    'Monitors':    _PlaceholderStyle(Color(0xFFFDF2F8), Icons.desktop_windows, Color(0xFFBB3FC3)),
    'Cameras':     _PlaceholderStyle(Color(0xFFFEF5E7), Icons.camera_alt,     Color(0xFFCA6F1E)),
  };

  static const _PlaceholderStyle _defaultStyle = _PlaceholderStyle(
    Color(0xFFF2F3F4),
    Icons.devices,
    Color(0xFF7F8C8D),
  );

  @override
  Widget build(BuildContext context) {
    final style = _styles[category] ?? _defaultStyle;

    return Container(
      color: style.backgroundColor,
      child: Center(
        child: Icon(
          style.icon,
          size: 52,
          color: style.iconColor,
        ),
      ),
    );
  }
}

class _PlaceholderStyle {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  const _PlaceholderStyle(this.backgroundColor, this.icon, this.iconColor);
}