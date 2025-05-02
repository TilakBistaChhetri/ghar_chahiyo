class Locality {
  final String id;
  final String name;
  final int propertyCount;

  Locality({required this.id, required this.name, this.propertyCount = 0});
}

class Property {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String location;
  final String area;
  final String status;
  final String size;
  final int? imageCount;

  Property({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.location,
    required this.area,
    required this.status,
    this.size = '',
    this.imageCount,
  });
}
