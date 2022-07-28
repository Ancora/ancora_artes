class ItemModel {
  String code;
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  // construtor
  ItemModel({
    required this.code,
    required this.itemName,
    required this.imgUrl,
    required this.unit,
    required this.price,
    required this.description,
  });
}