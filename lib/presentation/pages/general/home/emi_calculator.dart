import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/presentation/common_widgets/primary_button.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_fonts.dart';
import 'calculator.dart'; 

class EmiCalculatorPage extends StatefulWidget {
  const EmiCalculatorPage({super.key});

  @override
  _EmiCalculatorPageState createState() => _EmiCalculatorPageState();
}

class _EmiCalculatorPageState extends State<EmiCalculatorPage>
    with TickerProviderStateMixin {
  double loanAmount = 1000000;
  double loanTenure = 10;
  double interestRate = 8.5;
  late TabController _tabController;
  List<int> _years = [];
  String _repaymentSchedule = '';

  final NumberFormat currencyFormat = NumberFormat.simpleCurrency();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: loanTenure.toInt(), vsync: this);
  }

  String _calculateRepaymentSchedule() {
    return "EMI: Rs.{((loanAmount * interestRate / 100) / loanTenure.toInt()).toStringAsFixed(2)}";
  }

  Widget _buildLabelRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppFontSizes.normal,
            fontWeight: FontWeight.bold,
            color: MyColors.primaryColor,
        
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: AppFontSizes.normal,
            color: MyColors.primaryColor,
              fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

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
          'EMI Calculator',
          style: TextStyle(
            fontSize: 20,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:12),
            _buildLabelRow('Loan Amount', currencyFormat.format(loanAmount)),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 6,
                activeTrackColor: MyColors.primaryColor,
                inactiveTrackColor: Colors.grey.shade200,
                thumbColor: MyColors.white,
                overlayColor: MyColors.primaryColor,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12,
                  elevation: 2,
                ),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Slider(
                min: 1000000,
                max: 10000000,
                value: loanAmount,
                onChanged: (value) {
                  setState(() {
                    loanAmount = value;
                    _repaymentSchedule = _calculateRepaymentSchedule();
                  });
                },
              ),
            ),
            const SizedBox(height: 12),

            _buildLabelRow('Loan Tenure', '${loanTenure.toInt()} yrs'),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 6,
                thumbColor: MyColors.white,
                activeTrackColor: MyColors.primaryColor,
                inactiveTrackColor: Colors.grey.shade200,
              ),
              child: Slider(
                min: 1,
                max: 30,
                value: loanTenure,
                onChanged: (value) {
                  setState(() {
                    loanTenure = value;

                    final currentYear = DateTime.now().year;
                    final newYears = List.generate(
                      loanTenure.toInt(),
                      (i) => currentYear + i,
                    );

                    _years = newYears;

                    _repaymentSchedule = _calculateRepaymentSchedule();
                  });
                },
              ),
            ),
            const SizedBox(height: 12),

            _buildLabelRow(
              'Interest Rate ',
              '${interestRate.toStringAsFixed(1)} p.a',
            ),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 6,
                thumbColor: MyColors.white,
                activeTrackColor: MyColors.primaryColor,
                inactiveTrackColor: Colors.grey.shade200,
              ),
              child: Slider(
                min: 4,
                max: 16,
                value: interestRate,
                onChanged: (value) {
                  setState(() {
                    interestRate = double.parse(value.toStringAsFixed(1));
                    _repaymentSchedule = _calculateRepaymentSchedule();
                  });
                },
              ),
            ),
            SizedBox(height: 12),
            Center(child: PrimaryButton(title: "Calculate", onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CalculatorPage()));

            })),
          ],
        ),
      ),
    );
  }
}



