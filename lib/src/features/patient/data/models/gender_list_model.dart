
class GenderListModel {
    final int? id;
    final String? name;

    GenderListModel({
        this.id,
        this.name,
    });

    GenderListModel copyWith({
        int? id,
        String? name,
    }) => 
        GenderListModel(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory GenderListModel.fromJson(Map<String, dynamic> json) => GenderListModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
