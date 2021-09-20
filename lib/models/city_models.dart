part of 'models.dart';

class CityModel {
  int? id = 0;
  String? name = '';
  String? imageUrl = '';
  bool isPopular;

  CityModel({this.id = 0, this.imageUrl, this.name, this.isPopular = false});
}
