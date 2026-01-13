class HospitalCityListModel {
  final int? id;
  final String? name;

  HospitalCityListModel({
    this.id,
    this.name,
  });

  factory HospitalCityListModel.fromJson(Map<String, dynamic> json) => HospitalCityListModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}