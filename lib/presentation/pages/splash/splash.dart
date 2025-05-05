import 'package:flutter/material.dart';

import '../../../core/constants/my_assets.dart';
import '../../../core/constants/my_colors.dart';
import '../../../screens/calculator/emi_calculator_screen.dart';
import '../auth/login/widgets/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToOnBoard();
    super.initState();
  }

  moveToOnBoard() async {
    await Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Center(child: Image.asset(MyAssets.Logo)),
    );
  }
}
