import 'package:flutter/material.dart';

class NewProjectsPage extends StatefulWidget {
  const NewProjectsPage({super.key});

  @override
  State<NewProjectsPage> createState() => _NewProjectsPageState();
}

class _NewProjectsPageState extends State<NewProjectsPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title:Text("New Projects"),
      ),
    );
  }
}