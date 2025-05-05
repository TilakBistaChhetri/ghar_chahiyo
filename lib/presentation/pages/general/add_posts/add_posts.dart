import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import 'widgets/drop_down.dart';

class AddPostsPage extends StatefulWidget {
  const AddPostsPage({super.key});

  @override
  State<AddPostsPage> createState() => _AddPostsPageState();
}

class _AddPostsPageState extends State<AddPostsPage> {
  String? propertyType = 'Apartment';
  String? condition = 'Brand New';
  String? roadCondition = 'Pitch Road';
  String? roadSize = 'Less than 5ft';
  String? facing = 'East';
  String? amenities = 'Ready to move';
  String? availability = 'Ready to move';

  final titleController = TextEditingController();
  final areaController = TextEditingController();
  final dateController = TextEditingController();

  bool? carParking;
  bool? bikeParking;

  String? category = 'Rent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.backgroundColor,
        title: const Text(
          "Add Listing",
          style: TextStyle(fontSize: 20, color: MyColors.dividerColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fill our the details of your property",
              style: TextStyle(fontSize: 25, color: MyColors.primaryColor),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Suncity Apartment',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Property Category"),
            Row(
              children:
                  ['Rent', 'Sell', 'Management'].map((e) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: e,
                          groupValue: category,
                          onChanged: (val) => setState(() => category = val),
                        ),
                        Text(e),
                      ],
                    );
                  }).toList(),
            ),
            const SizedBox(height: 8),

            CustomDropdown(
              label: "Property Type",
              value: propertyType,
              items: [
                'Apartment',
                'Office Space',
                'Land',
                'Commercial Building',
                'Villa',
                'Shutter',
              ],
              onChanged: (val) => setState(() => propertyType = val),
            ),
            CustomDropdown(
              label: "Condition",
              value: condition,
              items: [
                'Brand New',
                'Like New',
                'Used',
                'Needs Renovation',
                'Land Value Only',
                'Good Condition',
                'Remodeled',
              ],
              onChanged: (val) => setState(() => condition = val),
            ),
            CustomDropdown(
              label: "Road condition",
              value: roadCondition,
              items: ['Pitch Road', 'Gravel', 'Soild'],
              onChanged: (val) => setState(() => roadCondition = val),
            ),
            CustomDropdown(
              label: "Road Size",
              value: roadSize,
              items: ['Less than 5ft', '5ft to 10ft', 'More than 10ft'],
              onChanged: (val) => setState(() => roadSize = val),
            ),
            CustomDropdown(
              label: "Facing",
              value: facing,
              items: ['East', 'West', 'North', 'South'],
              onChanged: (val) => setState(() => facing = val),
            ),
            CustomDropdown(
              label: "Amenities",
              value: amenities,
              items: ['Ready to move', 'Under construction'],
              onChanged: (val) => setState(() => amenities = val),
            ),
            CustomDropdown(
              label: "Availability Status",
              value: availability,
              items: ['Ready to move', 'In 1 month', 'In 3 months'],
              onChanged: (val) => setState(() => availability = val),
            ),

            TextFormField(
              controller: areaController,
              decoration: const InputDecoration(
                labelText: 'Property Area',
                hintText: 'e.g. 250 sqft',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: dateController,
              readOnly: true,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  dateController.text =
                      "${picked.year}-${picked.month}-${picked.day}";
                }
              },
              decoration: const InputDecoration(
                labelText: 'Built up Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            _parkingOption(
              "Car Parking",
              (val) => setState(() => carParking = val),
              carParking,
            ),
            _parkingOption(
              "Bike Parking",
              (val) => setState(() => bikeParking = val),
              bikeParking,
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primaryColor,

                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 16, color: MyColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _parkingOption(String label, Function(bool?) onChanged, bool? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          children:
              ['Yes', 'No'].map((e) {
                return Row(
                  children: [
                    Radio<bool>(
                      value: e == 'Yes',
                      groupValue: value,
                      onChanged: onChanged,
                    ),
                    Text(e),
                  ],
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
