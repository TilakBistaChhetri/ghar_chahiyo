import 'package:flutter/material.dart';

import 'package:ghar_chaiyo/core/constants/my_assets.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_icons.dart';
import 'widget/favourite_icon_button.dart';
import 'widget/info_card.dart';
import 'widget/share_icon_button.dart';

class PropertyDescriptionPage extends StatelessWidget {
  const PropertyDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Stack(
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    MyAssets.houseDetails,
                    height: 369,
                    width: 369,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: MyColors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: MyColors.primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: [
                        ShareIconButton(
                          backgroundColor: MyColors.white,
                          icon: Icons.share_outlined,
                          iconColor: MyColors.primaryColor,
                          onPressed: () {},
                        ),

                        const SizedBox(width: 8),
                        FavoriteIconButton(
                          initialValue: false,
                          onChanged: (value) {
                            print("Favorite status: $value");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wings Tower",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Thamel, Kathmandu",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          "Rs. 30,000",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const TabBar(
                      labelColor: MyColors.dividerColor,
                      tabs: [
                        Tab(text: "Description"),
                        Tab(text: "Gallery"),
                        Tab(text: "Review"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              InfoCard(
                                iconPath: MyIcons.sqft,
                                value: '1,225 ',
                                unit: 'sqft',
                                borderColor: MyColors.backgroundColor,
                              ),
                            ],
                          ),

                          SizedBox(width: 10),
                          Column(
                            children: [
                              InfoCard(
                                iconPath: MyIcons.kitchen,
                                value: '1 ',
                                unit: 'Kitchen',
                                borderColor: MyColors.backgroundColor,
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              InfoCard(
                                iconPath: MyIcons.bed,
                                value: '3',
                                unit: 'Bedrooms',
                                borderColor: MyColors.backgroundColor,
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              InfoCard(
                                iconPath: MyIcons.bathroom,
                                value: '1',
                                unit: 'Bathrooms',
                                borderColor: MyColors.backgroundColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      "Listings Agent",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('MyAssets.sandeep'),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "Sandeep S.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            MyIcons.message,
                            width: 24,
                            height: 24,
                          ),
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            MyIcons.phone,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height:16),
                         Text(
                      "Facilities",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:12),

                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      children: const [
                        _FacilityIcon(
                          icon: Icons.local_parking,
                          label: "Parking",
                        ),
                        _FacilityIcon(icon: Icons.wifi, label: "Wi-Fi"),
                        _FacilityIcon(icon: Icons.kitchen, label: "Kitchen"),
                        _FacilityIcon(icon: Icons.elevator, label: "Elevator"),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: Image.asset(
                    //     'assets/images/map.png', // Replace with static map
                    //     height: 160,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "See on the map",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FacilityIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FacilityIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black87),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}


