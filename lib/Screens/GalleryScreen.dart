import 'package:flutter/material.dart';
import 'package:panther/Mobile/GalleryMobile.dart';
import 'package:panther/Widgets/Gallery.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/footerr.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Widget _buildGalleryMobile() {
    return const GalleryMobile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            if (width < 1024) {
              return _buildGalleryMobile();
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
                            'GALLERY',
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
                          Gallery(),
                          SizedBox(height: 50),
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
