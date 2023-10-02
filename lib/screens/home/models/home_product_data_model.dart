class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? rating;
  final String imageURL;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      this.rating,
      required this.imageURL});
}
