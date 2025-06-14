import 'package:flutter/material.dart';

class MyBrandsCard extends StatelessWidget {
  final String brandlogo;
  const MyBrandsCard({super.key, required this.brandlogo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        width: 130,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300, width: 1.0)),
        child:
            Image.network(brandlogo, width: 80, height: 80, fit: BoxFit.cover));
  }
}
