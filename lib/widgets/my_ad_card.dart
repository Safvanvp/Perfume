import 'package:flutter/material.dart';

class MyAdCard extends StatelessWidget {
  final String adImage;
  const MyAdCard({super.key, required this.adImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        adImage,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
