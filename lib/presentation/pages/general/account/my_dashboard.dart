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
            Container(
              height: 173,
              width: double.infinity,
              color: MyColors.backgroundColor,
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
                        'Sam Kumar',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'sam123@gmail.com',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 14,
                        ),
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
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Visited Property",
                style: TextStyle(
                  fontSize: 20,
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 4),
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
