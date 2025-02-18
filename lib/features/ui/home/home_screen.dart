import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_manger.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedBottomNavIndex = 0;

  final List<String> movieImages = [
    'assets/images/Captain America.png',
    'assets/images/Iron Man.png',
    'assets/images/1917.png',
    'assets/images/joker.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(9),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: BottomNavigationBar(
            currentIndex: _selectedBottomNavIndex,
            onTap: (index) {
              setState(() {
                _selectedBottomNavIndex = index;
              });
            },
            backgroundColor: const Color(0xff282A28),
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white54,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetManger.iconHome)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetManger.iconSearch)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetManger.iconExplore)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetManger.iconProfile)),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 645,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 645,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(movieImages[_currentIndex]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x00282A28),
                            Color(0xff121312),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Watch Now.png',
                        width: 354,
                        height: 146,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Available Now.png',
                        width: 267,
                        height: 93,
                      ),
                    ),
                  ),
                  Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 351,
                        enlargeCenterPage: true,
                        viewportFraction: 0.6,
                        aspectRatio: double.infinity,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: movieImages.map((imagePath) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.fill,
                                width: 234,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "7.7",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    ImageIcon(
                                      AssetImage(AssetManger.iconStar),
                                      color: Colors.amber,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xff121312),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Action",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text(
                                "See More",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              ImageIcon(
                                AssetImage(AssetManger.iconArrow),
                                color: AppColors.yellowColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        buildSmallPoster(
                            'assets/images/Captain America.png', '7.7'),
                        const SizedBox(width: 16),
                        buildSmallPoster('assets/images/1917.png', '7.7'),
                        const SizedBox(width: 16),
                        buildSmallPoster('assets/images/Iron Man.png', '7.7'),
                        const SizedBox(width: 16),
                        buildSmallPoster('assets/images/joker.png', '7.7'),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: const Color(0xff121312),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Action",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text(
                                "See More",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              ImageIcon(
                                AssetImage(AssetManger.iconArrow),
                                color: AppColors.yellowColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        buildSmallPoster(
                            'assets/images/Captain America.png', '7.7'),
                        const SizedBox(width: 16),
                        buildSmallPoster('assets/images/1917.png', '7.7'),
                        const SizedBox(width: 16),
                        buildSmallPoster('assets/images/Iron Man.png', '7.7'),
                        const SizedBox(width: 16),
                        buildSmallPoster('assets/images/joker.png', '7.7'),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSmallPoster(String path, String rating) {
  return SizedBox(
    width: 146,
    height: 220,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: 146,
            height: 220,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 4),
                Text(
                  rating,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
