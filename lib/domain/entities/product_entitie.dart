class ProductEntitie {
  final int id;
  final String title;
  final double price;

  ProductEntitie({required this.id, required this.title, required this.price});

  factory ProductEntitie.fromJson(Map<String, dynamic> json) => ProductEntitie(
    id: json['id'],
    title: json['title'],
    price: json['price'],
  );
}
