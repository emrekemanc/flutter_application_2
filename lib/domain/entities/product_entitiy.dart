class ProductEntitiy {
  final int id;
  final String title;
  final double price;

  ProductEntitiy({required this.id, required this.title, required this.price});

  factory ProductEntitiy.fromJson(Map<String, dynamic> json) => ProductEntitiy(
    id: json['id'],
    title: json['title'],
    price: json['price'],
  );
}
