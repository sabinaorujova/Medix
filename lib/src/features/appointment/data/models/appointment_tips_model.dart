class AppointmentTips {
  final int? id;
  final String? name;
  final String? icon;
  final double? price;

  AppointmentTips({
    this.id,
    this.name,
    this.icon,
    this.price,
  });

  AppointmentTips copyWith({
    int? id,
    String? name,
    String? icon,
    double? price,
  }) => 
    AppointmentTips(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      price: price ?? this.price,
    );

  factory AppointmentTips.fromJson(Map<String, dynamic> json) => AppointmentTips(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "price": price,
  };
}