class PharmacyModel {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? cover;
  final double? latitude;
  final double? longitude;
  final String? workingHours;
  final double? rating;
  final int? reviews;

  PharmacyModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.cover,
    this.latitude,
    this.longitude,
    this.workingHours,
    this.rating,
    this.reviews,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) =>
    PharmacyModel(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      phone: json["phone"],
      cover: json["cover"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      workingHours: json["working_hours"],
      rating: json["rating"]?.toDouble(),
      reviews: json["reviews"],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "cover": cover,
    "latitude": latitude,
    "longitude": longitude,
    "working_hours": workingHours,
    "rating": rating,
    "reviews": reviews,
  };
}