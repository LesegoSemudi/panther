import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Testimonals extends StatelessWidget {
  const Testimonals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
        color: const Color.fromARGB(195, 0, 0, 0),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'TESTIMONIALS',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'What our clients say about us',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white70),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                TestimonialCard(
                  name: 'Lerato M.',
                  imagePath:
                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961102/img1_hy5iye.webp',
                  text:
                      'Panther provided compassionate and professional service during a very difficult time. I’ll always be grateful.',
                ),
                SizedBox(width: 20),
                TestimonialCard(
                  name: 'Thabo K.',
                  imagePath:
                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961102/img1_hy5iye.webp',
                  text:
                      'The attention to detail and genuine care they showed was beyond my expectations. Highly recommended!',
                ),
                SizedBox(width: 20),
                TestimonialCard(
                  name: 'Zanele D.',
                  imagePath:
                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961102/img1_hy5iye.webp',
                  text:
                      'From start to finish, everything was handled with dignity and respect. Thank you, Panther team.',
                ),
                SizedBox(width: 20),
                TestimonialCard(
                  name: 'Zanele D.',
                  imagePath:
                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961102/img1_hy5iye.webp',
                  text:
                      'From start to finish, everything was handled with dignity and respect. Thank you, Panther team.',
                ),
                SizedBox(width: 20),
                TestimonialCard(
                  name: 'Zanele D.',
                  imagePath:
                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961102/img1_hy5iye.webp',
                  text:
                      'From start to finish, everything was handled with dignity and respect. Thank you, Panther team.',
                ),
                SizedBox(width: 20),
                TestimonialCard(
                  name: 'Zanele D.',
                  imagePath:
                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961102/img1_hy5iye.webp',
                  text:
                      'From start to finish, everything was handled with dignity and respect. Thank you, Panther team.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String text;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imagePath), radius: 40),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
