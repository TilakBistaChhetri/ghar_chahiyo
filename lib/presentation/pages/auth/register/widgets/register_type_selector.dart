import 'package:flutter/material.dart';

import '../../../../../core/constants/my_colors.dart';

class RegisterTypeSelector extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;
  final Function(bool) onTermsChanged;

  const RegisterTypeSelector({
    super.key,
    required this.onSelectionChanged,
    required this.onTermsChanged,
  });

  @override
  State<RegisterTypeSelector> createState() => _RegisterTypeSelectorState();
}

class _RegisterTypeSelectorState extends State<RegisterTypeSelector> {
  final Map<String, Map<String, dynamic>> _roles = {
    "Individual Agent": {
      "selected": true,
      "icon": "assets/icons/individual.png",
    },
    "Agency/Company": {
      "selected": false,
      "icon": "assets/icons/agency.png",
    },
    "Home Owner": {
      "selected": true,
      "icon": "assets/icons/homeowner.png",
    },
    "Builder": {
      "selected": true,
      "icon": "assets/icons/builder.png",
    },
  };

  bool _termsAccepted = true;

  void _notifyRoleChange() {
    final selectedRoles = _roles.entries
        .where((entry) => entry.value["selected"] == true)
        .map((entry) => entry.key)
        .toList();
    widget.onSelectionChanged(selectedRoles);
  }

  void _notifyTermsChange() {
    widget.onTermsChanged(_termsAccepted);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "I want to register as",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        ..._roles.entries.map((entry) {
          final label = entry.key;
          final selected = entry.value["selected"] as bool;
          final iconPath = entry.value["icon"] as String;

          return _buildCheckboxTile(
            value: selected,
            label: label,
            iconPath: iconPath,
            onChanged: (val) {
              setState(() {
                _roles[label]!["selected"] = val;
              });
              _notifyRoleChange();
            },
          );
        }).toList(),
        const SizedBox(height: 16),
        _buildCheckboxTile(
          value: _termsAccepted,
          label: '“I agree to the Terms and Conditions & Privacy Policy”',
          iconPath: "assets/icons/terms.png", 
          onChanged: (val) {
            setState(() {
              _termsAccepted = val;
            });
            _notifyTermsChange();
          },
        ),
      ],
    );
  }

  Widget _buildCheckboxTile({
    required bool value,
    required String label,
    required String iconPath,
    required void Function(bool) onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              value ? Icons.check_box : Icons.check_box_outline_blank,
              color: MyColors.black,
              size: 24,
            ),
            const SizedBox(width: 12),
            Image.asset(
              iconPath,
              width: 16,
              height: 16,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
