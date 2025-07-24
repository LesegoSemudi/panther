import 'package:flutter/material.dart';
import 'package:panther/Mobile/MobileAbout.dart';
import 'package:panther/Widgets/About2.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/WhyChooseUs2.dart';
import 'package:panther/Widgets/WhyChooseUs3.dart';
import 'package:panther/Widgets/footerr.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Widget _buildMobileAbout() {
    return const MobileAbout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            if (width < 1024) {
              return _buildMobileAbout();
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
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          custom_nav.NavigationBar(),
                          const SizedBox(height: 70),
                          Text(
                            'Learn More About Us',
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
                          const SizedBox(height: 50),
                          About2(),
                          const SizedBox(height: 50),
                          WhyChooseUs2(),
                          const SizedBox(height: 50),
                          WhyChooseUs3(),
                          const SizedBox(height: 50),
                          Footerr(),
                        ],
                      ),
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
