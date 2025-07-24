import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyChooseUs3 extends StatelessWidget {
  const WhyChooseUs3({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961289/blog-1_eknta0.webp',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'INTERGRITY',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'We adhere to the highest standards of\n'
              'conduct and moral behavior and maintain\n'
              'the highest level of ethics in all our actions.',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961263/blog-2_ht3yzw.webp',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'EXCELLENCE',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'We always strive for excellence in all we do.',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961263/blog-3_reowbi.webp',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'TEAM WORK',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'We jointly take responsibility through\n'
              'teamwork',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
