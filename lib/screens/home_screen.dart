// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:perfume_app/provider/ad_slider_provider.dart';
import 'package:perfume_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/my_ad_card.dart';
import '../widgets/my_brands_card.dart';
import '../widgets/my_product_cards.dart';
import '../widgets/my_special_card.dart';
import '../widgets/my_title_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xffFEFAFA),
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 30),
                  _buildSearchBar(context),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Consumer<HomeProvider>(
                            builder: (context, homeProvider, _) {
                              if (homeProvider.adImages.isEmpty) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              return ChangeNotifierProvider(
                                create: (_) =>
                                    AdSliderProvider(homeProvider.adImages),
                                child: const MyAdCard(),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTitleRow(title: 'Shop by brands'),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.brands.length,
                              itemBuilder: (context, index) => MyBrandsCard(
                                  brandlogo: provider.brands[index]),
                            ),
                          ),
                          const SizedBox(height: 20),
                          MyTitleRow(title: 'Our Categories'),
                          const SizedBox(height: 10),
                          _buildCategoryGrid(provider),
                          Consumer<HomeProvider>(
                            builder: (context, homeProvider, _) {
                              if (homeProvider.adImages.isEmpty) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              return ChangeNotifierProvider(
                                create: (_) =>
                                    AdSliderProvider(homeProvider.adImages),
                                child: const MyAdCard(),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTitleRow(title: 'New Arrivals'),
                          const SizedBox(height: 10),
                          _buildProductList(provider.newArrivals),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: provider.specialProducts
                                .map((img) => MySpecialProducts(image: img))
                                .toList(),
                          ),
                          const SizedBox(height: 10),
                          MyTitleRow(title: 'Latest Products'),
                          const SizedBox(height: 10),
                          _buildProductList(provider.newProducts),
                          const SizedBox(height: 10),
                          Consumer<HomeProvider>(
                            builder: (context, homeProvider, _) {
                              if (homeProvider.adImages.isEmpty) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              return ChangeNotifierProvider(
                                create: (_) =>
                                    AdSliderProvider(homeProvider.adImages),
                                child: const MyAdCard(),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          MyTitleRow(title: 'Latest Products'),
                          const SizedBox(height: 10),
                          _buildProductList(provider.newProducts),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Text('Welcome, ', style: TextStyle(fontSize: 22)),
        const Text('James!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
        const Spacer(),
        const Icon(Icons.notifications_none_outlined, size: 30),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search..',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Scan Here',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid(HomeProvider provider) {
    return SizedBox(
      height: 240,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          final category = provider.categories[index];
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: category['color'],
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/bottele.png'),
              ),
              Text(category['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductList(List<Map<String, dynamic>> products) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyProductCards(
              image: item['image'],
              name: item['name'],
              realprice: item['realprice'],
              offerprice: item['offerprice'],
              quantity: item['quantity'],
            ),
          );
        },
      ),
    );
  }
}
