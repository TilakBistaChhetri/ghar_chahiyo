// import 'package:flutter/material.dart';

// import '../../../../core/constants/my_colors.dart';
// import 'widgets/side_bar_menu_item.dart';


// class SettingPage extends StatelessWidget {
//   const SettingPage({super.key});
//     bool isPushNotificationsEnabled = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       body: Column(
//         children: [
//           SizedBox(height: 12),
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text('Push Notifications'),
//               trailing: Switch(
//                 value: isPushNotificationsEnabled,
//                 onChanged: (bool value) {
//                   setState(() {
//                     isPushNotificationsEnabled = value;
//                   });
//                 },
//               ),
//             ),
//           const SidebarMenuItem(
//             title: 'About',
//             // destination: MyDashboardPage(),
//           ),
//           SizedBox(height: 20),
//           const SidebarMenuItem(
//             title: 'History',
//             // destination: MyDashboardPage(),
//           ),
//           SizedBox(height: 20),
//           const SidebarMenuItem(
//             title: 'Saved Search',
//             // destination: MyDashboardPage(),
//           ),
//           SizedBox(height: 20),
//           const SidebarMenuItem(
//             title: 'Contact Us',
//             // destination: MyDashboardPage(),
//           ),
//           SizedBox(height: 20),
//           const SidebarMenuItem(
//             title: 'Shared the App',
//             // destination: MyDashboardPage(),
//           ),
//           SizedBox(height: 20),
//           const SidebarMenuItem(
//             title: 'Terms & Condition',
//             // destination: MyDashboardPage(),
//           ),
//           SizedBox(height: 20),
//           const SidebarMenuItem(
//             title: 'Delete Account',
//             // destination: MyDashboardPage(),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import 'widgets/side_bar_menu_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isPushNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: MyColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
               SizedBox(height:12),
              ListTile(
              
                title: const Text('Push Notifications'),
                trailing: Switch(
                  value: isPushNotificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isPushNotificationsEnabled = value;
                    });
                  },
                ),
              ),
              SizedBox(height:20),
               const SidebarMenuItem(
              title: 'About',
              // destination: MyDashboardPage(),
            ),
            SizedBox(height: 20),
            const SidebarMenuItem(
              title: 'History',
              // destination: MyDashboardPage(),
            ),
            SizedBox(height: 20),
            const SidebarMenuItem(
              title: 'Saved Search',
              // destination: MyDashboardPage(),
            ),
            SizedBox(height: 20),
            const SidebarMenuItem(
              title: 'Contact Us',
              // destination: MyDashboardPage(),
            ),
            SizedBox(height: 20),
            const SidebarMenuItem(
              title: 'Shared the App',
              // destination: MyDashboardPage(),
            ),
            SizedBox(height: 20),
            const SidebarMenuItem(
              title: 'Terms & Condition',
              // destination: MyDashboardPage(),
            ),
            SizedBox(height: 20),
            const SidebarMenuItem(
              title: 'Delete Account',
              // destination: MyDashboardPage(),
            ),
            ],
          ),
      ),
      
    );
  }
}
