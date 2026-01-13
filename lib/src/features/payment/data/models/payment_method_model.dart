class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? icon;
  final bool? isActive;

  PaymentMethodModel({
    this.id,
    this.name,
    this.icon,
    this.isActive,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
    PaymentMethodModel(
      id: json["id"],
      name: json["name"],
      icon: json["icon"],
      isActive: json["is_active"],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "is_active": isActive,
  };
}