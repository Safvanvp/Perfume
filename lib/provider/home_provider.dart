// lib/providers/home_provider.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  String? token;
  List<String> adImages = [];
  List<String> specialProducts = [];
  List<String> brands = [];
  List<Map<String, dynamic>> newArrivals = [];
  List<Map<String, dynamic>> categories = [];
  List<Map<String, dynamic>> newProducts = [];

  HomeProvider() {
    init();
  }

  Future<void> init() async {
    try {
      token = await ApiService().login();
      final data = await ApiService().getHomeData(token!);

      final homeFields = data['home_fields'];
      print("Home Fields: $homeFields");

      for (var field in homeFields) {
        switch (field['type']) {
          case 'carousel':
            adImages = List<String>.from(
              field['carousel_items'].map((item) => item['image']),
            );
            break;

          case 'brands':
            brands = List<String>.from(
              field['brands'].map((item) => item['image']),
            );
            break;
        }
      }

      // Keep your own hardcoded categories and anything else below

      categories = [
        {'name': 'Citrus', 'color': Colors.yellow[200]},
        {'name': 'Aromatic', 'color': Colors.deepPurple[200]},
        {'name': 'Floral', 'color': Colors.pink[200]},
        {'name': 'Green', 'color': Colors.green[200]},
        {'name': 'Green', 'color': Colors.green[200]},
        {'name': 'Floral', 'color': Colors.pink[200]},
        {'name': 'Aromatic', 'color': Colors.deepPurple[200]},
        {'name': 'Citrus', 'color': Colors.yellow[200]},
      ];
      specialProducts = [
        'assets/images/decosta.png',
        'assets/images/markandvictor.png'
      ];
      newArrivals = [
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '500',
          'offerprice': '450',
          'quantity': 'per Dozen',
        },
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '600',
          'offerprice': '550',
          'quantity': 'per Dozen',
        },
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '700',
          'offerprice': '650',
          'quantity': 'per Dozen',
        },
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '800',
          'offerprice': '750',
          'quantity': 'per Dozen',
        },
      ];

      newProducts = [
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '500',
          'offerprice': '450',
          'quantity': 'per Dozen',
        },
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '600',
          'offerprice': '550',
          'quantity': 'per Dozen',
        },
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '700',
          'offerprice': '650',
          'quantity': 'per Dozen',
        },
        {
          'name': 'Sample Perfume',
          'image': 'assets/images/prfume1.png',
          'realprice': '800',
          'offerprice': '750',
          'quantity': 'per Dozen',
        },
      ];
    } catch (e) {
      print("Error in HomeProvider: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
