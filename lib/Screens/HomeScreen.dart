import 'package:flutter/material.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/ImageSlide.dart';
import 'package:panther/Widgets/Dignity.dart';
import 'package:panther/Widgets/WhyChooseUs.dart';
import 'package:panther/Widgets/footerr.dart';
import 'package:panther/Widgets/Testimonals.dart';
import 'package:panther/Mobile/MobileHome.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Widget _buildMobileHome() {
    return const MobileHome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            if (width < 1024) {
              return _buildMobileHome();
            }

            return SizedBox.expand(
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
                                colors: [
                                  Colors.red,
                                  Colors.amber,
                                  Colors.black,
                                ],
                              ).createShader(
                                Rect.fromLTWH(
                                  0,
                                  0,
                                  bounds.width,
                                  bounds.height,
                                ),
                              ),
                          child: Text(
                            'PANTHER FUNERAL PARLOUR',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 40,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(134, 0, 0, 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 800,
                              height: 300,
                              child: Column(
                                children: [
                                  Text(
                                    'LEARN MORE ABOUT US',
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961394/img2_g3hhcn.webp',
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Dignity(),
                        const SizedBox(height: 50),
                        WhyChooseUs(),
                        const SizedBox(height: 50),
                        Testimonals(),
                        const SizedBox(height: 50),
                        Footerr(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
