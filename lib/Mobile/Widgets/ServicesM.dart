import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: deprecated_member_use
import 'dart:html' as html;

class ServicesM extends StatefulWidget {
  const ServicesM({super.key});

  @override
  State<ServicesM> createState() => _ServicesMState();
}

class _ServicesMState extends State<ServicesM> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(195, 0, 0, 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961422/img3_pjqdd4.webp',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      'WELKOM\n'
                      'HENNENMAN\n'
                      'ODENDAALSRUS\n'
                      'VIRGINIA',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: 190,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          final url = 'assets/images/Welkom.webp';
                          html.AnchorElement(href: url)
                            ..setAttribute('download', 'Welkom.webp')
                            ..click();
                        },
                        child: Text(
                          'Download Brochure',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'CASH PAY OUT OF R7500 IF WE DONT DO THE FUNERAL',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      'More About This Package',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BURIAL PACKAGE',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '• 1 + 5 (0 - 64 YEARS) - R300\n'
                          '• 1 + 9 (0 - 64 YEARS) - R350\n'
                          '\n• 6 / 10 OPEN FACE CASKETS\n'
                          '• R3000 GROCERY VOUCHER\n'
                          '• R100 AIRTIME VOUCHER\n'
                          '• COLD STORAGE\n'
                          '• HEARSE\n'
                          '• 2 FAMILY CARS\n'
                          '• TENT\n'
                          '• 2 STEEL TABLES\n'
                          '• 50 CHAIRS\n'
                          '• 50 PROGRAMS\n'
                          '• GRAVE BUILD OUT - 2 LINES ON\n'
                          '   SURFACE NOT FROM BOTTOM\n'
                          '• SETUP AT CHURCH/HOME\n AND GRAVESITE\n'
                          '• 1 COFFIN SPRAY\n'
                          '• A3 PHOTO AND FRAME\n'
                          '• GRANITE GRAVE MARKER',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 9,
                              color: Color.fromARGB(255, 194, 194, 194),
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PENSIONER\n BURIAL PACKAGE',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '• PENSIONER A (65 - 74 YEARS) - R260\n'
                          '• PENSIONER B (75 - 84 YEARS) - R300\n'
                          '• PENSIONER C (85 YEARS + ) - R350\n'
                          '\n• 1 OPEN FACE CASKET\n'
                          '• R3000 GROCERY VOUCHER\n'
                          '• R100 AIRTIME VOUCHER\n'
                          '• COLD STORAGE\n'
                          '• HEARSE\n'
                          '• 2 FAMILY CARS\n'
                          '• TENT\n'
                          '• 2 STEEL TABLES\n'
                          '• 50 CHAIRS\n'
                          '• 50 PROGRAMS\n'
                          '• GRAVE BUILD OUT - 2 LINES ON\n'
                          '   SURFACE NOT FROM BOTTOM\n'
                          '• SETUP AT CHURCH/HOME\n AND GRAVESITE\n'
                          '• 1 COFFIN SPRAY\n'
                          '• A3 PHOTO AND FRAME\n'
                          '• GRANITE GRAVE MARKER',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 9,
                              color: Color.fromARGB(255, 194, 194, 194),
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'OUR ADDITIONAL PACKAGE',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'GROCERIES & SHEEP',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '• 1 + 9 (18 - 74 YEARS) - R250',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 194, 194, 194),
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      children: [
                        Text(
                          'BEEF STEW COVER - R5000',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '• 1 + 9 (18 - 74 YEARS) - R310',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 194, 194, 194),
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
