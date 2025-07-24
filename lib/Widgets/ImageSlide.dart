import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageSlide extends StatefulWidget {
  const ImageSlide({super.key});

  @override
  State<ImageSlide> createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlide> {
  int _currentIndex = 0;

  final List<Map<String, String>> slides = [
    {
      'image':
          'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961388/img1_cks3jq.webp',
      'caption': 'Dignified Funeral Services',
      'heading': 'We Provide',
    },
    {
      'image':
          'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961394/img2_g3hhcn.webp',
      'caption': 'Quality service to those we serve',
      'heading': 'Funeral Services',
    },
    {
      'image':
          'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961422/img3_pjqdd4.webp',
      'caption': 'Quality Burial Service',
      'heading': 'Innovative solutions',
    },
  ];

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: slides.length,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AnimatedOpacity(
                      opacity: _currentIndex == index ? 1.0 : 0.3,
                      duration: const Duration(milliseconds: 2000),
                      child: Image.network(
                        slides[index]['image']!,
                        fit: BoxFit.cover,
                        width: 1200,
                        height: 1100,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            height: 500,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: true,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            slides[_currentIndex]['heading']!,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.red, Colors.amber, Colors.black],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Text(
            slides[_currentIndex]['caption']!,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: slides.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _currentIndex == entry.key ? 12.0 : 8.0,
                height: _currentIndex == entry.key ? 12.0 : 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.black
                      : const Color.fromARGB(255, 204, 14, 0),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
