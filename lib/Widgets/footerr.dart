import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Screens/AboutScreen.dart';
import 'package:panther/Screens/ContactScreen.dart';
import 'package:panther/Screens/GalleryScreen.dart';
import 'package:panther/Screens/HomeScreen.dart';
import 'package:panther/Screens/ServicesScreen.dart';

class Footerr extends StatelessWidget {
  const Footerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 1000,
      decoration: BoxDecoration(
        color: const Color.fromARGB(36, 0, 0, 0),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(36, 0, 0, 0),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961404/logo_abnmvv.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Opening Hours:\n'
                  'Mon - Fri: 8AM - 5PM\n'
                  'Closed on Sat-Sun\n',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(width: 20),
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Get In Touch',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded),
                    Text(
                      '347 STATEWAY ROAD WELKOM, 9459',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone_iphone_rounded),
                    Text(
                      '082 593 9813 // 081 040 784',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.email_rounded),
                    Text(
                      'info@pantherfunerals.co.za',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/facebook.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/instagram.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/tiktok.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/whatsapp.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 20),
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Quick Links',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded, size: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Homescreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Home',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded, size: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'About Us',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded, size: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Our Services',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded, size: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GalleryScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Gallery',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded, size: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Contact Us',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
