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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

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
                  child: Icon(item['icon'], color: MyColors.primaryColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['message'],
                        style: const TextStyle(fontSize: 11),
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




















// import 'package:flutter/material.dart';

// import '../../../../data/data_sources/local/notification_data_source.dart';
// import '../../../../data/repository/notification_repository.dart';
// import '../../../../domain/usecases/notification_usecases.dart';

// class NotificationPage extends StatefulWidget {
//   const NotificationPage({super.key});

//   @override
//   _NotificationPageState createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   bool _isLoading = false;
//   List<Notification> _notifications = [];

//   final NotificationUseCase _getNotificationsUseCase = GetNotificationsUseCase(
//     NotificationRepositoryImpl(
//       localDataSource: NotificationLocalDataSourceImpl(),
//     ),
//   );

//   @override
//   void initState() {
//     super.initState();
//     _fetchNotifications();
//   }

//   Future<void> _fetchNotifications() async {
//     setState(() {
//       _isLoading = true;
//     });
    
//     try {
//       final notifications = await _getNotificationsUseCase.getNotifications();
//       setState(() {
//         _notifications = notifications;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       // Handle the error if needed
//     }
//   }

//   // Function to map icon names to IconData
//   IconData _getIcon(String iconName) {
//     switch (iconName) {
//       case 'new_releases':
//         return Icons.new_releases;
//       case 'local_offer':
//         return Icons.local_offer;
//       case 'star':
//         return Icons.star;
//       default:
//         return Icons.notifications; // Default icon
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('Notifications'),
//         centerTitle: true,
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: _notifications.length,
//               itemBuilder: (context, index) {
//                 final item = _notifications[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.grey[200],
//                         child: Icon(_getIcon(item.icon), color: Colors.blue), // Use the mapped icon
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               item.title,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               item.message,
//                               style: const TextStyle(fontSize: 11),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         item.time,
//                         style: const TextStyle(fontSize: 12, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
