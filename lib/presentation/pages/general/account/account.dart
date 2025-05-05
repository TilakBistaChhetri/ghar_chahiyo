import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          Container(
            height: 173,
            width: 393,
            color: MyColors.primaryColor,
            //color: Colors.red,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Row(
              children: [
                 const CircleAvatar(
                   radius: 40,
                //   // backgroundImage: AssetImage(
                //   //   'assets/user.png',
                //   // ), // Replace with your asset
                 ),
                const SizedBox(width: 10),

                Column(
                  children: [
                    const Text(
                      'Welcome, Sam',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    const Text(
                      'sam123@gmail.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    const Text(
                      '+977 982135468',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListTile('My Dashboard', context),
                buildListTile('Personal Information', context),
                buildListTile('Favorites', context),
                buildListTile('Settings', context),
                buildListTile('Notifications', context),
                buildListTile('Privacy Policy', context),
                buildListTile('Legal', context),
                buildListTile('Help & Support', context),
                ListTile(
                  title: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(String title, BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
