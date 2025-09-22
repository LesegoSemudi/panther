import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/ScrollCounter.dart';

class WhyChooseUs extends StatelessWidget {
  const WhyChooseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 800,
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
                  'WHY CHOOSE US?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/BusinessN.svg',
                      height: 70,
                      width: 70,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '10 Years of Experience',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '• To build a positive relationship with our clients\n'
                  '• To build sustainable business principles which support the Panther\n'
                  '   Funeral Parlour objective ie economic growth in South Africa.\n'
                  '• To implement processes to improve the efficiency and effectiveness of\n'
                  '  the company',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                const ScrollCounter(), // ⬅️ NEW Counter Widget
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961107/img9_rqlezh.webp',
                fit: BoxFit.cover,
                width: 500,
                height: 600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
