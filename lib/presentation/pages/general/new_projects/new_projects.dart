import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';

import '../../../../core/constants/my_icons.dart';
import '../activity/widgets/filter_sheet.dart';
import '../home/widget/property.dart';

class NewProjectsPage extends StatefulWidget {
  const NewProjectsPage({super.key});

  @override
  State<NewProjectsPage> createState() => _NewProjectsPageState();
}

class _NewProjectsPageState extends State<NewProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: const Text(
          'New Projects',
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
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder:
            (context, index) => Property(
              imagePath: 'assets/images/house.png',
              price: 'Rs. 1,50,000',
              area: '1800sqft',
              bedrooms: 1,
              bathrooms: 2,
              type: 'Villa',
              location: 'Kathmandu, Nepal',
              onPhoneTap: () => debugPrint('Phone tapped for item $index'),
              onAgentTap: () => debugPrint('Call Agent tapped for item $index'),
            ),
      ),
    );
  }
}
