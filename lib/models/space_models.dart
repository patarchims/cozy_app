part of 'models.dart';

class SpaceModel {
  int? id;
  String? city = '';
  String? country = '';
  String? imageUrl = '';
  int? price = 0;
  String? name = '';
  int? rating = 0;
  String address = '';
  String? phone = '';
  String? mapUrl = '';
  List? photos = [];
  int? numberOfKitchens = 0;
  int? numberOfBedrooms = 0;
  int? numberofCupboards = 0;

  SpaceModel({
    this.id,
    this.city,
    this.country,
    this.imageUrl = '',
    this.price,
    this.name,
    this.rating = 0,
    this.address = '',
    this.mapUrl = '',
    this.numberOfBedrooms = 0,
    this.numberOfKitchens = 0,
    this.numberofCupboards = 0,
    this.phone = '',
    this.photos,
  });

  SpaceModel.fromJson(json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    city = json['city'] ?? '';
    country = json['country'] ?? '';
    imageUrl = json['image_url'] ?? '';
    price = json['price'] ?? 0;
    rating = json['rating'] ?? 0;
    address = json['address'] ?? '';
    phone = json['phone'] ?? '+62';
    mapUrl = json['map_url'] ?? '';
    numberOfBedrooms = json['number_of_bedrooms'] ?? 0;
    numberofCupboards = json['number_of_cupboards'] ?? 0;
    numberOfKitchens = json['number_of_kitchens'] ?? 0;
    photos = json['photos'];
  }
}
