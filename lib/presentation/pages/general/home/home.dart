import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/notification_page.dart';

import '../../../../core/constants/my_assets.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_icons.dart';
import 'home_loan.dart';
import 'site_listings.dart';
import 'widget/icon_menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    //Image.asset(MyIcons.menu, width: 24, height: 24),
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
                        MyIcons.menu,
                        width: 24,
                        height: 24,
                      ),
                    ),

                    Image.asset(
                      MyAssets.Logo,
                      height: 42,
                      width: 42,
                      fit: BoxFit.contain,
                    ),
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

                    // Image.asset(
                    //   MyIcons.notification,
                    //   width: 20,
                    //   height: 20,
                    // ),
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
                  height: 105,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      IconMenuItem(
                        iconPath: MyIcons.Property,
                        label: 'Property \n Valuation',
                        onTap: () {},
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.homeloan,
                        label: 'Home \n Loan',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLoanPage()));
                        },
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.homeiteriors,
                        label: 'Home \n Interiors',
                        onTap: () {
                          print('Interiors tapped');
                        },
                      ),
                      IconMenuItem(
                        iconPath: MyIcons.sitemap,
                        label: 'Site \n Map',
                        onTap: () {
                          print('Map tapped');
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
                    ],
                  ),
                ),

                SizedBox(height: 24),
                const Divider(color: MyColors.dividerColor, thickness: 5),
                SizedBox(height: 24),

                Container(
                  width: double.infinity,
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
                      const Text(
                        "What type of Property are you looking for?",
                        style: TextStyle(
                          fontSize: 20,
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
                SizedBox(height: 24),
                const Divider(color: MyColors.dividerColor, thickness: 5),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
