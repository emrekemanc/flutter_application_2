class ProductEntitiy {
  ProductEntitiy({required this.id, required this.title, required this.price});

  factory ProductEntitiy.fromJson(Map<String, dynamic> json) => ProductEntitiy(
    id: json['id'] as int,
    title: json['title'] as String,
    price: json['price'] as double,
  );
  final int id;
  final String title;
  final double price;
}
