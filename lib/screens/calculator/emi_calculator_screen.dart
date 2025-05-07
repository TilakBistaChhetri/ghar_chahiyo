import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/theme.dart';
import 'package:intl/intl.dart';

class EMICalculatorScreen extends StatefulWidget {
  const EMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<EMICalculatorScreen> createState() => _EMICalculatorScreenState();
}

class _EMICalculatorScreenState extends State<EMICalculatorScreen>
    with TickerProviderStateMixin {
 
  double loanAmount = 8000000; // 80 lakhs
  double interestRate = 8.5; // 8.5%
  double loanTenure = 30; // 30 years


  late TabController _tabController;

  // Years list for tabs
  late List<int> _years;

  // Repayment schedule data
  late Map<int, List<MonthlyRepayment>> _repaymentSchedule;

  // Currency formatter
  final currencyFormat = NumberFormat.currency(
    symbol: 'NRS ',
    locale: 'en_IN',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();

    // Initialize years based on current year
    final currentYear = DateTime.now().year;
    _years = List.generate(loanTenure.toInt(), (i) => currentYear + i);

    // Initialize tab controller
    _tabController = TabController(length: _years.length, vsync: this);

    // Add listener for debugging
    _tabController.addListener(() {
      // This helps track any unexpected tab controller usage
      if (_tabController.indexIsChanging) {
        print("Tab changing to: ${_tabController.index}");
      }
    });

    // Calculate initial repayment schedule
    _repaymentSchedule = _calculateRepaymentSchedule();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Calculate EMI
  double get emi {
    double principal = loanAmount;
    double monthlyRate = interestRate / 12 / 100;
    double totalMonths = loanTenure * 12;

    if (monthlyRate == 0) return principal / totalMonths;

    double emi =
        principal *
        monthlyRate *
        pow(1 + monthlyRate, totalMonths) /
        (pow(1 + monthlyRate, totalMonths) - 1);
    return emi;
  }

  // Calculate total interest
  double get totalInterest {
    return (emi * loanTenure * 12) - loanAmount;
  }

  // Calculate the full loan repayment schedule
  Map<int, List<MonthlyRepayment>> _calculateRepaymentSchedule() {
    final Map<int, List<MonthlyRepayment>> schedule = {};

    double remainingPrincipal = loanAmount;
    final double monthlyRate = interestRate / 12 / 100;
    final double monthlyEmi = emi;

    final startYear = _years.first;
    final months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    // Calculate for each year and month
    for (int year in _years) {
      schedule[year] = [];

      // For each month in the year
      for (int monthIndex = 0; monthIndex < 12; monthIndex++) {
        // Skip months already passed in first year
        if (year == startYear && monthIndex < DateTime.now().month - 1) {
          continue;
        }

        // For the last year, stop when loan is fully paid
        if (remainingPrincipal <= 0) break;

        // Calculate interest for this month
        double interestForMonth = remainingPrincipal * monthlyRate;

        // Calculate principal for this month
        double principalForMonth = monthlyEmi - interestForMonth;

        // Adjust for the last payment
        if (principalForMonth > remainingPrincipal) {
          principalForMonth = remainingPrincipal;
          interestForMonth = remainingPrincipal * monthlyRate;
        }

        // Update remaining principal
        remainingPrincipal -= principalForMonth;
        if (remainingPrincipal < 0) remainingPrincipal = 0;

        // Add to schedule
        schedule[year]!.add(
          MonthlyRepayment(
            month: months[monthIndex],
            beginningBalance: remainingPrincipal + principalForMonth,
            emi: monthlyEmi,
            principal: principalForMonth,
            interest: interestForMonth,
            endingBalance: remainingPrincipal,
          ),
        );
      }
    }

    return schedule;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.lightBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Home Loan EMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // magicLoans logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Ghar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Loan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber.shade300,
                    ),
                    child: const Icon(Icons.currency_rupee, size: 16),
                  ),
                ],
              ),
            ),

            // Title and description
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Text(
                'Home Loan EMI Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Home Loan EMI Calculator provides an instant estimate of your EMI by requiring the loan amount, interest rate,...',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Read more',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Calculator card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Loan Amount
                  _buildLabelRow(
                    'Loan Amount',
                    '${currencyFormat.format(loanAmount)}',
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 6,
                      activeTrackColor: AppColors.lightTextSecondary,
                      inactiveTrackColor: Colors.grey.shade200,
                      thumbColor: AppColors.lightBackground,
                      overlayColor: AppColors.lightTextSecondary.withOpacity(
                        0.2,
                      ),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                        elevation: 2,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 20,
                      ),
                    ),
                    child: Slider(
                      min: 1000000, // 10 lakhs
                      max: 10000000, // 1 crore
                      value: loanAmount,
                      onChanged: (value) {
                        setState(() {
                          loanAmount = value;
                          _repaymentSchedule = _calculateRepaymentSchedule();
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Loan Tenure
                  _buildLabelRow('Loan Tenure', '${loanTenure.toInt()} yrs'),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 6,
                      thumbColor: Colors.white,
                      activeTrackColor: AppColors.lightTextSecondary,
                      inactiveTrackColor: Colors.grey.shade200,
                    ),
                    child: Slider(
                      min: 1,
                      max: 30,
                      value: loanTenure,
                      onChanged: (value) {
                        setState(() {
                          loanTenure = value;

                          // First update years list when tenure changes
                          final currentYear = DateTime.now().year;
                          final newYears = List.generate(
                            loanTenure.toInt(),
                            (i) => currentYear + i,
                          );

                          // Save current tab index if possible
                          final currentYearIndex = _tabController.index;

                          // Update tab controller safely
                          if (_tabController.length != loanTenure.toInt()) {
                            // Need to create a new controller when length changes
                            _tabController = TabController(
                              length: loanTenure.toInt(),
                              vsync: this,
                            );

                            // Update to a valid index
                            if (currentYearIndex < loanTenure.toInt()) {
                              _tabController.animateTo(currentYearIndex);
                            }
                          }

                          // Update years list
                          _years = newYears;

                          // Recalculate schedule
                          _repaymentSchedule = _calculateRepaymentSchedule();
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Interest Rate
                  _buildLabelRow(
                    'Interest Rate %',
                    '${interestRate.toStringAsFixed(1)} p.a',
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 6,
                      thumbColor: Colors.white,
                      activeTrackColor: AppColors.lightTextSecondary,
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
                ],
              ),
            ),

            // Results card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'You are Eligible for EMI Amount',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currencyFormat.format(emi),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Pie chart
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 50,
                              sections: [
                                PieChartSectionData(
                                  value: loanAmount,
                                  color: Colors.teal,
                                  radius: 30,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  value: totalInterest,
                                  color: Colors.amber,
                                  radius: 30,
                                  showTitle: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Principal
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: Colors.teal,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Principal Amount',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                currencyFormat.format(loanAmount),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 24),

                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Interest Amount',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                currencyFormat.format(totalInterest),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

           
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Your Repayment Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Year tabs
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs:
                        _years
                            .map((year) => Tab(text: year.toString()))
                            .toList(),
                    labelColor: AppColors.primary,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.red,
                    dividerColor: Colors.grey.shade300,
                    indicatorWeight: 3,
                  ),

                  // Tab content
                  SizedBox(
                    height: 500, // Fixed height for the table
                    child: TabBarView(
                      controller: _tabController,
                      children:
                          _years.map((year) => _buildYearView(year)).toList(),
                    ),
                  ),

                  // Bottom buttons
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // Implement check offers functionality
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primary),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              'Check Offers',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Implement apply now functionality
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
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
          ],
        ),
      ),
    );
  }

  Widget _buildYearView(int year) {
    final yearData = _repaymentSchedule[year] ?? [];

    return yearData.isEmpty
        ? const Center(child: Text('No data available for this year'))
        : SingleChildScrollView(
          child: Table(
            border: TableBorder(
              horizontalInside: BorderSide(color: Colors.grey.shade300),
              verticalInside: BorderSide(color: Colors.grey.shade300),
            ),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(2.5),
              2: FlexColumnWidth(1.5),
            },
            children: [
              // Table header
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                children: [
                  _buildTableCell('Month', isHeader: true),
                  _buildTableCell('Beginning Loan Balance', isHeader: true),
                  _buildTableCell('EMI', isHeader: true),
                ],
              ),

              // Table data rows
              ...yearData
                  .map(
                    (data) => TableRow(
                      children: [
                        _buildTableCell(data.month),
                        _buildTableCell(
                          currencyFormat.format(data.beginningBalance),
                        ),
                        _buildTableCell(currencyFormat.format(data.emi)),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Text(
        text,
        textAlign: isHeader ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 14 : 16,
        ),
      ),
    );
  }

  Widget _buildLabelRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


class MonthlyRepayment {
  final String month;
  final double beginningBalance;
  final double emi;
  final double principal;
  final double interest;
  final double endingBalance;

  MonthlyRepayment({
    required this.month,
    required this.beginningBalance,
    required this.emi,
    required this.principal,
    required this.interest,
    required this.endingBalance,
  });
}
