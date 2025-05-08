// import 'package:flutter/material.dart';

// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'widgets/filter_sheet.dart';

// class ActivityPage extends StatelessWidget {
//   const ActivityPage({super.key});

//   final List<Map<String, dynamic>> notifications = const [
//     {
//       'section': 'Today',
//       'items': [
//         {
//           'title': 'New Property updated',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//         {
//           'title': 'Exclusive Offers Inside',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//         {
//           'title': 'Property Review Request',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//       ],
//     },
//     {
//       'section': 'Yesterday',
//       'items': [
//         {
//           'title': 'New Property updated',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//         {
//           'title': 'Exclusive Offers Inside',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//         {
//           'title': 'Property Review Request',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//       ],
//     },
//     {
//       'section': 'Older Notification',
//       'items': [
//         {
//           'title': 'New Property updated',
//           'message':
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
//           'time': '1hr ago',
//         },
//       ],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.backgroundColor,
//       appBar: AppBar(
//         backgroundColor: MyColors.backgroundColor,

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
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: notifications.length,
//         itemBuilder: (context, sectionIndex) {
//           final section = notifications[sectionIndex];
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 section['section'],
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               ...List.generate(section['items'].length, (index) {
//                 final item = section['items'][index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               item['title'],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             item['time'],
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Text(item['message']),
//                     ],
//                   ),
//                 );
//               }),
//               const SizedBox(height: 20),
//             ],
//           );
//         },
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
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder:
            (context, index) => PropertyCard(
              imagePath: 'assets/images/house.png',
              price: 'Rs. 1,50,000',
              area: '1800sqft',
              bedrooms: 2,
              bathrooms: 1,
              type: 'Villa',
              location: 'Kathmandu, Nepal',
              onPhoneTap: () => print('Phone tapped for item $index'),
              onAgentTap: () => print('Call Agent tapped for item $index'),
            ),
      ),
    );
  }
}
