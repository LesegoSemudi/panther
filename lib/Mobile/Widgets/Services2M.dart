import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services2M extends StatefulWidget {
  const Services2M({super.key});

  @override
  State<Services2M> createState() => _Services2MState();
}

class _Services2MState extends State<Services2M> {
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
                      'RUSTENBURG\n'
                      'PHATSIMA\n'
                      'MARIKANA\n'
                      'WONDERKOP\n'
                      '& OTHER\n',
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
                          // TODO: Implement cross-platform file download
                          // For now, show a snackbar indicating the feature is being developed
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Download feature coming soon!'),
                            ),
                          );
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

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/icons/icon1.png'),
                      color: Colors.white,
                      size: 15,
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

                Row(
                  children: [
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
                        SizedBox(height: 10),
                        Text(
                          '• R260 PER MONTH\n'
                          '• 1 + 9 MEMBERS\n'
                          '• 3 MONTHS WAITING PERIOD\n'
                          '\n\n\n BENEFITS:\n'
                          '\n• COLD STORAGE, PAPERWORK\n'
                          '• R1500 GROCERY VOUCHER\n'
                          '• HEARSE\n'
                          '• FAMILY CAR\n'
                          '• TENT, 50 CHAIRS, 2X TABLES\n'
                          '   OR R1000\n'
                          '• 50 PROGRAMS\n'
                          '• SETUP AT CHURCH/HOME\n AND GRAVESITE\n'
                          '• 1 COFFIN SPRAY\n',
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
                    const SizedBox(width: 10),
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
                        const SizedBox(height: 10),
                        Text(
                          '• R160 PER MONTH\n'
                          '• 1 + 5 MEMBERS\n'
                          '• 3 MONTHS WAITING PERIOD\n'
                          '\n\n\n BENEFITS:\n'
                          '\n• COLD STORAGE, PAPERWORK\n'
                          '• R1500 GROCERY VOUCHER\n'
                          '• HEARSE\n'
                          '• FAMILY CAR\n'
                          '• TENT, 50 CHAIRS, 2X TABLES\n'
                          '   OR R1000\n'
                          '• 50 PROGRAMS\n'
                          '• SETUP AT CHURCH/HOME\n AND GRAVESITE\n'
                          '• 1 COFFIN SPRAY\n',
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
                const SizedBox(height: 30),
                Text(
                  'OUR ADDITIONAL PACKAGE\n'
                  '1 + 9 MEMBERS (6 MONTHS WAITING PERIOD)',
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
                const SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'MEAT COVER - R5000',
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
                          '• COST: R250 PER MONTH\n',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 11,
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
                          'GROCERY PACKAGE - R3000',
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
                          '• COST: R150 PER MONTH',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 11,
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
