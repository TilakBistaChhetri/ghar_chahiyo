// import 'package:flutter/material.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/activity/activity.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/add_posts/add_posts.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/account/account.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/home/home.dart';
// import 'package:ghar_chaiyo/presentation/pages/general/new_projects/new_projects.dart';
// import '../../../core/constants/my_colors.dart';
// import 'widgets/tab_item.dart';

// class General extends StatefulWidget {
//   const General({super.key});

//   @override
//   State<General> createState() => _GeneralState();
// }

// class _GeneralState extends State<General> {
//   int visit = 0;

//   final List<TabItem> items = [
//     TabItem(title: 'Home', assetIconPath: 'assets/icons/home.png'),
//     TabItem(title: 'Activity', assetIconPath: 'assets/icons/activity.png'),
//     TabItem(title: 'Add Posts', assetIconPath: 'assets/icons/add.png'),
//     TabItem(title: 'New Projects', assetIconPath: 'assets/icons/newprojects.png'),
//     TabItem(title: 'Account', assetIconPath: 'assets/icons/account.png'),
//   ];
//   final List<Widget> pages = [
//     HomePage(),
//     ActivityPage(),
//     AddPostsPage(),
//     NewProjectsPage(),
//     AccountPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[visit],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: visit,
//         onTap: (index) => setState(() => visit = index),
//         selectedItemColor: MyColors.primaryColor,
//         unselectedItemColor: MyColors.primaryColor.withOpacity(0.4),
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         items: items.map((item) {
//           return BottomNavigationBarItem(
//             icon: item.assetIconPath != null
//                 ? Image.asset(
//                     item.assetIconPath!,
//                     height: 24,
//                     color: visit == items.indexOf(item)
//                         ? MyColors.primaryColor
//                         : MyColors.primaryColor.withOpacity(0.4),
//                   )
//                 : Icon(
//                     item.icon,
//                     color: visit == items.indexOf(item)
//                         ? MyColors.primaryColor
//                         : MyColors.primaryColor.withOpacity(0.4),
//                   ),
//             label: item.title,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
import 'package:ghar_chaiyo/presentation/common_widgets/sub_outline_button.dart';
import 'package:ghar_chaiyo/presentation/pages/auth/register/widgets/register.dart';
import 'package:ghar_chaiyo/presentation/pages/general/activity/activity.dart';
import 'package:ghar_chaiyo/presentation/pages/general/add_posts/add_posts.dart';
import 'package:ghar_chaiyo/presentation/pages/general/account/account.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/home.dart';
import 'package:ghar_chaiyo/presentation/pages/general/new_projects/new_projects.dart';
import '../../../core/constants/my_colors.dart';
import '../../common_widgets/sub_primary_button.dart';
import '../auth/register/widgets/register_type_selector.dart';
import 'widgets/tab_item.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int visit = 0;

  final List<TabItem> items = [
    TabItem(title: 'Home', assetIconPath: 'assets/icons/home.png'),
    TabItem(title: 'Activity', assetIconPath: 'assets/icons/activity.png'),
    TabItem(title: 'Add Posts', assetIconPath: 'assets/icons/add.png'),
    TabItem(
      title: 'New Projects',
      assetIconPath: 'assets/icons/newprojects.png',
    ),
    TabItem(title: 'Account', assetIconPath: 'assets/icons/account.png'),
  ];

  final List<Widget> pages = [
    HomePage(),
    ActivityPage(),
    AddPostsPage(),
    NewProjectsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[visit],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: visit,
        onTap: (index) {
          if (index == 2) {
            _showAddPostsDialog(context);
          } else {
            setState(() {
              visit = index;
            });
          }
        },
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: MyColors.primaryColor.withOpacity(0.4),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items:
            items.map((item) {
              return BottomNavigationBarItem(
                icon:
                    item.assetIconPath != null
                        ? Image.asset(
                          item.assetIconPath!,
                          height: 24,
                          color:
                              visit == items.indexOf(item)
                                  ? MyColors.primaryColor
                                  : MyColors.primaryColor.withOpacity(0.4),
                        )
                        : Icon(
                          item.icon,
                          color:
                              visit == items.indexOf(item)
                                  ? MyColors.primaryColor
                                  : MyColors.primaryColor.withOpacity(0.4),
                        ),
                label: item.title,
              );
            }).toList(),
      ),
    );
  }

  void _showAddPostsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: 347,
          width: 393,
          child: AlertDialog(
            title: const Text(
              'Please choose how you want to register to add listing',
              style: TextStyle(
                fontSize: AppFontSizes.normal,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: RegisterTypeSelector(
              onSelectionChanged: (selectedRoles) {
                print("Selected roles: $selectedRoles");
              },
              onTermsChanged: (accepted) {
                print("Terms accepted: $accepted");
              },
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubOutlineButton(
                    title: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  SubPrimaryButton(
                    title: "Continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
