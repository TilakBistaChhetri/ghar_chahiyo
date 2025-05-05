import 'package:flutter/material.dart';

import '../../../../../core/constants/my_colors.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  String selectedTab = 'Ongoing';
  String selectedSubTab = 'Buy';
  String selectedPropertyType = 'All';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filter',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_filterTab('Ongoing'), _filterTab('History')],
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _pillButton('Buy'),
              _pillButton('Rent'),
              _pillButton('Management'),
            ],
          ),
          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Property Type',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              _propertyButton('All'),
              _propertyButton('House'),
              _propertyButton('Villa'),
              _propertyButton('Apartment'),
            ],
          ),

          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedTab = 'Ongoing';
                      selectedSubTab = 'Buy';
                      selectedPropertyType = 'All';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.indigo),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Reset Filter'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Just close sheet on Apply
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.indigo[900],
                    backgroundColor: MyColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: MyColors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pillButton(String text) {
    final selected = selectedSubTab == text;
    return GestureDetector(
      onTap: () => setState(() => selectedSubTab = text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? MyColors.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _filterTab(String text) {
    final selected = selectedTab == text;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = text),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        decoration: BoxDecoration(
          color: selected ? MyColors.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _propertyButton(String text) {
    final selected = selectedPropertyType == text;
    return GestureDetector(
      onTap: () => setState(() => selectedPropertyType = text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? MyColors.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
