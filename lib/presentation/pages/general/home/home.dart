// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/notification_page.dart';

// import '../../../../core/constants/my_assets.dart';
// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'home_interiors.dart';
// import 'home_loan.dart';
// import 'property_evaluation.dart';
// import 'site_listings.dart';
// import 'site_map.dart';
// import 'widget/icon_menu_item.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.backgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     //Image.asset(MyIcons.menu, width: 24, height: 24),
//                      InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NotificationPage(),
//                           ),
//                         );
//                       },
//                       child: Image.asset(
//                         MyIcons.menu,
//                         width: 24,
//                         height: 24,
//                       ),
//                     ),

//                     Image.asset(
//                       MyAssets.Logo,
//                       height: 42,
//                       width: 42,
//                       fit: BoxFit.contain,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NotificationPage(),
//                           ),
//                         );
//                       },
//                       child: Image.asset(
//                         MyIcons.notification,
//                         width: 20,
//                         height: 20,
//                       ),
//                     ),

//                     // Image.asset(
//                     //   MyIcons.notification,
//                     //   width: 20,
//                     //   height: 20,
//                     // ),

//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(32),
//                     border: Border.all(color: MyColors.secondaryColor),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search, color: Colors.black54),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Search',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 13),

//                 SizedBox(
//                   height: 105,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       IconMenuItem(
//                         iconPath: MyIcons.Property,
//                         label: 'Property \n Valuation',

//                         onTap: () {
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=>   PropertyEvaluationPage()));
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.homeloan,
//                         label: 'Home \n Loan',
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLoanPage()));
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.homeiteriors,
//                         label: 'Home \n Interiors',
//                         onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeInteriorsPage()));
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.sitemap,
//                         label: 'Site \n Map',
//                         onTap: () {

//                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SiteMapPage()));

//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.sitelist,
//                         label: 'Site\nListings',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SiteListingPage(),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 24),
//                 const Divider(color: MyColors.dividerColor, thickness: 5),
//                 SizedBox(height: 24),

//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: MyColors.backgroundColor,
//                     border: Border.all(
//                       color: const Color.fromARGB(255, 248, 244, 244),
//                     ),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "What type of Property are you looking for?",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: MyColors.textColor,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       InkWell(
//                         onTap: () {},
//                         child: const Text(
//                           "Share Requirements",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: MyColors.textColor,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 const Divider(color: MyColors.dividerColor, thickness: 5),
//                 SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/notification_page.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/widget/listing_property_card.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/widget/new_project_card.dart';

// import '../../../../core/constants/my_assets.dart';
// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'home_interiors.dart';
// import 'home_loan.dart' show HomeLoanPage;
// import 'property_evaluation.dart';
// import 'site_listings.dart';
// import 'site_map.dart';
// import 'widget/icon_menu_item.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _listingTopLocalityScroll = ScrollController();

//   List<String> topLocalities = [
//     "Banwshwor",
//     "Budhanilkantha",
//     "Kalanki",
//     "Satdobato",
//     "Tikathlali",
//     "Koteshwor",
//   ];

//   String selectedLocation = "Baneshwor";
//   void _toggleLocation(String item) {
//     setState(() {
//       selectedLocation = item;
//       _listingTopLocalityScroll.animateTo(
//         0.0,
//         duration: Duration(microseconds: 300),
//         curve: Curves.elasticInOut,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.backgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [

//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NotificationPage(),
//                           ),
//                         );
//                       },
//                       child: Image.asset(MyIcons.menu, width: 24, height: 24),
//                     ),

//                     Image.asset(
//                       MyAssets.Logo,
//                       height: 42,
//                       width: 42,
//                       fit: BoxFit.contain,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NotificationPage(),
//                           ),
//                         );
//                       },
//                       child: Image.asset(
//                         MyIcons.notification,
//                         width: 20,
//                         height: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(32),
//                     border: Border.all(color: MyColors.secondaryColor),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search, color: Colors.black54),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Search',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 13),

//                 SizedBox(
//                   height: 100,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       IconMenuItem(
//                         iconPath: MyIcons.Property,
//                         label: 'Property \n Valuation',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => PropertyEvaluationPage(),
//                             ),
//                           );
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.homeloan,

//                         label: 'Home \n Loan',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomeLoanPage(),
//                             ),
//                           );
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.homeiteriors,
//                         label: 'Home \n Interiors',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomeInteriorsPage(),
//                             ),
//                           );
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.sitemap,
//                         label: 'Site \n Map',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SiteMapPage(),
//                             ),
//                           );
//                         },
//                       ),
//                       IconMenuItem(
//                         iconPath: MyIcons.sitelist,
//                         label: 'Site\nListings',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SiteListingPage(),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 24),
//                 const Divider(color: MyColors.dividerColor, thickness: 5),
//                 SizedBox(height: 24),

//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: MyColors.backgroundColor,
//                     border: Border.all(
//                       color: const Color.fromARGB(255, 248, 244, 244),
//                     ),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "What type of Property are you looking for?",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: MyColors.textColor,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       InkWell(
//                         onTap: () {},
//                         child: const Text(
//                           "Share Requirements",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: MyColors.textColor,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 const Divider(color: MyColors.dividerColor, thickness: 5),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "New Listings",
//                       style: TextStyle(
//                         fontSize: AppFontSizes.title,
//                         fontWeight: FontWeight.bold,
//                         color: MyColors.primaryColor,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Text(
//                         "See all",
//                         style: TextStyle(
//                           fontSize: AppFontSizes.extraSmall,
//                           color: MyColors.primaryColor,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24),

//                 SizedBox(
//                   height: 255,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       ListingPropertyCard(),
//                       ListingPropertyCard(),
//                       ListingPropertyCard(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 const Divider(color: MyColors.dividerColor, thickness: 5),
//                 SizedBox(height: 24),
//                 Text(
//                   "Top Localities",
//                   style: TextStyle(
//                     fontSize: AppFontSizes.title,
//                     fontWeight: FontWeight.bold,
//                     color: MyColors.primaryColor,
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 SizedBox(
//                   height: 30,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,

//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,

//                       children:
//                           topLocalities.map((item) {
//                             // return Text(item);
//                             bool isTopLocalitySelected =
//                                 item == selectedLocation;
//                             return Container(
//                               margin: EdgeInsets.all(1),
//                               height: 38,
//                               decoration: BoxDecoration(
//                                 color:
//                                     (isTopLocalitySelected)
//                                         ? MyColors.gray
//                                         : Colors.transparent,
//                               ),
//                               child: TextButton(
//                                 style: ButtonStyle(
//                                   splashFactory: NoSplash.splashFactory,
//                                 ),
//                                 onPressed: () {
//                                   _toggleLocation(item);
//                                 },

//                                 child: Text(
//                                   item,
//                                   style: TextStyle(
//                                     fontSize: AppFontSizes.small,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 SizedBox(
//                   height: 255,
//                   child: ListView(
//                     controller: _listingTopLocalityScroll,
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       ListingPropertyCard(),
//                       ListingPropertyCard(),
//                       ListingPropertyCard(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Text(
//                   "See all",
//                   style: TextStyle(
//                     fontSize: AppFontSizes.extraSmall,
//                     color: MyColors.primaryColor,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),

//                 SizedBox(height: 12),
//                 const Divider(color: MyColors.dividerColor, thickness: 5),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "View New Projects In Your Location",
//                       style: TextStyle(
//                         fontSize: AppFontSizes.small,
//                         fontWeight: FontWeight.w500,
//                         color: MyColors.textColor,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Text(
//                         "View All",
//                         style: TextStyle(
//                           fontSize: AppFontSizes.extraSmall,
//                           fontWeight: FontWeight.w500,
//                           color: MyColors.textColor,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 12),

//                 SizedBox(
//                   height: 110,
//                   child: ListView(
//                     controller: _listingTopLocalityScroll,
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       NewProjectCard(
//                         image: MyAssets.house,
//                         location: "Budhanilkantha",
//                         district: "Kathmandu",
//                         price: "Rs.2.5L-Rs.5L",
//                       ),
//                       NewProjectCard(
//                         image: MyAssets.house,
//                         location: "Budhanilkantha",
//                         district: "Kathmandu",
//                         price: "Rs.2.5L-Rs.5L",
//                       ),
//                       NewProjectCard(
//                         image: MyAssets.house,
//                         location: "Budhanilkantha",
//                         district: "Kathmandu",
//                         price: "Rs.2.5L-Rs.5L",
//                       ),
//                       NewProjectCard(
//                         image: MyAssets.house,
//                         location: "Budhanilkantha",
//                         district: "Kathmandu",
//                         price: "Rs.2.5L-Rs.5L",
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/notification_page.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/widget/listing_property_card.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/widget/new_project_card.dart';

import '../../../../core/constants/my_assets.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_icons.dart';
import 'home_interiors.dart';
import 'home_loan.dart';
import 'property_evaluation.dart';
import 'site_listings.dart';
import 'site_map.dart';
import 'widget/icon_menu_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _listingTopLocalityScroll = ScrollController();

  List<String> topLocalities = [
    "Banwshwor",
    "Budhanilkantha",
    "Kalanki",
    "Satdobato",
    "Tikathlali",
    "Koteshwor",
  ];

  String selectedLocation = "Baneshwor";
  void _toggleLocation(String item) {
    setState(() {
      selectedLocation = item;
      _listingTopLocalityScroll.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => NotificationPage(),
                    //       ),
                    //     );
                    //   },
                    //   child: Image.asset(MyIcons.menu, width: 24, height: 24),
                    // ),
                    Image.asset(MyAssets.Logo, height: 42, width: 42),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        MyIcons.notification,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: MyColors.secondaryColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black54),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                SizedBox(
                  height: screenHeight * 0.13,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      IconMenuItem(
                        iconPath: MyIcons.Property,
                        label: 'Property \n Valuation',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PropertyEvaluationPage(),
                            ),
                          );
                        },
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.homeloan,

                        label: 'Home \n Loan',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeLoanPage(),
                            ),
                          );
                        },
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.homeiteriors,
                        label: 'Home \n Interiors',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeInteriorsPage(),
                            ),
                          );
                        },
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.sitemap,
                        label: 'Site \n Map',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SiteMapPage(),
                            ),
                          );
                        },
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.sitelist,
                        label: 'Site\nListings',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SiteListingPage(),
                            ),
                          );
                        },
                      ),

                      // IconMenuItem(
                      //   iconPath: MyIcons.Property,
                      //   label: 'Property \n Valuation',
                      //   onTap: () {},
                      // ),
                      // IconMenuItem(
                      //   iconPath: MyIcons.homeloan,
                      //   label: 'Home \n Loan',
                      //   onTap: () {},
                      // ),
                      // IconMenuItem(
                      //   iconPath: MyIcons.homeiteriors,
                      //   label: 'Home \n Interiors',
                      //   onTap: () {},
                      // ),
                      // IconMenuItem(
                      //   iconPath: MyIcons.sitemap,
                      //   label: 'Site \n Map',
                      //   onTap: () {},
                      // ),
                      // IconMenuItem(
                      //   iconPath: MyIcons.sitelist,
                      //   label: 'Site\nListings',
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SiteListingPage(),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: MyColors.dividerColor, thickness: 5),
                const SizedBox(height: 24),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    border: Border.all(
                      color: const Color.fromARGB(255, 248, 244, 244),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What type of Property are you looking for?",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                          color: MyColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Share Requirements",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.textColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: MyColors.dividerColor, thickness: 5),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Listings",
                      style: TextStyle(
                        fontSize: AppFontSizes.title,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryColor,
                      ),
                    ),
                    // Text(
                    //   "See all",
                    //   style: TextStyle(
                    //     fontSize: AppFontSizes.extraSmall,
                    //     color: MyColors.primaryColor,
                    //     decoration: TextDecoration.underline,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: screenHeight * 0.35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ListingPropertyCard(),
                      ListingPropertyCard(),
                      ListingPropertyCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(color: MyColors.dividerColor, thickness: 5),
                const SizedBox(height: 24),
                Text(
                  "Top Localities",
                  style: TextStyle(
                    fontSize: AppFontSizes.title,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 38,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          topLocalities.map((item) {
                            bool isTopLocalitySelected =
                                item == selectedLocation;
                            return Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color:
                                    isTopLocalitySelected
                                        ? MyColors.gray
                                        : Colors.transparent,
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                onPressed: () => _toggleLocation(item),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: AppFontSizes.small,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: screenHeight * 0.35,
                  child: ListView(
                    controller: _listingTopLocalityScroll,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ListingPropertyCard(),
                      ListingPropertyCard(),
                      ListingPropertyCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Text(
                //   "See all",
                //   style: TextStyle(
                //     fontSize: AppFontSizes.extraSmall,
                //     color: MyColors.primaryColor,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),
                const SizedBox(height: 12),
                const Divider(color: MyColors.dividerColor, thickness: 5),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "View New Projects In Your Location",
                      style: TextStyle(
                        fontSize: AppFontSizes.small,
                        fontWeight: FontWeight.w500,
                        color: MyColors.textColor,
                      ),
                    ),
                    // Text(
                    //   "View All",
                    //   style: TextStyle(
                    //     fontSize: AppFontSizes.extraSmall,
                    //     fontWeight: FontWeight.w500,
                    //     color: MyColors.textColor,
                    //     decoration: TextDecoration.underline,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: screenHeight * 0.18,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      NewProjectCard(
                        image: MyAssets.house,
                        location: "Budhanilkantha",
                        district: "Kathmandu",
                        price: "Rs.2.5L-Rs.5L",
                      ),
                      NewProjectCard(
                        image: MyAssets.house,
                        location: "Budhanilkantha",
                        district: "Kathmandu",
                        price: "Rs.2.5L-Rs.5L",
                      ),
                      NewProjectCard(
                        image: MyAssets.house,
                        location: "Budhanilkantha",
                        district: "Kathmandu",
                        price: "Rs.2.5L-Rs.5L",
                      ),
                      NewProjectCard(
                        image: MyAssets.house,
                        location: "Budhanilkantha",
                        district: "Kathmandu",
                        price: "Rs.2.5L-Rs.5L",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
