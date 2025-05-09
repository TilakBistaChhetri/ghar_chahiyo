// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/core/constants/my_icons.dart';

// import '../../../../core/constants/my_colors.dart';
// import '../home/widget/property_card.dart';
// import 'widgets/filter_sheet.dart';

// class ActivityPage extends StatelessWidget {
//   const ActivityPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.white,

//         title: const Text(
//           'Activity',
//           style: TextStyle(
//             fontSize: 20,
//             color: MyColors.dividerColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                 ),
//                 builder: (context) => const FilterSheet(),
//               );
//             },
//             icon: Image.asset(MyIcons.filter, width: 16, height: 16),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           SizedBox(height:3),
//           Text("Today"),
//           ListView.builder(

//             padding: const EdgeInsets.all(8),
//             itemCount: 5,
//             itemBuilder:
//                 (context, index) => PropertyCard(
//                   imagePath: 'assets/images/house.png',
//                   name: "Suncity Apartment",
//                   price: 'Rs. 1,50,000',
//                   area: '1800sqft',
//                   bedrooms: 2,
//                   bathrooms: 1,
//                   type: 'Villa',
//                   location: 'Kathmandu, Nepal',
//                   onPhoneTap: () => print('Phone tapped for item $index'),
//                   onAgentTap: () => print('Call Agent tapped for item $index'),
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_icons.dart';
import '../../../../core/constants/my_colors.dart';
import '../home/widget/property_card.dart';
import 'widgets/filter_sheet.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: const Text(
          'Activity',
          style: TextStyle(
            fontSize: 20,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) => const FilterSheet(),
              );
            },
            icon: Image.asset(MyIcons.filter, width: 16, height: 16),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 3),

          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                "Today",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 7,
              itemBuilder: (context, index) {
                if (index == 2) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      "Yesterday",
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else if (index == 4) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      "Order Activities",
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return PropertyCard(
                    imagePath: 'assets/images/house.png',
                    name: "Suncity Apartment",
                    price: 'Rs. 1,50,000',
                    area: '1800sqft',
                    bedrooms: 2,
                    bathrooms: 1,
                    type: 'Villa',
                    location: 'Kathmandu, Nepal',
                    onPhoneTap: () => print('Phone tapped for item $index'),
                    onAgentTap:
                        () => print('Call Agent tapped for item $index'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
