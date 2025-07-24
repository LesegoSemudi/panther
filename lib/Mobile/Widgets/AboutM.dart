import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutM extends StatefulWidget {
  const AboutM({super.key});

  @override
  State<AboutM> createState() => _AboutMState();
}

class _AboutMState extends State<AboutM> {
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
                    'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961292/about_pyovvt.webp',
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
                    SvgPicture.asset(
                      'assets/icons/ribbon.svg',
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                    Text(
                      '10\n YEARS OF\n EXPERIENCE',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 50,
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

                    const SizedBox(height: 40),
                    Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 0, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'More Services',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LEARN MORE ABOUT US',
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/icons/icon1.png'),
                        color: Colors.white,
                        size: 25,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Panther Funeral Parlour',
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
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Divider(color: Colors.white, thickness: 2),
                  Text(
                    'Is the undertaker of choice. We are an innovative, professional and\n'
                    'knowledgeable funeral undertaker to clients in South Africa. We differentiate\n'
                    'ourselves by the high reliability of our funeral and repatriation services to\n'
                    'satisfy our customers’needs.\n'
                    '\nWe continue to focus our time on enhancing our role and position in the\n'
                    'business environment in this manner. We are committed in conducting our\n'
                    'business in a professional, transparent and ethical manner at all times. We\n'
                    'value the loyalty of our clients, employees and shareholders. For our clients, we\n'
                    'will continue to provide the best service and value for money.',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 15,
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
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
