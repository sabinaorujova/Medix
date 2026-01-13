


import 'dart:convert';

List<BloodListModel> bloodListModelFromJson(String str) => List<BloodListModel>.from(json.decode(str).map((x) => BloodListModel.fromJson(x)));

String bloodListModelToJson(List<BloodListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodListModel {
    final int? id;
    final String? name;

    BloodListModel({
        this.id,
        this.name,
    });

    BloodListModel copyWith({
        int? id,
        String? name,
    }) => 
        BloodListModel(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory BloodListModel.fromJson(Map<String, dynamic> json) => BloodListModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
