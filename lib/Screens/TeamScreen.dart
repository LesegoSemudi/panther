import 'package:flutter/material.dart';
import 'package:panther/Mobile/TeamM.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';
import 'package:panther/Widgets/Teams.dart';
import 'package:panther/Widgets/footerr.dart';

class Teamscreen extends StatefulWidget {
  const Teamscreen({super.key});

  @override
  State<Teamscreen> createState() => _TeamscreenState();
}

class _TeamscreenState extends State<Teamscreen> {
  Widget _buildTeamM() {
    return const TeamM();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            if (width < 1024) {
              return _buildTeamM();
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
                            'TEAMS',
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
                          SizedBox(height: 50),
                          Container(
                            height: 1000,
                            width: 1100,
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Teams(),
                            ),
                          ),
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
