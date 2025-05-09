// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/account/about_us.dart';
// import '../../../../core/constants/my_colors.dart';
// import '../../../../core/constants/my_fonts.dart';
// import '../../../../core/constants/my_icons.dart';
// import 'contact_us.dart';
// import 'history.dart';
// import 'widgets/side_bar_menu_item.dart';

// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});

//   @override
//   _SettingPageState createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   bool isPushNotificationsEnabled = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Settings',
//           style: TextStyle(
//             fontSize: 20,
//             color: MyColors.dividerColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 12),
//             ListTile(
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
//             const SizedBox(height: 10),
//             const SidebarMenuItem(title: 'About', destination: AboutUsPage()),
//             const SizedBox(height: 10),
//             SidebarMenuItem(title: 'History', destination: HistoryPage()),
//             const SizedBox(height: 10),
//             SidebarMenuItem(title: 'Contact Us', destination: ContactUsPage()),
//             const SizedBox(height: 10),
//             const SidebarMenuItem(title: 'Shared the App'),
//             const SizedBox(height: 10),
//             const SidebarMenuItem(title: 'Terms & Condition'),
//             const SizedBox(height: 10),

//             SidebarMenuItem(
//               title: 'Delete Account',
//               textColor: MyColors.red,
//               onTap: () => _showDeleteConfirmationDialog(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showDeleteConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder:
//           (_) => AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             title: const Text(
//               'Delete Account',
//               style: TextStyle(
//                 color: MyColors.red,
//                 fontWeight: FontWeight.bold,
//                 fontSize: AppFontSizes.medium,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             content: const Text(
//               'Are you sure you want to delete this account?',
//               style: TextStyle(
//                 color: MyColors.primaryColor,
//                 fontSize: AppFontSizes.normal,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             actionsAlignment: MainAxisAlignment.spaceEvenly,
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: MyColors.backgroundColor,
//                   foregroundColor: MyColors.black,
//                   side: BorderSide(color: MyColors.black),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(55),
//                   ),
//                 ),
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.small,
//                     color: MyColors.primaryColor,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _showAccountDeletedDialog(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: MyColors.primaryColor,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(55),
//                   ),
//                 ),
//                 child: const Text(
//                   'Delete',
//                   style: TextStyle(
//                     fontSize: AppFontSizes.small,
//                     color: MyColors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//     );
//   }

//   void _showAccountDeletedDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder:
//           (_) => AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(MyIcons.delete, height: 56, width: 48),
//                 const SizedBox(height: 16),
//                 const Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Your Account has been ',
//                         style: TextStyle(
//                           fontSize: AppFontSizes.normal,
//                           color: MyColors.primaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Deleted!!',
//                         style: TextStyle(
//                           fontSize: AppFontSizes.normal,
//                           color: MyColors.red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/presentation/pages/general/account/about_us.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_fonts.dart';
import '../../../../core/constants/my_icons.dart';
import 'history.dart';
import 'termsconditon.dart';
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
          onPressed: () => Navigator.pop(context),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
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
            const SizedBox(height: 10),
            const SidebarMenuItem(title: 'About', destination: AboutUsPage()),
            const SizedBox(height: 10),
            SidebarMenuItem(title: 'History', destination: HistoryPage()),
            const SizedBox(height: 10),
            SidebarMenuItem(
              title: 'Share the App',
              onTap: () => _showShareDialog(context),
            ),
            const SizedBox(height: 10),
            const SidebarMenuItem(title: 'Terms & Condition', destination: TermsconditonPage()),
            const SizedBox(height: 10),
            SidebarMenuItem(
              title: 'Delete Account',
              textColor: MyColors.red,
              onTap: () => _showDeleteConfirmationDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Share the App',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(Icons.link, 'Copy Link'),
                 // _buildShareOption(Icons.whatsapp, 'Whatsapp'),
                  _buildShareOption(Icons.facebook, 'Facebook'),
                  _buildShareOption(Icons.share, 'Twitter'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                      
                        Navigator.pop(context);
                      },
                      child: const Text('Share'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Delete Account',
          style: TextStyle(
            color: MyColors.red,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSizes.medium,
          ),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Are you sure you want to delete this account?',
          style: TextStyle(
            color: MyColors.primaryColor,
            fontSize: AppFontSizes.normal,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.backgroundColor,
              foregroundColor: MyColors.black,
              side: BorderSide(color: MyColors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: AppFontSizes.small,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showAccountDeletedDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
            ),
            child: const Text(
              'Delete',
              style: TextStyle(
                fontSize: AppFontSizes.small,
                color: MyColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAccountDeletedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(MyIcons.delete, height: 56, width: 48),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Your Account has been ',
                    style: TextStyle(
                      fontSize: AppFontSizes.normal,
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Deleted!!',
                    style: TextStyle(
                      fontSize: AppFontSizes.normal,
                      color: MyColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
