class ClinicSearchModel {
  final int? id;
  final String? name;
  final String? cover;
  final int? numberOfHospitals;
  final int? minPrice;
  final int? maxPrice;

  ClinicSearchModel({
    this.id,
    this.name,
    this.cover,
    this.numberOfHospitals,
    this.minPrice,
    this.maxPrice,
  });

  factory ClinicSearchModel.fromJson(Map<String, dynamic> json) => ClinicSearchModel(
    id: json["id"],
    name: json["name"],
    cover: json["cover"],
    numberOfHospitals: json["number_of_hospitals"],
    minPrice: json["min_price"],
    maxPrice: json["max_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "cover": cover,
    "number_of_hospitals": numberOfHospitals,
    "min_price": minPrice,
    "max_price": maxPrice,
  };
}