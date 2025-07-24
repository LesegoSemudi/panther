import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/ScrollCounter2.dart';

class WhyChooseUs2 extends StatelessWidget {
  const WhyChooseUs2({super.key});

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
                    ImageIcon(
                      const AssetImage('assets/icons/icon1.png'),
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'STRATEGIC OBJECTIVE',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 30,
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
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/icons/icon1.png'),
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'CLIENT FOCUS',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '• Our clients are the reason for our existence and we therefore always\n'
                  'endevour to delight by exceeding their expectations',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                const ScrollCounter2(), // ⬅️ NEW Counter Widget
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
                'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961408/img10_fc98ek.webp',
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
