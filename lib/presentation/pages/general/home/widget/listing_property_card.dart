// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/core/constants/my_assets.dart';
// import 'package:ghar_chaiyo/core/constants/my_colors.dart';
// import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
// import 'package:ghar_chaiyo/core/constants/my_icons.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/property_description.dart';

// class ListingPropertyCard extends StatelessWidget {
//   const ListingPropertyCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap:
//           () => Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (builder) {
//                 return PropertyDescriptionPage();
//               },
//             ),
//           ),
//       child: SizedBox(
//         width: 290,
//         height: 255,
//         child: Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image with "FOR SALE" badge
//               Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue, // background color
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                     ),
//                     child: Image.asset(
//                       MyAssets.houseRectangle,

//                       height: 151,
//                       width: 290,

//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     left: 228,

//                     child: Container(
//                       width: 48,
//                       height: 20,

//                       decoration: BoxDecoration(
//                         color: MyColors.primaryColor,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                         child: const Text(
//                           'FOR SALE',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w900,
//                             fontSize: AppFontSizes.extraTiny,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 2),
//               Container(
//                 height: 91,
//                 width: 290,
//                 padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               'Rs.2.5cr',
//                               style: TextStyle(
//                                 fontSize: AppFontSizes.heading,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               "onwards",
//                               style: TextStyle(
//                                 fontSize: AppFontSizes.extraSmall,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),

//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               style: BorderStyle.solid,
//                               color: MyColors.gray,
//                               width: 1,
//                             ),
//                           ),
//                           height: 20,
//                           width: 80,
//                           child: Center(
//                             child: Text(
//                               'SEMI FURNISHED',
//                               style: TextStyle(
//                                 fontSize: AppFontSizes.extraTiny,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 6),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           '1',
//                           style: TextStyle(
//                             fontSize: AppFontSizes.caption,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(width: 4),

//                         Image.asset(MyIcons.bathroom, height: 10, width: 10),
//                         SizedBox(width: 12),
//                         Text(
//                           '2',
//                           style: TextStyle(
//                             fontSize: AppFontSizes.caption,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Image.asset(MyIcons.bed, height: 10, width: 10),
//                         SizedBox(width: 12),
//                         Text(
//                           'Villa',
//                           style: TextStyle(
//                             fontSize: AppFontSizes.extraSmall,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 6),
//                     Row(
//                       children: [
//                         Image.asset(MyIcons.sitemap, height: 18, width: 18),
//                         SizedBox(width: 10),
//                         Text(
//                           "Budhanilkanta, Kathmandu",
//                           style: TextStyle(
//                             fontSize: AppFontSizes.extraSmall,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';

import '../../../../../core/constants/my_assets.dart' show MyAssets;
import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/constants/my_fonts.dart';
import '../../../../../core/constants/my_icons.dart';
import '../property_description.dart';

class ListingPropertyCard extends StatelessWidget {
  const ListingPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.75;
    final imageHeight = cardWidth * 0.52;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => const PropertyDescriptionPage()),
      ),
      child: SizedBox(
        width: cardWidth,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: imageHeight,
                    width: cardWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        MyAssets.houseRectangle,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 60,
                      height: 22,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'FOR SALE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: AppFontSizes.extraTiny,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: cardWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Rs.2.5cr',
                              style: TextStyle(
                                fontSize: AppFontSizes.heading,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "onwards",
                              style: TextStyle(
                                fontSize: AppFontSizes.extraSmall,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: MyColors.gray,
                              width: 1,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'SEMI FURNISHED',
                              style: TextStyle(
                                fontSize: AppFontSizes.extraTiny,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text(
                          '1',
                          style: TextStyle(
                            fontSize: AppFontSizes.caption,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(MyIcons.bathroom, height: 12, width: 12),
                        const SizedBox(width: 12),
                        const Text(
                          '2',
                          style: TextStyle(
                            fontSize: AppFontSizes.caption,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(MyIcons.bed, height: 12, width: 12),
                        const SizedBox(width: 12),
                        const Text(
                          'Villa',
                          style: TextStyle(
                            fontSize: AppFontSizes.extraSmall,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(MyIcons.sitemap, height: 18, width: 18),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "Budhanilkanta, Kathmandu",
                            style: TextStyle(
                              fontSize: AppFontSizes.extraSmall,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
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
    );
  }
}