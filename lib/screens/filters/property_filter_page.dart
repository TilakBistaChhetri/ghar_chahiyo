import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class PropertyFilterPage extends StatelessWidget {
  const PropertyFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final filterOptions = ['Buy', 'Rent', 'PG/Co-living', 'Commercial', 'Plot'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Select Property Type'),
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: filterOptions.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filterOptions[index], style: AppTextStyles.bodyMedium),
            trailing:
                filterOptions[index] == 'Buy'
                    ? Icon(Icons.check, color: AppColors.primary)
                    : null,
            onTap: () {
              // In the future, this would update your state or API call
              // For now, just navigate back with the selected option
              Navigator.pop(context, filterOptions[index]);
            },
          );
        },
      ),
    );
  }
}
