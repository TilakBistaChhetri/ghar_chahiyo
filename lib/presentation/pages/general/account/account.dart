// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/account/log_out.dart';
// import '../../../../core/constants/my_colors.dart';

// import '../home/notification_page.dart';
// import 'help_support.dart';
// import 'legal.dart';
// import 'my_dashboard.dart';

// import 'personal_information.dart';
// import 'privacy_policy.dart';
// import 'settings.dart';
// import 'widgets/side_bar_menu_item.dart';

// class AccountPage extends StatelessWidget {
//   const AccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 173,
//               width: 393,
//               color: MyColors.primaryColor,
//               //color:Colors.red,
//               padding: const EdgeInsets.only(top: 60, bottom: 20),
//               child: Row(
//                 children: [
//                   const SizedBox(width: 20),
//                   const CircleAvatar(radius: 40),
//                   const SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Welcome, Sam',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       const Text(
//                         'sam123@gmail.com',
//                         style: TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                       const SizedBox(height: 5),
//                       const Text(
//                         '+977 982135468',
//                         style: TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 8),
//             const SidebarMenuItem(
//               title: 'My Dashboard',
//               destination: MyDashboardPage(),
//             ),
//             SizedBox(height: 20),
//             const SidebarMenuItem(
//               title: 'Personational Information',
//               destination: PersonalInformationPage(),
//             ),
//             SizedBox(height: 20),
//             const SidebarMenuItem(
//               title: 'Settings',
//               destination: SettingPage(),
//             ),
//             SizedBox(height: 20),
//             const SidebarMenuItem(
//               title: 'Notifications',
//               destination: NotificationPage(),
//             ),
//             SizedBox(height: 20),
//             const SidebarMenuItem(
//               title: 'Privacy & Policy',
//               destination: PrivacyPolicyPage(),
//             ),
//             SizedBox(height: 20),
//             const SidebarMenuItem(title: 'Legal', destination: LegalPage()),
//             SizedBox(height: 20),
//             const SidebarMenuItem(
//               title: 'Help & Support',
//               destination: HelpSupportPage(),
//             ),
//             SizedBox(height: 20),
//             const SidebarMenuItem(title: 'Log Out', destination: LogOutPage()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildListTile(
//     BuildContext context,
//     String title,
//     Widget destinationPage,
//   ) {
//     return ListTile(
//       title: Text(title),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => destinationPage),
//         );
//       },
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/account/log_out.dart';
// import '../../../../core/constants/my_colors.dart';
// import '../home/notification_page.dart';
// import 'help_support.dart';
// import 'legal.dart';
// import 'my_dashboard.dart';
// import 'personal_information.dart';
// import 'privacy_policy.dart';
// import 'settings.dart';
// import 'widgets/side_bar_menu_item.dart';

// class AccountPage extends StatelessWidget {
//   const AccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
           
//             Container(
//               height: 173,
//               width: double.infinity,
//               color: MyColors.primaryColor,
//               padding: const EdgeInsets.only(top: 60, bottom: 20),
//               child: Row(
//                 children: [
//                   const SizedBox(width: 20),
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/images/sandeep.png'),
//                   ),
//                   const SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Welcome, Sam',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         'sam123@gmail.com',
//                         style: TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         '+977 982135468',
//                         style: TextStyle(color: Colors.white70, fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 8),

//             const SidebarMenuItem(
//               title: 'My Dashboard',
//               destination: MyDashboardPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Personational Information',
//               destination: PersonalInformationPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Settings',
//               destination: SettingPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Notifications',
//               destination: NotificationPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Privacy & Policy',
//               destination: PrivacyPolicyPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Legal',
//               destination: LegalPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Help & Support',
//               destination: HelpSupportPage(),
//             ),
//             const SizedBox(height: 20),

//             const SidebarMenuItem(
//               title: 'Log Out',
//               destination: LogOutPage(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/presentation/pages/general/account/log_out.dart';
import '../../../../core/constants/my_colors.dart';
import '../../auth/login/widgets/login.dart';
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
              width: double.infinity,
              color: MyColors.primaryColor,
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/sandeep.png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome, Sam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'sam123@gmail.com',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '+977 982135468',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const SidebarMenuItem(
              title: 'My Dashboard',
              destination: MyDashboardPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Personational Information',
              destination: PersonalInformationPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Settings',
              destination: SettingPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Notifications',
              destination: NotificationPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Privacy & Policy',
              destination: PrivacyPolicyPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Legal',
              destination: LegalPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Help & Support',
              destination: HelpSupportPage(),
            ),
            const SizedBox(height: 20),

            const SidebarMenuItem(
              title: 'Log Out',
              destination: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}
