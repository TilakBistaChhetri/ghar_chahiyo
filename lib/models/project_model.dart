class Project {
  final int id;
  final String name;
  final String location;
  final String price;
  final String image;
  final String? description;
  final String? propertyType;
  final String? area;
  final double? rating;

  Project({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.image,
    this.description,
    this.propertyType,
    this.area,
    this.rating,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      price: json['priceRange'] ?? json['price'],
      image: json['image'],
      description: json['description'],
      propertyType: json['propertyType'],
      area: json['area'],
      rating: json['rating']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'price': price,
      'image': image,
      'description': description,
      'propertyType': propertyType,
      'area': area,
      'rating': rating,
    };
  }
}
