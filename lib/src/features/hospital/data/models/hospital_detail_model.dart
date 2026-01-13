class HospitalDetailModel {
  final int? id;
  final String? name;
  final int? price;
  final String? cover;
  final int? rooms;
  final String? address;
  final int? acreage;
  final String? averageRating;
  final int? numberOfReviews;
  final int? numberOfDoctors;
  final bool? isFavorite;
  final String? description;

  HospitalDetailModel({
    this.id,
    this.description,
    this.name,
    this.price,
    this.cover,
    this.rooms,
    this.address,
    this.acreage,
    this.averageRating,
    this.numberOfReviews,
    this.numberOfDoctors,
    this.isFavorite,
  });

  HospitalDetailModel copyWith({
    int? id,
    String? name,
    int? price,
    String? cover,
    int? rooms,
    String? address,
    int? acreage,
    String? averageRating,
    int? numberOfReviews,
    int? numberOfDoctors,
    bool? isFavorite,
    String? description,
  }) =>
    HospitalDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      cover: cover ?? this.cover,
      rooms: rooms ?? this.rooms,
      address: address ?? this.address,
      acreage: acreage ?? this.acreage,
      averageRating: averageRating ?? this.averageRating,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      numberOfDoctors: numberOfDoctors ?? this.numberOfDoctors,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
    );

  factory HospitalDetailModel.fromJson(Map<String, dynamic> json) =>
    HospitalDetailModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      cover: json["cover"],
      rooms: json["rooms"],
      address: json["address"],
      description: json["description"],
      acreage: json["acreage"],
      averageRating: json["average_rating"],
      numberOfReviews: json["number_of_reviews"],
      numberOfDoctors: json["number_of_doctors"],
      isFavorite: json["is_favorite"],
    );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "cover": cover,
    "rooms": rooms,
    "address": address,
    "description": description,
    "acreage": acreage,
    "average_rating": averageRating,
    "number_of_reviews": numberOfReviews,
    "number_of_doctors": numberOfDoctors,
    "is_favorite": isFavorite,
  };
}