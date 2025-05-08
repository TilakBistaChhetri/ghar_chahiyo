import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/constants/my_fonts.dart';
import '../../../../core/constants/my_icons.dart' show MyIcons;
import 'widgets/contact_button.dart';

class ContactUsPage extends StatefulWidget {
  ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController customerservicesController =
      TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController instragramController = TextEditingController();

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
          'Contact Us',
          style: TextStyle(
            fontSize: AppFontSizes.heading,
            color: MyColors.dividerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            SizedBox(height: 18),
             ContactButton(
              title: 'Customer Services',
              assetPath: MyIcons.customer,
            ),
          
            SizedBox(height: 16),
               ContactButton(
              title: 'Website',
              assetPath: MyIcons.website,
            ),
           
            SizedBox(height: 16),
              ContactButton(
              title: 'Whatsapp',
              assetPath: MyIcons.whatsapp,
            ),
            SizedBox(height: 16),
              ContactButton(
              title: 'Facebook',
              assetPath: MyIcons.facebook,
            ),
            SizedBox(height: 16),
             ContactButton(
              title: 'Twitter',
              assetPath: MyIcons.twitter,
            ),
            SizedBox(height: 16),
              ContactButton(
              title: 'Instragram',
              assetPath: MyIcons.instragram,
            ),
          ],
        ),
      ),
    );
  }
}
