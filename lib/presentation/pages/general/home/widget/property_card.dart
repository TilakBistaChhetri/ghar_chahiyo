import 'package:flutter/material.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/constants/my_fonts.dart';
import '../property_description.dart';

class PropertyCard extends StatelessWidget {
  final String? imagePath;
  final String? price;
  final String? area;
  final int? bedrooms;
  final int? bathrooms;
  final String? type;
  final String? location;
  final VoidCallback? onCardTap;
  final VoidCallback? onPhoneTap;
  final VoidCallback? onAgentTap;

  const PropertyCard({
    super.key,
    this.imagePath,
    this.price,
    this.area,
    this.bedrooms,
    this.bathrooms,
    this.type,
    this.location,
    this.onCardTap,
    this.onPhoneTap,
    this.onAgentTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onCardTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PropertyDescriptionPage(),
              ),
            );
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
                  child:
                      imagePath != null
                          ? Image.asset(
                            imagePath!,
                            height: double.infinity,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                          : const Placeholder(
                            fallbackWidth: 150,
                            fallbackHeight: 150,
                          ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price ?? 'Price not available',
                        style: const TextStyle(
                          color: MyColors.textColor,

                          fontSize: AppFontSizes.heading,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        area ?? 'Area not specified',
                        style: const TextStyle(
                          fontSize: AppFontSizes.extraSmall,
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.bed,
                            size: 16,
                           color: MyColors.black,
                          ),
                          const SizedBox(width: 4),
                          Text("${bedrooms ?? 0}"), // Use default if null
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.bathtub_outlined,
                            size: 16,
                            color: MyColors.black,
                            
                          ),
                          const SizedBox(width: 4),
                          Text("${bathrooms ?? 0}"), // Use default if null
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.home_outlined,
                            size: 16,
                            color: MyColors.black,
                          ),
                          const SizedBox(width: 4),
                          Text(type ?? 'Type not specified'),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location ?? 'Location not specified',
                              style: TextStyle(fontSize: AppFontSizes.caption),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      if (onPhoneTap != null || onAgentTap != null)
                        Row(
                          children: [
                            if (onPhoneTap != null)
                              SizedBox(
                                width: 80,
                                height: 24,
                                child: OutlinedButton(
                                  onPressed: onPhoneTap,
                                  child: const Text(
                                    'Phone',
                                    style: TextStyle(
                                      fontSize: AppFontSizes.caption,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            if (onAgentTap !=
                                null) 
                              SizedBox(
                                width: 80,
                                height: 24,
                                child: ElevatedButton(
                                  onPressed: onAgentTap,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColors.primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Call',
                                    style: TextStyle(
                                      fontSize: AppFontSizes.caption,
                                    ),
                                  ),
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
