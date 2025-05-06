import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/presentation/pages/general/account/log_out.dart';
import '../../../../core/constants/my_colors.dart';

import '../home/notification_page.dart';
import 'help_support.dart';
import 'legal.dart';
import 'my_dashboard.dart';

import 'personal_information.dart';
import 'privacy_policy.dart';
import 'settings.dart';
import 'widgets/side_bar_menu_item.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 173,
              width: 393,
              color: MyColors.primaryColor,
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const CircleAvatar(radius: 40),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome, Sam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'sam123@gmail.com',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '+977 982135468',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            const SidebarMenuItem(title: 'My Dashboard', destination: MyDashboardPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Personational Information', destination:PersonalInformationPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Settings', destination: SettingPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Notifications', destination: NotificationPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Privacy Policy', destination: PrivacyPolicyPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Legal', destination: LegalPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Help & Support', destination: HelpSupportPage()),
              SizedBox(height: 20),
            const SidebarMenuItem(title: 'Log Out', destination: LogOutPage()),
         
        
        
        
            // Expanded(
            //   child: ListView(
            //     children: [
            //       buildListTile(context, 'My Dashboard', const MyDashboardPage()),
            //       buildListTile(
            //         context,
            //         'Personal Information',
            //          PersonalInformationPage(),
            //       ),
            //       buildListTile(context, 'Favorites', const FavouritePage()),
            //       buildListTile(context, 'Settings', const SettingPage()),
            //       buildListTile(
            //         context,
            //         'Notifications',
            //         const NotificationPage(),
            //       ),
            //       buildListTile(
            //         context,
            //         'Privacy Policy',
            //         const PrivacyPolicyPage(),
            //       ),
            //       buildListTile(context, 'Legal', const LegalPage()),
            //       buildListTile(
            //         context,
            //         'Help & Support',
            //         const HelpSupportPage(),
            //       ),
            //       ListTile(
            //         title: const Text(
            //           'Log Out',
            //           style: TextStyle(color: Colors.red),
            //         ),
            //         onTap: () {
            //           // Add log out logic here
            //           Navigator.pop(context);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(
    BuildContext context,
    String title,
    Widget destinationPage,
  ) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }
}
