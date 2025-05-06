import 'package:flutter/material.dart';
import '../../../../core/constants/my_colors.dart';
import '../home/widget/property_card.dart';

class MyDashboardPage extends StatelessWidget {
  const MyDashboardPage({super.key});

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
          'My Dashboard',
          style: TextStyle(
            fontSize: 20,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "Visited Property",
              style: TextStyle(
                fontSize: 20,
                color: MyColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
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
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
