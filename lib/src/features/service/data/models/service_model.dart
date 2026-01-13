class ServiceModel {
  final int? id;
  final String? name;
  final String? description;
  final String? icon;
  final double? price;
  final String? category;

  ServiceModel({
    this.id,
    this.name,
    this.description,
    this.icon,
    this.price,
    this.category,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
    ServiceModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      icon: json["icon"],
      price: json["price"]?.toDouble(),
      category: json["category"],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "icon": icon,
    "price": price,
    "category": category,
  };
}