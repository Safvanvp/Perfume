import 'package:flutter/material.dart';

class MySpecialProducts extends StatelessWidget {
  final String image;
  const MySpecialProducts({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      width: 185,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const Spacer(),
          Text('Shop Now',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
