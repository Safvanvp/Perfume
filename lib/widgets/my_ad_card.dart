// lib/widgets/my_ad_card.dart
import 'package:flutter/material.dart';
import 'package:perfume_app/provider/ad_slider_provider.dart';
import 'package:provider/provider.dart';

class MyAdCard extends StatelessWidget {
  const MyAdCard({super.key});

  @override
  Widget build(BuildContext context) {
    final adSlider = Provider.of<AdSliderProvider>(context);
    final image = adSlider.imageList[adSlider.currentIndex];

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Image.network(
          image,
          key: ValueKey(image),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
