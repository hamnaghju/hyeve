// models/lodge_model.dart
class LodgeModel {
  final String name;
  final String location;
  final String trustScore;
  final String description;
  final double rating;
  final int minPrice;
  final int maxPrice;
  final List<String> amenities;
  final String distance;
  final String caretaker;
  final String phone;

  LodgeModel({
    required this.name,
    required this.location,
    required this.trustScore,
    required this.description,
    required this.rating,
    required this.minPrice,
    required this.maxPrice,
    required this.amenities,
    required this.distance,
    required this.caretaker,
    required this.phone,
  });
}

class CaretakerModel {
  final String name;
  final int trustScore;
  final double rating;
  final int reviewsCount;
  final String about;
  final List<String> traits;

  CaretakerModel({
    required this.name,
    required this.trustScore,
    required this.rating,
    required this.reviewsCount,
    required this.about,
    required this.traits,
  });
}

