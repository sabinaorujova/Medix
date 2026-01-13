class FilterModel {
  final int? id;
  final String? name;
  final int? price;
  final String? cover;
  final int? rooms;
  final String? address;
  final int? acreage;
  final String? averageRating;
  final int? numberOfReviews;
  final bool? isFavorite;

  FilterModel({
    this.id,
    this.name,
    this.price,
    this.cover,
    this.rooms,
    this.address,
    this.acreage,
    this.averageRating,
    this.numberOfReviews,
    this.isFavorite,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    cover: json["cover"],
    rooms: json["rooms"],
    address: json["address"],
    acreage: json["acreage"],
    averageRating: json["average_rating"],
    numberOfReviews: json["number_of_reviews"],
    isFavorite: json["is_favorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "cover": cover,
    "rooms": rooms,
    "address": address,
    "acreage": acreage,
    "average_rating": averageRating,
    "number_of_reviews": numberOfReviews,
    "is_favorite": isFavorite,
  };
}