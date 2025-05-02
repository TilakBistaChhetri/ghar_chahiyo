class Property {
  final String title;
  final String price;
  final String location;
  final String imageUrl;
  final String status;
  final String fullLocation;

  Property({
    required this.title,
    required this.price,
    required this.location,
    required this.imageUrl,
    required this.status,
    required this.fullLocation,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['image_url'] ?? '',
      status: json['status'] ?? '',
      fullLocation: json['full_location'] ?? '',
    );
  }
}

class PropertyListing {
  final String id;
  final String price;
  final String bedrooms;
  final String propertyType;
  final String size;
  final String locality;
  final String city;
  final String imageUrl;
  final String status;
  final String postedDate;
  final List<String> tags;

  PropertyListing({
    required this.id,
    required this.price,
    required this.bedrooms,
    required this.propertyType,
    required this.size,
    required this.locality,
    required this.city,
    required this.imageUrl,
    required this.status,
    required this.postedDate,
    required this.tags,
  });

  factory PropertyListing.fromJson(Map<String, dynamic> json) {
    return PropertyListing(
      id: json['id']?.toString() ?? '',
      price: json['price']?.toString() ?? '₹ 0',
      bedrooms: json['bedrooms']?.toString() ?? '',
      propertyType: json['propertyType']?.toString() ?? '',
      size: json['size']?.toString() ?? '',
      locality: json['locality']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      status: json['status']?.toString() ?? 'Ready to Move',
      postedDate: json['postedDate']?.toString() ?? 'Recently Added',
      tags: json['tags'] is List ? List<String>.from(json['tags']) : [],
    );
  }
}
