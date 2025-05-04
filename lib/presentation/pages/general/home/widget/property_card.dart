import 'package:flutter/material.dart';
import '../../../../../core/constants/my_colors.dart';
import '../property_description.dart';

class PropertyCard extends StatelessWidget {
  final String imagePath;
  final String price;
  final String area;
  final int bedrooms;
  final int bathrooms;
  final String type;
  final String location;
  final VoidCallback? onCardTap;
  final VoidCallback? onPhoneTap;
  final VoidCallback? onAgentTap;

  const PropertyCard({
    super.key,
    required this.imagePath,
    required this.price,
    required this.area,
    required this.bedrooms,
    required this.bathrooms,
    required this.type,
    required this.location,
    this.onCardTap,
    this.onPhoneTap,
    this.onAgentTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PropertyDescriptionPage()));


      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 183,
        width: 369,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    height: double.infinity,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: MyColors.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        area,
                        style: const TextStyle(
                          fontSize: 13,
                          color: MyColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.bed, size: 16, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text("$bedrooms"),
                          const SizedBox(width: 12),
                          const Icon(Icons.bathtub_outlined, size: 16, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text("$bathrooms"),
                          const SizedBox(width: 12),
                          const Icon(Icons.home_outlined, size: 16, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text(type),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 24,
                            child: OutlinedButton(
                              onPressed: onPhoneTap,
                              child: const Text('Phone', style: TextStyle(fontSize: 10)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 80,
                            height: 24,
                            child: ElevatedButton(
                              onPressed: onAgentTap,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Call Agent'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
