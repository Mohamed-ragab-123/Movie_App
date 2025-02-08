import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieOnboardingScreen(),
    );
  }
}

class MovieOnboardingScreen extends StatefulWidget {
  const MovieOnboardingScreen({super.key});

  @override
  _MovieOnboardingScreenState createState() => _MovieOnboardingScreenState();
}

class _MovieOnboardingScreenState extends State<MovieOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/OnBoarding2.png',
      'title': 'Discover Movies',
      'description':
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    },
    {
      'image': 'assets/images/OnBoarding3.png',
      'title': 'Explore All Genres',
      'description':
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    },
    {
      'image': 'assets/images/OnBoarding4.png',
      'title': 'Create Watchlists',
      'description':
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    },
    {
      'image': 'assets/images/OnBoarding5.png',
      'title': 'Rate, Review, and Learn',
      'description':
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    },
    {
      'image': 'assets/images/OnBoarding6.png',
      'title': 'Start Watching Now',
      'description': '',
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _showBottomSheet();
      },
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      backgroundColor: const Color(0xFF121312),
      barrierColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                onboardingData[_currentIndex]['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                onboardingData[_currentIndex]['description']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (_currentIndex < onboardingData.length - 1) {
                          setState(() {
                            _currentIndex++;
                          });
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          _showBottomSheet();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF6BD00),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentIndex < onboardingData.length - 1
                            ? 'Next'
                            : 'Finish',
                        style: const TextStyle(
                            color: Color(0xFF121312),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _currentIndex > 0
                      ? Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xFF121312),
                              border: Border.all(
                                  color: const Color(0xFFF6BD00), width: 2),
                              borderRadius: BorderRadius.circular(16)),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentIndex--;
                              });
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.easeInOut,
                              );
                              Navigator.pop(context);
                              _showBottomSheet();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                  color: Color(0xFFF6BD00),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            Navigator.pop(context);
            _showBottomSheet();
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  onboardingData[index]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
