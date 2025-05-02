import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Track selected filters
  final List<String> _selectedPropertyTypes = [];
  final List<String> _selectedBedrooms = [];
  String _selectedPropertyCategory = 'BUY';
  String? _selectedLocality;
  bool _useCurrentLocation = false;

  // Budget range
  String _minBudget = '₹ 10 Lac';
  String _maxBudget = '₹ 5 Cr';

  // Min budget options
  final List<String> _minBudgetOptions = [
    '₹ 5 Lac',
    '₹ 10 Lac',
    '₹ 20 Lac',
    '₹ 30 Lac',
    '₹ 40 Lac',
    '₹ 50 Lac',
    '₹ 60 Lac',
    '₹ 70 Lac',
    '₹ 80 Lac',
    '₹ 90 Lac',
    '₹ 1 Cr',
    '₹ 1.5 Cr',
    '₹ 2 Cr',
    '₹ 2.5 Cr',
    '₹ 3 Cr',
    '₹ 4 Cr',
    '₹ 5 Cr',
    '₹ 10 Cr',
    '₹ 15 Cr',
    '₹ 20 Cr',
  ];

  // Max budget options
  final List<String> _maxBudgetOptions = [
    '₹ 5 Lac',
    '₹ 10 Lac',
    '₹ 20 Lac',
    '₹ 30 Lac',
    '₹ 40 Lac',
    '₹ 50 Lac',
    '₹ 60 Lac',
    '₹ 70 Lac',
    '₹ 80 Lac',
    '₹ 90 Lac',
    '₹ 1 Cr',
    '₹ 1.5 Cr',
    '₹ 2 Cr',
    '₹ 2.5 Cr',
    '₹ 3 Cr',
    '₹ 4 Cr',
    '₹ 5 Cr',
    '₹ 10 Cr',
    '₹ 15 Cr',
    '₹ 20 Cr',
    '₹ 25+ Cr',
  ];

  // Text controller for locality search
  final TextEditingController _localityController = TextEditingController();

  // Track how many filters are selected
  int get _selectedFiltersCount {
    int count = 0;

    // Property category is always selected
    count += 1;

    // Property types
    count += _selectedPropertyTypes.length;

    // Bedrooms
    count += _selectedBedrooms.length;

    // Locality
    if (_selectedLocality != null || _useCurrentLocation) {
      count += 1;
    }

    // Budget - only count if not default
    if (_minBudget != '₹ 10 Lac' || _maxBudget != '₹ 5 Cr') {
      count += 1;
    }

    return count;
  }

  @override
  void initState() {
    super.initState();
    _selectedPropertyTypes.add('Flat'); // Default selection
    _selectedBedrooms.add('2 BHK'); // Default selection
    _selectedBedrooms.add('3 BHK'); // Default selection
  }

  @override
  void dispose() {
    _localityController.dispose();
    super.dispose();
  }

  // Reset all filters
  void _resetFilters() {
    setState(() {
      _selectedPropertyCategory = 'BUY';
      _selectedPropertyTypes.clear();
      _selectedPropertyTypes.add('Flat');
      _selectedBedrooms.clear();
      _selectedBedrooms.add('2 BHK');
      _selectedBedrooms.add('3 BHK');
      _selectedLocality = null;
      _useCurrentLocation = false;
      _localityController.clear();
      _minBudget = '₹ 10 Lac';
      _maxBudget = '₹ 5 Cr';
    });
  }

  // Apply filters and send to backend
  void _applyFilters() {
    // Create filter map to send to backend
    final Map<String, dynamic> filters = {
      'propertyCategory': _selectedPropertyCategory,
      'propertyTypes': _selectedPropertyTypes,
      'bedrooms': _selectedBedrooms,
      'minBudget': _minBudget,
      'maxBudget': _maxBudget,
      'useCurrentLocation': _useCurrentLocation,
      'locality': _selectedLocality,
    };

    // In a real app, you would send this to your backend or state management
    print('Applying filters: $filters');

    // Close the filter screen and return the filters
    Navigator.pop(context, filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Filters (${_selectedFiltersCount} Selected)',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: Text(
              'Reset',
              style: TextStyle(
                color: Colors.red.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property Category Tabs
                  _buildPropertyCategoryTabs(),

                  // Locality/Project search
                  _buildLocalitySearch(),

                  // Property Type selection
                  _buildPropertyTypeSection(),

                  // Budget selection
                  _buildBudgetSection(),

                  // Number of Bedrooms
                  _buildBedroomsSection(),

                  // More Filter button
                  _buildMoreFilterButton(),

                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ),
          // Fixed Search button at bottom
          _buildSearchButton(),
        ],
      ),
    );
  }

  Widget _buildPropertyCategoryTabs() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        children: [
          _buildCategoryTab('BUY'),
          _buildCategoryTab('RENT'),
          _buildCategoryTab('PG'),
          _buildCategoryTab('COMMERCIAL'),
          _buildCategoryTab('PROJECTS'),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String category) {
    final bool isSelected = _selectedPropertyCategory == category;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedPropertyCategory = category;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade700 : Colors.white,
            border: Border(
              right: BorderSide(
                color: Colors.grey.shade300,
                width: category != 'PROJECTS' ? 1 : 0,
              ),
            ),
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocalitySearch() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Locality/Project',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _localityController,
            decoration: InputDecoration(
              hintText: 'Search in a City, locality or project',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: const UnderlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onChanged: (value) {
              setState(() {
                _selectedLocality = value.isNotEmpty ? value : null;
                if (value.isNotEmpty) {
                  _useCurrentLocation = false;
                }
              });
            },
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              setState(() {
                _useCurrentLocation = !_useCurrentLocation;
                if (_useCurrentLocation) {
                  _selectedLocality = null;
                  _localityController.clear();
                }
              });
            },
            child: Row(
              children: [
                Icon(Icons.my_location, color: Colors.red.shade700, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Use my Current Location',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyTypeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Type',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildPropertyTypeOption(title: 'Flat', icon: Icons.apartment),
              _buildPropertyTypeOption(title: 'House/Villa', icon: Icons.home),
              _buildPropertyTypeOption(title: 'Plot', icon: Icons.crop_square),
              _buildPropertyTypeOption(title: 'Office', icon: Icons.business),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyTypeOption({
    required String title,
    required IconData icon,
  }) {
    final bool isSelected = _selectedPropertyTypes.contains(title);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              _selectedPropertyTypes.remove(title);
            } else {
              _selectedPropertyTypes.add(title);
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.pink.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.pink.shade100 : Colors.grey.shade300,
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Budget',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Min budget dropdown
              Expanded(
                child: _buildBudgetDropdown(
                  value: _minBudget,
                  options: _minBudgetOptions,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _minBudget = value;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 16),
              // Max budget dropdown
              Expanded(
                child: _buildBudgetDropdown(
                  value: _maxBudget,
                  options: _maxBudgetOptions,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _maxBudget = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetDropdown({
    required String value,
    required List<String> options,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: value,
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(height: 0),
        style: const TextStyle(color: Colors.black),
        onChanged: onChanged,
        items:
            options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
      ),
    );
  }

  Widget _buildBedroomsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Number of Bedrooms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildBedroomOption('1 BHK'),
              _buildBedroomOption('2 BHK'),
              _buildBedroomOption('3 BHK'),
              _buildBedroomOption('4 BHK'),
              _buildBedroomOption('4+ BHK'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBedroomOption(String option) {
    final bool isSelected = _selectedBedrooms.contains(option);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              _selectedBedrooms.remove(option);
            } else {
              _selectedBedrooms.add(option);
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.pink.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isSelected ? Colors.pink.shade100 : Colors.grey.shade300,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            option,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreFilterButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () {
            // Navigate to more filters page
          },
          child: const Text(
            'More Filter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: _applyFilters,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Search',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
