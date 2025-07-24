import 'package:flutter/material.dart';
import 'package:panther/Mobile/Widgets/DignityM.dart';
import 'package:panther/Mobile/Widgets/FooterrM.dart';
import 'package:panther/Mobile/Widgets/TestimonalsM.dart';
import 'package:panther/Mobile/Widgets/WhyChooseUsM.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/ImageSlide.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          // This ensures the Stack takes full screen
          child: Stack(
            children: [
              // ✅ Background image (fullscreen)
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background.webp',
                  fit: BoxFit.cover,
                ),
              ),

              // ✅ Scrollable foreground content
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    custom_nav.NavigationBar(),
                    const SizedBox(height: 70),
                    Text(
                      'WELCOME TO',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [Colors.red, Colors.amber, Colors.black],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: Text(
                        'PANTHER\n FUNERAL PARLOUR',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const ImageSlide(),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(134, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  'LEARN MORE ABOUT US',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                  indent: 50,
                                  endIndent: 50,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Panther Funeral Parlour is the undertaker of choice. We are an innovative, professional and knowledgeable funeral undertaker to clients in South Africa. We differentiate ourselves by the high reliability of our funeral and repatriation services to satisfy our customers’ needs.\n\n We continue to focus our time on enhancing our role and position in the business environment in this manner. We are committed in conducting our business in a professional, transparent and ethical manner at all times. We value the loyalty of our clients, employees and shareholders. For our clients, we will continue to provide the best service and value for money.',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961394/img2_g3hhcn.webp',
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    DignityM(),
                    const SizedBox(height: 50),
                    WhyChooseUsM(),
                    const SizedBox(height: 50),
                    TestimonalsM(),
                    const SizedBox(height: 50),
                    FooterrM(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
