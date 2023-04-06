class Coffee {
  final String name;
  final String smallPrice;
  final String mediumPrice;
  final String largePrice;
  final String imagePath;
  String? price;

  Coffee(
      {required this.name,
      required this.imagePath,
      required this.smallPrice,
      required this.mediumPrice,
      required this.largePrice,
      this.price});
}
