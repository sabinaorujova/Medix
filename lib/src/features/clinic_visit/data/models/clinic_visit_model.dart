class ClinicVisitResponse {
  final int? id;
  final String? name;
  final String? cover;
  final int? numberOfHospitals;
  final int? minPrice;
  final int? maxPrice;

  ClinicVisitResponse({
    this.id,
    this.name,
    this.cover,
    this.numberOfHospitals,
    this.minPrice,
    this.maxPrice,
  });

  factory ClinicVisitResponse.fromJson(Map<String, dynamic> json) =>
      ClinicVisitResponse(
        id: json["id"] as int?,
        name: json["name"] as String?,
        cover: json["cover"] as String?,
        numberOfHospitals: json["number_of_hospitals"] as int?,
        minPrice: json["min_price"] as int?,
        maxPrice: json["max_price"] as int?,
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