// import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
import 'theme/theme.dart';
import 'screens/home/home_screen.dart';
import 'screens/properties/search_results_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghar Chaiyo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),

      // Define your routes
      routes: {
        '/home': (context) => const HomeScreen(),
        // Add other static routes here
      },

      // Add this onGenerateRoute handler for dynamic routes
      onGenerateRoute: (settings) {
        if (settings.name == '/search-results') {
          // Extract the filter arguments
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => SearchResultsScreen(filters: args),
          );
        }

        // Return null to let the app handle routes it doesn't recognize
        return null;
      },

      // Optional: Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                appBar: AppBar(title: const Text('Page Not Found')),
                body: const Center(
                  child: Text('The requested page was not found'),
                ),
              ),
        );
      },
    );
  }
}
