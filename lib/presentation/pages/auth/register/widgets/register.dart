import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_assets.dart';
import 'package:ghar_chaiyo/presentation/pages/general/general.dart';
import '../../../../common_widgets/country_picker.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/primary_button.dart';
import 'register_type_selector.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Country? selectedCountry;
  List<String> selectedRoles = [];
  bool isTermsAccepted = false;

  bool _validateInputs() {
    return fullnameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        numberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        selectedCountry != null &&
        selectedRoles.isNotEmpty &&
        isTermsAccepted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 72),
            Center(child: Image.asset(MyAssets.Logo, width: 242, height: 180)),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextField(
                    controller: fullnameController,
                    hintText: 'Full Name',
                    isPassword: false,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 16),
                  RegisterTypeSelector(
                    onSelectionChanged: (roles) {
                      selectedRoles = roles;
                    },
                    onTermsChanged: (value) {
                      isTermsAccepted = value;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: PrimaryButton(
                      title: 'Register',
                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> General()));
                      }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
