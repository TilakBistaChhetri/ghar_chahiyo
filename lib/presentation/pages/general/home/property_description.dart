// import 'package:flutter/material.dart';

// import 'package:ghar_chaiyo/core/constants/my_assets.dart';

// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'widget/favourite_icon_button.dart';
// import 'widget/info_card.dart';
// import 'widget/share_icon_button.dart';

// class PropertyDescriptionPage extends StatelessWidget {
//   const PropertyDescriptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 25),
//               Stack(
//                 children: [
//                   SizedBox(height: 50),
//                   Image.asset(
//                     MyAssets.houseDetails,
//                     height: 369,
//                     width: 369,
//                     fit: BoxFit.cover,
//                   ),

//                   Positioned(
//                     top: 16,
//                     left: 16,
//                     child: CircleAvatar(
//                       backgroundColor: MyColors.white,
//                       child: IconButton(
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: MyColors.primaryColor,
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     top: 16,
//                     right: 16,
//                     child: Row(
//                       children: [
//                         ShareIconButton(
//                           backgroundColor: MyColors.white,
//                           icon: Icons.share_outlined,
//                           iconColor: MyColors.primaryColor,
//                           onPressed: () {},
//                         ),

//                         const SizedBox(width: 8),
//                         FavoriteIconButton(
//                           initialValue: false,
//                           onChanged: (value) {
//                             print("Favorite status: $value");
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Wings Tower",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "Thamel, Kathmandu",
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           "Rs. 30,000",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 16),

//                     const TabBar(
//                       labelColor: MyColors.dividerColor,
//                       tabs: [
//                         Tab(text: "Description"),
//                         Tab(text: "Gallery"),
//                         Tab(text: "Review"),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Column(
//                             children: [
//                               InfoCard(
//                                 iconPath: MyIcons.sqft,
//                                 value: '1,225 ',
//                                 unit: 'sqft',
//                                 borderColor: MyColors.backgroundColor,
//                               ),
//                             ],
//                           ),

//                           SizedBox(width: 10),
//                           Column(
//                             children: [
//                               InfoCard(
//                                 iconPath: MyIcons.kitchen,
//                                 value: '1 ',
//                                 unit: 'Kitchen',
//                                 borderColor: MyColors.backgroundColor,
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 10),
//                           Column(
//                             children: [
//                               InfoCard(
//                                 iconPath: MyIcons.bed,
//                                 value: '3',
//                                 unit: 'Bedrooms',
//                                 borderColor: MyColors.backgroundColor,
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 10),
//                           Column(
//                             children: [
//                               InfoCard(
//                                 iconPath: MyIcons.bathroom,
//                                 value: '1',
//                                 unit: 'Bathrooms',
//                                 borderColor: MyColors.backgroundColor,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: 16),
//                     Text(
//                       "Listings Agent",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: MyColors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 24,
//                           backgroundImage: AssetImage('MyAssets.sandeep'),
//                         ),
//                         const SizedBox(width: 12),
//                         const Expanded(
//                           child: Text(
//                             "Sandeep S.",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Image.asset(
//                             MyIcons.message,
//                             width: 24,
//                             height: 24,
//                           ),
//                         ),

//                         IconButton(
//                           onPressed: () {},
//                           icon: Image.asset(
//                             MyIcons.phone,
//                             width: 24,
//                             height: 24,
//                           ),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height:16),
//                          Text(
//                       "Facilities",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: MyColors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height:12),

//                     Wrap(
//                       spacing: 20,
//                       runSpacing: 20,
//                       alignment: WrapAlignment.spaceEvenly,
//                       children: const [
//                         _FacilityIcon(
//                           icon: Icons.local_parking,
//                           label: "Parking",
//                         ),
//                         _FacilityIcon(icon: Icons.wifi, label: "Wi-Fi"),
//                         _FacilityIcon(icon: Icons.kitchen, label: "Kitchen"),
//                         _FacilityIcon(icon: Icons.elevator, label: "Elevator"),
//                       ],
//                     ),

//                     const SizedBox(height: 30),

//                     // ClipRRect(
//                     //   borderRadius: BorderRadius.circular(12),
//                     //   child: Image.asset(
//                     //     'assets/images/map.png', // Replace with static map
//                     //     height: 160,
//                     //     width: double.infinity,
//                     //     fit: BoxFit.cover,
//                     //   ),
//                     // ),
//                     const SizedBox(height: 8),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "See on the map",
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ),

//                     const SizedBox(height: 24),
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

// class _FacilityIcon extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _FacilityIcon({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(icon, size: 30, color: Colors.black87),
//         const SizedBox(height: 6),
//         Text(label, style: const TextStyle(fontSize: 12)),
//       ],
//     );
//   }
// }













// import 'package:flutter/material.dart';

// import 'package:ghar_chaiyo/core/constants/my_assets.dart';
// import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/widget/aminities_nearby.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/widget/gallery.dart';

// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'widget/favourite_icon_button.dart';
// import 'widget/info_card.dart';
// import 'widget/share_icon_button.dart';

// class PropertyDescriptionPage extends StatelessWidget {
//   const PropertyDescriptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 25),
//                 Stack(
//                   children: [
//                     // SizedBox(height: 100),
//                     Image.asset(
//                       MyAssets.houseDetails,
//                       height: 369,
//                       width: 369,
//                       fit: BoxFit.cover,
//                     ),

//                     Positioned(
//                       top: 16,
//                       left: 16,
//                       child: CircleAvatar(
//                         backgroundColor: MyColors.white,
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.arrow_back,
//                             color: MyColors.primaryColor,
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),

//                     Positioned(
//                       top: 16,
//                       right: 16,
//                       child: Row(
//                         children: [
//                           ShareIconButton(
//                             backgroundColor: MyColors.white,
//                             icon: Icons.share_outlined,
//                             iconColor: MyColors.primaryColor,
//                             onPressed: () {},
//                           ),

//                           const SizedBox(width: 8),
//                           FavoriteIconButton(
//                             initialValue: false,
//                             onChanged: (value) {
//                               print("Favorite status: $value");
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           height: 19,
//                           width: 20,
//                           child: Icon(Icons.star, color: MyColors.yellow),
//                         ),
//                         SizedBox(width: 6),
//                         Text(
//                           "4.9  (6.8K Reviews)",
//                           style: TextStyle(
//                             fontSize: AppFontSizes.small,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),

//                     Container(
//                       decoration: BoxDecoration(color: MyColors.lightGray),
//                       height: 26,
//                       width: 87,
//                       child: Center(child: Text("Apartment")),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Wings Tower",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 "1BHK",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: AppFontSizes.small,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Image.asset(
//                                     MyIcons.sitemap,
//                                     height: 18,
//                                     width: 18,
//                                   ),
//                                   SizedBox(width: 10),
//                                   Text(
//                                     "Thamel, Kathmandu",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: AppFontSizes.extraSmall,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 12),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     height: 28,
//                                     width: 64,
//                                     child: ElevatedButton(
//                                       onPressed: () {},
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                             MyColors
//                                                 .elevatedButtonBackgroundColor,

//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                         padding: EdgeInsets.zero,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "Rent",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             color: MyColors.white,
//                                             fontSize: AppFontSizes.caption,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 12),
//                                   SizedBox(
//                                     height: 28,
//                                     width: 64,
//                                     child: ElevatedButton(
//                                       onPressed: () {},
//                                       style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                         padding:
//                                             EdgeInsets
//                                                 .zero, // Remove extra padding
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "Sale",
//                                           textAlign: TextAlign.center,

//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: AppFontSizes.caption,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Rs. 30,000",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "\\month",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: AppFontSizes.extraSmall,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),

//                       //  const SizedBox(height: 16,),
//                       const SizedBox(height: 16),

//                        TabBar(
//                         labelColor: MyColors.dividerColor,
//                         tabs: [
//                           Tab(text: "Description"),
//                           Tab(text: "Gallery",),
//                           Tab(text: "Review"),
//                         ],
//                       ),
//                       // TabBarView(children: [
//                       //   // Text("hello"),
//                       //   Text("hello"),
//                       //   Text("hello")
//                       // ]),
//                       const SizedBox(height: 16),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Column(
//                               children: [
//                                 InfoCard(
//                                   iconPath: MyIcons.sqft,
//                                   value: '1,225 ',
//                                   unit: 'sqft',
//                                   borderColor: MyColors.backgroundColor,
//                                 ),
//                               ],
//                             ),

//                             SizedBox(width: 10),
//                             Column(
//                               children: [
//                                 InfoCard(
//                                   iconPath: MyIcons.kitchen,
//                                   value: '1 ',
//                                   unit: 'Kitchen',
//                                   borderColor: MyColors.backgroundColor,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(width: 10),
//                             Column(
//                               children: [
//                                 InfoCard(
//                                   iconPath: MyIcons.bed,
//                                   value: '3 ',
//                                   unit: 'Bedrooms',
//                                   borderColor: MyColors.backgroundColor,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(width: 10),
//                             Column(
//                               children: [
//                                 InfoCard(
//                                   iconPath: MyIcons.bathroom,
//                                   value: '1',
//                                   unit: 'Bathrooms',
//                                   borderColor: MyColors.backgroundColor,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),

//                       SizedBox(height: 16),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Listings Agent",
//                           style: TextStyle(
//                             fontSize: AppFontSizes.normal,
//                             color: MyColors.black,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const CircleAvatar(
//                                 radius: 24,
//                                 backgroundImage: AssetImage(MyAssets.sandeep),
//                               ),
//                               const SizedBox(width: 12),
//                               Column(
//                                 children: [
//                                   Text(
//                                     "Sandeep S.",
//                                     style: TextStyle(
//                                       fontSize: AppFontSizes.small,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Partner",
//                                     style: TextStyle(
//                                       fontSize: AppFontSizes.extraSmall,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),

//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Image.asset(
//                                   MyIcons.message,
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                               ),

//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Image.asset(
//                                   MyIcons.phone,
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),

//                       SizedBox(height: 16),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Aminities Nearby",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: MyColors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                        AmenitiesNearby(),
//                       // Wrap(
//                       //   spacing: 20,
//                       //   runSpacing: 20,
//                       //   alignment: WrapAlignment.spaceEvenly,
//                       //   children: const [
//                       //     _FacilityIcon(
//                       //       icon: Icons.local_parking,
//                       //       label: "Parking",
//                       //     ),
//                       //     _FacilityIcon(icon: Icons.wifi, label: "Wi-Fi"),
//                       //     _FacilityIcon(icon: Icons.kitchen, label: "Kitchen"),
//                       //     _FacilityIcon(
//                       //       icon: Icons.elevator,
//                       //       label: "Elevator",
//                       //     ),
//                       //   ],
//                       // ),

//                       const SizedBox(height: 30),

//                       // ClipRRect(
//                       //   borderRadius: BorderRadius.circular(12),
//                       //   child: Image.asset(
//                       //     'assets/images/map.png', // Replace with static map
//                       //     height: 160,
//                       //     width: double.infinity,
//                       //     fit: BoxFit.cover,
//                       //   ),
//                       // ),
//                       const SizedBox(height: 8),
//                       Image.asset(MyAssets.map),
//                       SizedBox(height: 10,),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: InkWell(
//                           onTap: (){},
//                           child: const Text(
//                             "See on the map",
//                             style: TextStyle(color:MyColors.derik,fontSize: AppFontSizes.extraSmall,fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 24),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _FacilityIcon extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _FacilityIcon({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(icon, size: 30, color: Colors.black87),
//         const SizedBox(height: 6),
//         Text(label, style: const TextStyle(fontSize: 12)),
//       ],
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/core/constants/my_assets.dart';
// import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/widget/aminities_nearby.dart';

// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'widget/favourite_icon_button.dart';
// import 'widget/info_card.dart';
// import 'widget/share_icon_button.dart';

// class PropertyDescriptionPage extends StatefulWidget {
//   const PropertyDescriptionPage({super.key});

//   @override
//   State<PropertyDescriptionPage> createState() => _PropertyDescriptionPageState();
// }

// class _PropertyDescriptionPageState extends State<PropertyDescriptionPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(() {
//       setState(() {}); // Rebuild UI on tab change
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 25),
//               Stack(
//                 children: [
//                   Image.asset(
//                     MyAssets.houseDetails,
//                     height: 369,
//                     width: 369,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 16,
//                     left: 16,
//                     child: CircleAvatar(
//                       backgroundColor: MyColors.white,
//                       child: IconButton(
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: MyColors.primaryColor,
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 16,
//                     right: 16,
//                     child: Row(
//                       children: [
//                         ShareIconButton(
//                           backgroundColor: MyColors.white,
//                           icon: Icons.share_outlined,
//                           iconColor: MyColors.primaryColor,
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 8),
//                         FavoriteIconButton(
//                           initialValue: false,
//                           onChanged: (value) {
//                             print("Favorite status: $value");
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(
//                         height: 19,
//                         width: 20,
//                         child: Icon(Icons.star, color: MyColors.yellow),
//                       ),
//                       const SizedBox(width: 6),
//                       Text(
//                         "4.9  (6.8K Reviews)",
//                         style: TextStyle(
//                           fontSize: AppFontSizes.small,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     decoration: const BoxDecoration(color: MyColors.lightGray),
//                     height: 26,
//                     width: 87,
//                     child: const Center(child: Text("Apartment")),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               /// TAB BAR
//               TabBar(
//                 controller: _tabController,
//                 labelColor: MyColors.dividerColor,
//                 tabs: const [
//                   Tab(text: "Description"),
//                   Tab(text: "Gallery"),
//                   Tab(text: "Review"),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               /// CONDITIONAL CONTENT
//               if (_tabController.index == 0) _buildDescriptionContent()
//               else Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 60),
//                   child: Text(
//                     _tabController.index == 1
//                         ? "Gallery coming soon"
//                         : "No reviews yet",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDescriptionContent() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Wings Tower",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "1BHK",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                     fontSize: AppFontSizes.small,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Image.asset(MyIcons.sitemap, height: 18, width: 18),
//                     const SizedBox(width: 10),
//                     Text(
//                       "Thamel, Kathmandu",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: AppFontSizes.extraSmall,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     SizedBox(
//                       height: 28,
//                       width: 64,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: MyColors.elevatedButtonBackgroundColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           padding: EdgeInsets.zero,
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Rent",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: MyColors.white,
//                               fontSize: AppFontSizes.caption,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     SizedBox(
//                       height: 28,
//                       width: 64,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           padding: EdgeInsets.zero,
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Sale",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: AppFontSizes.caption,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 const Text(
//                   "Rs. 30,000",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "\\month",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: AppFontSizes.extraSmall,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               InfoCard(iconPath: MyIcons.sqft, value: '1,225 ', unit: 'sqft', borderColor: MyColors.backgroundColor),
//               const SizedBox(width: 10),
//               InfoCard(iconPath: MyIcons.kitchen, value: '1 ', unit: 'Kitchen', borderColor: MyColors.backgroundColor),
//               const SizedBox(width: 10),
//               InfoCard(iconPath: MyIcons.bed, value: '3 ', unit: 'Bedrooms', borderColor: MyColors.backgroundColor),
//               const SizedBox(width: 10),
//               InfoCard(iconPath: MyIcons.bathroom, value: '1', unit: 'Bathrooms', borderColor: MyColors.backgroundColor),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         const Text(
//           "Listings Agent",
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const CircleAvatar(radius: 24, backgroundImage: AssetImage(MyAssets.sandeep)),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Sandeep S.", style: TextStyle(fontWeight: FontWeight.w600)),
//                     Text("Partner", style: TextStyle(fontSize: AppFontSizes.extraSmall)),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 IconButton(onPressed: () {}, icon: Image.asset(MyIcons.message, width: 24, height: 24)),
//                 IconButton(onPressed: () {}, icon: Image.asset(MyIcons.phone, width: 24, height: 24)),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         const Text("Aminities Nearby", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 12),
//         const AmenitiesNearby(),
//         const SizedBox(height: 30),
//         Image.asset(MyAssets.map),
//         const SizedBox(height: 10),
//         const Align(
//           alignment: Alignment.bottomCenter,
//           child: Text(
//             "See on the map",
//             style: TextStyle(color: MyColors.derik, fontSize: AppFontSizes.extraSmall, fontWeight: FontWeight.w600),
//           ),
//         ),
//         const SizedBox(height: 24),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_assets.dart';
import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/widget/aminities_nearby.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_icons.dart';
import 'widget/favourite_icon_button.dart';
import 'widget/info_card.dart';
import 'widget/share_icon_button.dart';

class PropertyDescriptionPage extends StatefulWidget {
  const PropertyDescriptionPage({super.key});

  @override
  State<PropertyDescriptionPage> createState() => _PropertyDescriptionPageState();
}

class _PropertyDescriptionPageState extends State<PropertyDescriptionPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Stack(
                children: [
                  Image.asset(
                    MyAssets.houseDetails,
                    height: 369,
                    width: 369,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: MyColors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: MyColors.primaryColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: [
                        ShareIconButton(
                          backgroundColor: MyColors.white,
                          icon: Icons.share_outlined,
                          iconColor: MyColors.primaryColor,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 8),
                        FavoriteIconButton(
                          initialValue: false,
                          onChanged: (value) => print("Favorite status: \$value"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(height: 19, width: 20, child: Icon(Icons.star, color: MyColors.yellow)),
                      const SizedBox(width: 6),
                      Text("4.9  (6.8K Reviews)", style: TextStyle(fontSize: AppFontSizes.small, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Container(
                    height: 26,
                    width: 87,
                    decoration: const BoxDecoration(color: MyColors.lightGray),
                    child: const Center(child: Text("Apartment")),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Wings Tower", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text("1BHK", style: TextStyle(fontWeight: FontWeight.w800, fontSize: AppFontSizes.small)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(MyIcons.sitemap, height: 18, width: 18),
                          const SizedBox(width: 10),
                          Text("Budanilkantha, Kathmandu", style: TextStyle(color: Colors.grey, fontSize: AppFontSizes.extraSmall)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _buildActionButton("Rent", true),
                          const SizedBox(width: 12),
                          _buildActionButton("Buy", false),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Rs. 30,000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("/month", style: TextStyle(fontSize: AppFontSizes.extraSmall)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TabBar(
                controller: _tabController,
                labelColor: MyColors.primaryColor,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "Description"),
                  Tab(text: "Gallery"),
                  Tab(text: "Review"),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildDescriptionContent(),
                    _buildGalleryView(),
                    _buildReviewView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, bool filled) {
    return SizedBox(
      height: 28,
      width: 64,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? MyColors.elevatedButtonBackgroundColor : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppFontSizes.caption,
            fontWeight: filled ? FontWeight.w700 : FontWeight.w500,
            color: filled ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InfoCard(iconPath: MyIcons.sqft, value: '1,225 ', unit: 'sqft', borderColor: MyColors.backgroundColor),
                const SizedBox(width: 10),
                InfoCard(iconPath: MyIcons.kitchen, value: '1', unit: 'Kitchen', borderColor: MyColors.backgroundColor),
                const SizedBox(width: 10),
                InfoCard(iconPath: MyIcons.bed, value: '3 ', unit: 'Bedrooms', borderColor: MyColors.backgroundColor),
                const SizedBox(width: 10),
                InfoCard(iconPath: MyIcons.bathroom, value: '1', unit: 'Bathrooms', borderColor: MyColors.backgroundColor),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text("Listings Agent", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24, backgroundImage: AssetImage(MyAssets.sandeep)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Sandeep S.", style: TextStyle(fontWeight: FontWeight.w600)),
                      Text("Partner", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Image.asset(MyIcons.message, width: 24, height: 24)),
                  IconButton(onPressed: () {}, icon: Image.asset(MyIcons.phone, width: 24, height: 24)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text("Aminities Nearby", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const AmenitiesNearby(),
          const SizedBox(height: 30),
          Image.asset(MyAssets.map),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text("See on the map", style: TextStyle(color: MyColors.derik, fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  // Widget _buildGalleryView() {
  //   final images = [
  //     MyAssets.house,
  //     MyAssets.house,
  //     MyAssets.house,
  //     MyAssets.house,
  //   ];

  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: images.map((path) {
  //         return Container(
  //           margin: const EdgeInsets.only(right: 10),
  //           width: 120,
  //           height: 100,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             image: DecorationImage(
  //               image: AssetImage(path),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }
  Widget _buildGalleryView() {
  final images = [
    MyAssets.house,
    MyAssets.house,
    MyAssets.house,
    MyAssets.house,
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: images.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.2, // Adjust for desired height/width
    ),
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(images[index]),
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}


  Widget _buildReviewView() {
    final reviews = [
      {
        "name": "Anita P.",
        "text": "Sam was fantastic! The car was clean, the ride was smooth, and he even helped me with my luggage. Highly recommend!",
        "rating": 5
      },
      {
        "name": "Karan B",
        "text": "Decent ride. Sam got me to my destination fine, but there was a bit of confusion at pickup.",
        "rating": 4
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: reviews.map((review) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.only(bottom: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
            ),
            child: Column(
              children:[ Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(review["rating"] as int, (index) {
                      return const Icon(Icons.star, size: 16, color: Colors.amber);
                    }),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    review["name"].toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  
                ],
              ),
              SizedBox(height: 10,),
              Text(
                  review["text"].toString(),
                  style: const TextStyle(fontSize: 13),
                ),],
              
            ),
          );
        }).toList(),
      ),
    );
  }
}