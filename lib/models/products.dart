// This class represents a single product in our store.
// A model is a plain Dart class that holds data — it has no UI code.
// Keeping models separate makes the codebase easier to read and maintain.

class Product {
  final int id;
  final String name;
  final String category;
  final double price;

  // The path to the product image inside the assets/images/ folder.
  // Example value: 'assets/images/samsung_galaxy_s24.png'
  // Flutter resolves this path at runtime using the pubspec.yaml asset
  // declaration. No network connection is needed.
  final String imagePath;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
  });
}