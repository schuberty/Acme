extension DoubleFormatter on double {
  String formatToReal() {
    return "R\$${toStringAsFixed(2)}";
  }
}
