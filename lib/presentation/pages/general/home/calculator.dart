// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/constants/my_colors.dart';

// class CalculatorPage extends StatefulWidget {
//   const CalculatorPage({super.key});

//   @override
//   _CalculatorPageState createState() => _CalculatorPageState();
// }

// class _CalculatorPageState extends State<CalculatorPage>
//     with TickerProviderStateMixin {
//   double loanAmount = 8000000;
//   double loanTenure = 10;
//   double interestRate = 8.5;

//   final NumberFormat currencyFormat = NumberFormat.currency(
//     locale: 'en_IN',
//     symbol: 'Rs. ',
//   );

//   @override
//   void initState() {
//     super.initState();
//   }

//   String _calculateRepaymentSchedule() {
//     double emi = (loanAmount * interestRate / 100) / loanTenure;
//     return "EMI: Rs. ${emi.toStringAsFixed(2)}";
//   }

//   double _calculateTotalInterest() {
//     return loanAmount * interestRate / 100 * loanTenure;
//   }

//   List<PieChartSectionData> _getPieChartSections() {
//     double totalInterest = _calculateTotalInterest();
//     double principalAmount = loanAmount;

//     return [
//       PieChartSectionData(
//         value: principalAmount,
//         color: MyColors.primaryColor,

//         radius: 50,
//         showTitle: true,
//         titleStyle: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       PieChartSectionData(
//         value: totalInterest,
//         color: MyColors.primaryColor,

//         radius: 50,
//         showTitle: true,
//         titleStyle: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     ];
//   }

//   Widget _buildLabelRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           value,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'EMI Calculator',
//           style: TextStyle(
//             fontSize: 20,
//             color: MyColors.dividerColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 12),
//               Text(
//                 _calculateRepaymentSchedule(),
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 24),

//               SizedBox(
//                 height: 200,
//                 width: double.infinity,
//                 child: PieChart(
//                   PieChartData(
//                     centerSpaceRadius: 50,
//                     sections: _getPieChartSections(),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),

//               Text(
//                 'EMI Details',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: MyColors.primaryColor,
//                 ),
//               ),

//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 12,
//                 itemBuilder: (context, index) {
//                   String month = DateFormat(
//                     'MMMM',
//                   ).format(DateTime(0, index + 1));
//                   return ListTile(
//                     title: Text(month),
//                     subtitle: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(currencyFormat.format(loanAmount)),
//                         Text(currencyFormat.format(20000)),
//                       ],
//                     ),
//                   );
//                 },
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {},
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: MyColors.primaryColor),
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                         ),
//                         child: Text(
//                           'Check Offers',
//                           style: TextStyle(
//                             color: MyColors.primaryColor,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: MyColors.primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                         ),
//                         child: const Text(
//                           'Apply Now',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_fonts.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _EmiCalculatorPageState createState() => _EmiCalculatorPageState();
}

class _EmiCalculatorPageState extends State<CalculatorPage> with TickerProviderStateMixin {
  double loanAmount = 1000000;
  double loanTenure = 10;
  double interestRate = 8.5;
  //symbol: 'Rs. '

  final NumberFormat currencyFormat = NumberFormat.simpleCurrency(locale: 'en_IN', );

  double get emi => (loanAmount * interestRate / 100) / loanTenure; // EMI calculation

  double get totalAmount => loanAmount + _calculateTotalInterest(); // Total amount including interest
  double get totalInterest => _calculateTotalInterest();

  double _calculateTotalInterest() {
    return loanAmount * interestRate / 100 * loanTenure;
  }

  double _calculatePrincipalPercentage() {
    return (loanAmount / totalAmount) * 100;  // Percentage of principal
  }

  double _calculateInterestPercentage() {
    return (totalInterest / totalAmount) * 100;  // Percentage of interest
  }

  List<PieChartSectionData> _getPieChartSections() {
    double principalPercentage = _calculatePrincipalPercentage();
    double interestPercentage = _calculateInterestPercentage();

    return [
      PieChartSectionData(
        value: principalPercentage,
        color: Colors.teal,
        title: '${principalPercentage.toStringAsFixed(1)}%',
        radius: 50,
        showTitle: true,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        value: interestPercentage,
        color: Colors.amber,
        title: '${interestPercentage.toStringAsFixed(1)}%',
        radius: 50,
        showTitle: true,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }

  Widget _buildLabelRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          style: TextStyle(fontSize: 20, color: MyColors.dividerColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildLabelRow('Loan Amount', currencyFormat.format(loanAmount)),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 6,
                activeTrackColor: MyColors.primaryColor,
                inactiveTrackColor: Colors.grey.shade200,
                thumbColor: MyColors.white,
                overlayColor: MyColors.primaryColor,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12, elevation: 2),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Slider(
                min: 1000000,
                max: 10000000,
                value: loanAmount,
                onChanged: (value) {
                  setState(() {
                    loanAmount = value;
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
                  });
                },
              ),
            ),
            const SizedBox(height: 12),

            _buildLabelRow('Interest Rate', '${interestRate.toStringAsFixed(1)} %'),
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
                    interestRate = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            // Display the Circle Chart
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 50,
                  sections: _getPieChartSections(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // EMI Details Section
            Text(
              'EMI Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.primaryColor),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(12, (index) {
                    String month = DateFormat('MMMM').format(DateTime(0, index + 1));
                    return ListTile(
                      title: Text(month),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currencyFormat.format(loanAmount)),
                          Text(currencyFormat.format(emi)), // Example EMI value
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: MyColors.primaryColor),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Check Offers',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Apply Now',
                        style: TextStyle(fontSize: 16),
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
