class HospitalSearchModel {
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

  HospitalSearchModel({
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

  HospitalSearchModel copyWith({
    int? id,
    String? name,
    int? price,
    String? cover,
    int? rooms,
    String? address,
    int? acreage,
    String? averageRating,
    int? numberOfReviews,
    bool? isFavorite,
  }) => 
    HospitalSearchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      cover: cover ?? this.cover,
      rooms: rooms ?? this.rooms,
      address: address ?? this.address,
      acreage: acreage ?? this.acreage,
      averageRating: averageRating ?? this.averageRating,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      isFavorite: isFavorite ?? this.isFavorite,
    );

  factory HospitalSearchModel.fromJson(Map<String, dynamic> json) => HospitalSearchModel(
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