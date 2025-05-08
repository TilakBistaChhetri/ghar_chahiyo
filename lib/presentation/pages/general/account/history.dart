import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
import 'package:ghar_chaiyo/core/constants/my_icons.dart';

import '../../../../core/constants/my_colors.dart';
import '../activity/widgets/filter_sheet.dart';
import '../home/widget/property_card.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

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
          'History',
          style: TextStyle(
            fontSize: AppFontSizes.heading,

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
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder:
            (context, index) => PropertyCard(
              imagePath: 'assets/images/house.png',
              price: 'Rs. 1,50,000',
              area: '1800sqft',
              bedrooms: 2,
              bathrooms: 1,
              type: 'Villa',
              location: 'Kathmandu, Nepal',
              onPhoneTap: () => print('Phone tapped for item $index'),
              onAgentTap: () => print('Call Agent tapped for item $index'),
            ),
      ),
    );
  }
}
