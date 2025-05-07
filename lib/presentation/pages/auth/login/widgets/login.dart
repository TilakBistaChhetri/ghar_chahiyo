import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_assets.dart';
import 'package:ghar_chaiyo/core/constants/my_colors.dart';
import 'package:ghar_chaiyo/presentation/pages/general/general.dart';

import '../../../../../core/constants/my_fonts.dart';
import '../../../../common_widgets/country_picker.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../register/widgets/register.dart';
import 'button.dart';

import '../../../../../data/data_sources/local/dummy_login_data_source.dart';
import '../../../../../data/repository/login_repository_impl.dart';
import '../../../../../domain/usecases/login_usecases.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Country? selectedCountry;
  String _error = '';

  late final LoginUseCase _loginUseCase;

  @override
  void initState() {
    super.initState();
    final dataSource = DummyLoginDataSource();
    final repo = LoginRepositoryImpl(dataSource);
    _loginUseCase = LoginUseCase(repo);
  }

  Future<void> _login() async {
    final number = numberController.text.trim();
    final password = passwordController.text.trim();

    final user = await _loginUseCase.execute(number, password);

    if (user != null) {
      setState(() {
        _error = '';
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Success')));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const General()),
      );
    } else {
      setState(() {
        _error = 'Invalid number or password';
      });
    }
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
                  if (_error.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: PrimaryButton(title: 'Login', onPressed: _login),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: MyColors.dividerColor, thickness: 1),
                  const SizedBox(height: 28),
                  GoogleButton(
                    onPressed: () {},
                    text: 'Continue with Google',
                    imagePath: 'assets/icons/google.png',
                  ),
                  const SizedBox(height: 20),
                  GoogleButton(
                    onPressed: () {},
                    text: 'Continue with Apple ID',
                    imagePath: 'assets/icons/apple.png',
                  ),
                  const SizedBox(height: 28),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterPage()),
                      );
                    },
                    child: const Text(
                      "Not sign up yet? Sign up",
                      style: TextStyle(
                        fontSize: AppFontSizes.small,
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
