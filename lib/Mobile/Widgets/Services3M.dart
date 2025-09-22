import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services3M extends StatefulWidget {
  const Services3M({super.key});

  @override
  State<Services3M> createState() => _Services3MState();
}

class _Services3MState extends State<Services3M> {
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
                      'EXCELSIOR\n'
                      'VERKEERDEVLEI\n'
                      'WINDBURG\n',
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
                        SizedBox(height: 10),
                        Text(
                          '• PLAN A / PLAN B\n'
                          '• JOINING FEE R50\n'
                          '• FAMILY (21 - 64 YEARS) - R130 / R170\n'
                          '• SINGLE (21 - 64 YEARS) - R120 / R160\n'
                          '• EXTENDED (21 - 64 YEARS) - R40\n'
                          '\n\n\n BENEFITS:\n'
                          '\n• MAIN MEMBER - 1/4 VIEW - PLAN A\n'
                          '• MAIN MEMBER - 1/2 VIEW - PLAN B\n'
                          '• OTHER MEMBERS - FLATLID\n'
                          '• COLD STORAGE, PAPERWORK\n'
                          '• R2000 GROCERY VOUCHER\n'
                          '• GRAVE\n'
                          '• HEARSE\n'
                          '• FAMILY TRANSPORT\n'
                          '• TENT, 50 CHAIRS\n'
                          '• 50 PROGRAMS\n'
                          '• SETUP AT CHURCH/HOME\n AND GRAVESITE\n'
                          '• 1 COFFIN SPRAY\n'
                          '• A3 PHOTO AND FRAME',
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
                          '• 65 - 70 YEARS - R170\n'
                          '• 71 - 80 YEARS - R220\n'
                          '• 81 - 90 YEARS - R250\n'
                          '• 91 - 100 YEARS - R350\n'
                          '• 101 - 115 YEARS - R500\n'
                          '\n\n\n BENEFITS:\n'
                          '\n• CASKET 1/4 VIEW\n'
                          '• COLD STORAGE, PAPERWORK\n'
                          '• R2000 GROCERY VOUCHER\n'
                          '• GRAVE\n'
                          '• HEARSE\n'
                          '• FAMILY TRANSPORT\n'
                          '• TENT, 50 CHAIRS\n'
                          '• 50 PROGRAMS\n'
                          '• SETUP AT CHURCH/HOME\n AND GRAVESITE\n'
                          '• 1 COFFIN SPRAY\n'
                          '• A3 PHOTO AND FRAME',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
