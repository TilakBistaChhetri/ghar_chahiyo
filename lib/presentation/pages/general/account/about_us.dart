import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
          'About Us',
          style: TextStyle(
            fontSize: AppFontSizes.heading,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Ghar Chaiyo is your trusted partner in finding the perfect place to call home. Whether you\'re searching for a house, apartment, land, or commercial property, we bring you a streamlined, user-friendly platform that connects buyers, sellers, renters, and agents across Nepal.',
              style: TextStyle(
                fontSize: AppFontSizes.normal,
                fontWeight: FontWeight.normal,
                color: MyColors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Founded with a vision to simplify the real estate experience, Ghar Chaiyo offers verified listings, advanced search filters, and tools to compare and manage your favorite properties.',
              style: TextStyle(
                fontSize: AppFontSizes.normal,
                fontWeight: FontWeight.normal,
                color: MyColors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Our goal is to empower users with transparency, reliability, and convenience—making property discovery smarter and stress-free.',
              style: TextStyle(
                fontSize: AppFontSizes.normal,
                fontWeight: FontWeight.normal,
                color: MyColors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'From cozy rentals in the city to long-term investments in growing neighborhoods, Ghar Chaiyo is here to help you find not just a property, but a place you can truly call home.',
              style: TextStyle(
                fontSize: AppFontSizes.normal,
                fontWeight: FontWeight.normal,
                color: MyColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
