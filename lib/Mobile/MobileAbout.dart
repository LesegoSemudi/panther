import 'package:flutter/material.dart';
import 'package:panther/Mobile/Widgets/AboutM.dart';
import 'package:panther/Mobile/Widgets/FooterrM.dart';
import 'package:panther/Mobile/Widgets/WhyChooseUs2M.dart';
import 'package:panther/Mobile/Widgets/WhyChooseUs3M.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';

class MobileAbout extends StatefulWidget {
  const MobileAbout({super.key});

  @override
  State<MobileAbout> createState() => _MobileAboutState();
}

class _MobileAboutState extends State<MobileAbout> {
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
                      const SizedBox(height: 50),
                      AboutM(),
                      const SizedBox(height: 50),
                      WhyChooseUs2M(),
                      const SizedBox(height: 50),
                      WhyChooseUs3M(),
                      const SizedBox(height: 50),
                      FooterrM(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
