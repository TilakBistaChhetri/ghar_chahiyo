import 'package:flutter/material.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/constants/my_fonts.dart';
import '../../../../../core/constants/my_icons.dart';
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
                            height: 156,
                            width: 153,
                            fit: BoxFit.cover,
                          )
                          : const Placeholder(
                            fallbackWidth: 150,
                            fallbackHeight: 150,
                          ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price ?? 'Price not available',
                        style: const TextStyle(
                          color: MyColors.textColor,
                          fontSize: AppFontSizes.heading,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        area ?? 'Area not specified',
                        style: const TextStyle(
                          fontSize: AppFontSizes.extraSmall,
                          color: MyColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 90,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                "Semi Funished",
                                style: TextStyle(
                                  fontSize: AppFontSizes.extraTiny,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 50,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                "Sale",
                                style: TextStyle(
                                  fontSize: AppFontSizes.extraTiny,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Text("${bathrooms ?? 0}"),
                          const SizedBox(width: 4),
                          Image.asset(MyIcons.bathroom, width: 12, height: 12),

                          const SizedBox(width: 12),

                          Text("${bedrooms ?? 0}"),
                          const SizedBox(width: 4),
                          Image.asset(MyIcons.bed, width: 12, height: 12),

                          const SizedBox(width: 12),

                          Text(
                            "${bathrooms ?? 0}",
                          ), // Some other count or property
                          const SizedBox(width: 4),
                          Image.asset(
                            MyIcons.villa,
                            width: 12,
                            height: 12,
                          ), // Villa icon

                          const SizedBox(width: 12),

                          Text(type ?? 'Type not specified'),
                        ],
                      ),

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
                              style: TextStyle(
                                fontSize: AppFontSizes.caption,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      if (onPhoneTap != null || onAgentTap != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              if (onPhoneTap != null)
                                SizedBox(
                                  width: 80,
                                  height: 24,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: onPhoneTap,
                                    child: const Center(
                                      child: Text(
                                        'Phone No.',
                                        style: TextStyle(
                                          fontSize: AppFontSizes.caption,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(width: 8),
                              if (onAgentTap != null)
                                SizedBox(
                                  width: 80,
                                  height: 24,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: MyColors.primaryColor,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: onAgentTap,
                                    child: const Center(
                                      child: Text(
                                        'Call Agent',
                                        style: TextStyle(
                                          fontSize: AppFontSizes.caption,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
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
