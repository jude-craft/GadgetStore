// A simple utility function for formatting prices.
// Keeping formatting logic in a utility file means we only write
// it once and reuse it everywhere, making future changes easy.

String formatPrice(double price) {
  // Format with commas for thousands separator
  // e.g. 89999 becomes "Ksh 89,999"
  final formatted = price
      .toStringAsFixed(0)
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
  return 'Ksh $formatted';
}