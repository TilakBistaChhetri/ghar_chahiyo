import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/presentation/common_widgets/primary_button.dart';

import '../../../../core/constants/my_colors.dart';
import 'emi_calculator.dart';

class HomeLoanPage extends StatelessWidget {
  const HomeLoanPage({super.key});

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
          'Home Loan',
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
            Container(
              width: 372,
              height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      'EMI Calculator',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Calculate your monthly EMI based on loan amount, interest rate, and tenure',
                    style: TextStyle(fontSize: 10, color: MyColors.primaryColor),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: PrimaryButton(
                      title: "Calculate your EMI",
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> EmiCalculatorPage()));
                      },
                    ),
                  ),

                 
                ],
              ),
            ),

            const Text(
              'Top partners for Home Loans',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BankCard(
                  bankName: 'NIC ASIA Bank',
                  interestRate: '8.5%',
                  tenure: '30 Yr',
                  loanAmount: 'Rs. 5L',
                ),
                BankCard(
                  bankName: 'NIC ASIA Bank',
                  interestRate: '8.5%',
                  tenure: '30 Yr',
                  loanAmount: 'Rs. 5L',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('See More Banks', style: TextStyle(color: Colors.blue)),
            const Divider(),

            const Text(
              'Choose your preferred bank for home loan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BankCard(
                  bankName: 'NIC ASIA Bank',
                  interestRate: '8.5%',
                  tenure: '30 Yr',
                  loanAmount: 'Rs. 5L',
                ),
                BankCard(
                  bankName: 'NIC ASIA Bank',
                  interestRate: '8.5%',
                  tenure: '30 Yr',
                  loanAmount: 'Rs. 5L',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('See More Banks', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  final String bankName;
  final String interestRate;
  final String tenure;
  final String loanAmount;

  const BankCard({
    required this.bankName,
    required this.interestRate,
    required this.tenure,
    required this.loanAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 50,
            ), // Replace with the bank logo image
            const SizedBox(height: 10),
            Text(
              bankName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Interest Rate: $interestRate',
              style: const TextStyle(fontSize: 12),
            ),
            Text('Tenure: $tenure', style: const TextStyle(fontSize: 12)),
            Text(
              'Loan Amount: $loanAmount',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
