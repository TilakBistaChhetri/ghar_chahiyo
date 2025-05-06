import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../common_widgets/country_picker.dart';
import '../../../common_widgets/custom_textfield.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() => _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  Country? selectedCountry;
  List<String> selectedRoles = [];
  bool isTermsAccepted = false;

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
          'Personal Information',
          style: TextStyle(
            fontSize: 20,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 26),
            CustomTextField(
              controller: fullnameController,
              hintText: 'Full Name',
              isPassword: false,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 26),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                CountryPickerWidget(
                  onCountrySelected: (Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    controller: numberController,
                    hintText: 'Number',
                    isPassword: false,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),
      ),
    );
  }
}


