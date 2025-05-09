import 'package:flutter/material.dart';

import 'package:ghar_chaiyo/core/constants/my_fonts.dart';
import 'package:ghar_chaiyo/presentation/pages/general/home/property_description.dart';

class NewProjectCard extends StatelessWidget {
  final image;
  final location;
  final district;
  final price;
  const NewProjectCard({
    super.key,
    required this.image,
    required this.location,
    required this.district,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PropertyDescriptionPage()));

      },
      child: Container(
        height: 110,
        width: 103,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                      height: 43,
                      width: 43,
                    ),
                  ),
                ),
                Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppFontSizes.extraSmall,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  district,
                  style: TextStyle(
                    fontSize: AppFontSizes.tiny,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: AppFontSizes.extraSmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}