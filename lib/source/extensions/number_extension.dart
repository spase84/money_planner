extension NumberExtension on num {
  String get asCurrency => '\$${toStringAsFixed(2)}';
}
