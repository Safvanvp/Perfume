// lib/providers/ad_slider_provider.dart
import 'dart:async';
import 'package:flutter/material.dart';

class AdSliderProvider extends ChangeNotifier {
  final List<String> images;
  int _currentIndex = 0;
  Timer? _timer;

  int get currentIndex => _currentIndex;
  List<String> get imageList => images;

  AdSliderProvider(this.images) {
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 15), (_) {
      _currentIndex = (_currentIndex + 1) % images.length;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
