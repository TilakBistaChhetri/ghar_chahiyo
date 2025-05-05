import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_icons.dart';
import '../activity/widgets/filter_sheet.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      'icon': Icons.new_releases,
      'title': 'New Property updated',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
    {
      'icon': Icons.local_offer,
      'title': 'Exclusive Offers Inside',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
    {
      'icon': Icons.star,
      'title': 'Property Review Request',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
    {
      'icon': Icons.new_releases,
      'title': 'New Property updated',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
    {
      'icon': Icons.local_offer,
      'title': 'Exclusive Offers Inside',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
    {
      'icon': Icons.star,
      'title': 'Property Review Request',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
    {
      'icon': Icons.new_releases,
      'title': 'New Property updated',
      'message':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '1hr ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,

        title: const Text(
          'Notification',
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
      // appBar: AppBar(
      //   leading: const Icon(Icons.arrow_back, color: Colors.black),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: const Text(
      //     'Notification',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 16),
      //       child: Icon(Icons.more_vert, color: Colors.black),
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(item['icon'], color: Colors.indigo[900]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['message'],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item['time'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
