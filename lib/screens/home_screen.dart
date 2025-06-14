import 'package:flutter/material.dart';
import 'package:perfume_app/widgets/my_ad_card.dart';
import 'package:perfume_app/widgets/my_brands_card.dart';
import 'package:perfume_app/widgets/my_product_cards.dart';
import 'package:perfume_app/widgets/my_special_card.dart';

import 'package:perfume_app/widgets/my_title_row.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> brands = [
    'assets/images/Hermes.png',
    'assets/images/Chanel.png',
    'assets/images/jo-malone.png',
    'assets/images/Burberry.png'
  ];

  final List<Map<String, dynamic>> categories = [
    {'name': 'Citrus', 'color': Colors.yellow[200]},
    {'name': 'Aromatic', 'color': Colors.deepPurple[200]},
    {'name': 'Floral', 'color': Colors.pink[200]},
    {'name': 'Green', 'color': Colors.green[200]},
    {'name': 'Woody', 'color': Colors.green[200]},
    {'name': 'Oriental', 'color': Colors.pink[200]},
    {'name': 'Fruity', 'color': Colors.deepPurple[200]},
    {'name': 'Gourmand', 'color': Colors.yellow[200]},
  ];

  final List<Map<String, dynamic>> newArrivals = [
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
  ];

  final List<String> adImages = [
    'assets/images/ad1.png',
    'assets/images/ad2.png',
    'assets/images/ad3.png',
  ];

  final List<String> specialProducts = [
    'assets/images/decosta.png',
    'assets/images/markandvictor.png',
  ];

  final List<Map<String, dynamic>> newProducts = [
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
    {
      'name': 'Les Eaux De Chaneleau Spray',
      'image': 'assets/images/prfume1.png',
      'realprice': '500',
      'offerprice': '484',
      'quantity': 'per Dozen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFEFAFA),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Welcome, ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500)),
                    Text('James!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26)),
                    Spacer(),
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search..',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Scan Here',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.qr_code_scanner_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        MyAdCard(
                          adImage: adImages[0],
                        ),
                        SizedBox(height: 20),
                        MyTitleRow(title: 'Shop by brands'),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: brands.length,
                            itemBuilder: (context, index) {
                              return MyBrandsCard(
                                brandlogo: brands[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        MyTitleRow(title: 'Our Categories'),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 240,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: categories[index]['color'],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                          'assets/images/bottele.png'),
                                    ),
                                    Text(
                                      categories[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        MyAdCard(adImage: adImages[1]),
                        SizedBox(height: 20),
                        MyTitleRow(title: 'New Arrivals'),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 320,
                          child: ListView.builder(
                            itemCount: newArrivals.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: MyProductCards(
                                  image: newArrivals[index]['image'],
                                  name: newArrivals[index]['name'],
                                  realprice: newArrivals[index]['realprice'],
                                  offerprice: newArrivals[index]['offerprice'],
                                  quantity: newArrivals[index]['quantity'],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MySpecialProducts(image: specialProducts[0]),
                            MySpecialProducts(image: specialProducts[1]),
                          ],
                        ),
                        SizedBox(height: 10),
                        MyTitleRow(title: 'Latest Products'),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 320,
                          child: ListView.builder(
                            itemCount: newProducts.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: MyProductCards(
                                  image: newProducts[index]['image'],
                                  name: newProducts[index]['name'],
                                  realprice: newProducts[index]['realprice'],
                                  offerprice: newProducts[index]['offerprice'],
                                  quantity: newProducts[index]['quantity'],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        MyAdCard(adImage: adImages[2]),
                        SizedBox(height: 10),
                        MyTitleRow(title: 'Latest Products'),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 320,
                          child: ListView.builder(
                            itemCount: newProducts.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: MyProductCards(
                                  image: newProducts[index]['image'],
                                  name: newProducts[index]['name'],
                                  realprice: newProducts[index]['realprice'],
                                  offerprice: newProducts[index]['offerprice'],
                                  quantity: newProducts[index]['quantity'],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
