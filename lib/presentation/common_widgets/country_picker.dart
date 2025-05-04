
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';

// class CountryPickerWidget extends StatefulWidget {
//   final Function(Country) onCountrySelected;

//   const CountryPickerWidget({super.key, required this.onCountrySelected});

//   @override
//   State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
// }

// class _CountryPickerWidgetState extends State<CountryPickerWidget> {
//   Country? selectedCountry;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         showCountryPicker(
//           context: context,
//           showPhoneCode: true,
//           onSelect: (Country country) {
//             setState(() {
//               selectedCountry = country;
//             });
//             widget.onCountrySelected(country);
//           },
//         );
//       },
//       child: Text(
//         selectedCountry == null
//             ? 'Select Country'
//             : '${selectedCountry!.flagEmoji} ${selectedCountry!.name} (+${selectedCountry!.phoneCode})',
//         style: const TextStyle(fontSize: 18),
//       ),
//     );
//   }
// }













import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPickerWidget extends StatefulWidget {
  final Function(Country) onCountrySelected;

  const CountryPickerWidget({super.key, required this.onCountrySelected});

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          onSelect: (Country country) {
            setState(() {
              selectedCountry = country;
            });
            widget.onCountrySelected(country);
          },
        );
      },
      child: Container(
        width: 64,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          selectedCountry?.flagEmoji ?? '🏳️',
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

