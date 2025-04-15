class Product {
  String id;
  String name;
  String description;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['_id'],
    name: json['name'],
    description: json['description'],
    price: (json['price'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'price': price,
  };
}
