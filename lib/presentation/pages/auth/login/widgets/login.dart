import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_assets.dart';
import 'package:ghar_chaiyo/presentation/pages/general/general.dart';
import 'package:ghar_chaiyo/screens/home/home_screen.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../common_widgets/country_picker.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../register/widgets/register.dart';
import 'button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Country? selectedCountry;

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
                  const SizedBox(height: 32),
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
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: PrimaryButton(
                      title: 'Login',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const General(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: MyColors.dividerColor, thickness: 1),

                  const SizedBox(height: 28),
                  GoogleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const General(),
                        ),
                      );
                    },
                    text: 'Continue with Google',
                    imagePath: 'assets/icons/google.png',
                  ),

                  const SizedBox(height: 20),
                  GoogleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const General(),
                        ),
                      );
                    },
                    text: 'Continue with Apple ID',
                    imagePath: 'assets/icons/apple.png',
                  ),
                  const SizedBox(height: 28),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Not sign up yet? Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black,
                        decoration: TextDecoration.underline,
                      ),
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
