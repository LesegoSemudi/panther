import 'package:flutter/material.dart';
import 'package:panther/Mobile/Widgets/FooterrM.dart';
import 'package:panther/Mobile/Widgets/TeamsMobile.dart';
import 'package:panther/Widgets/NavigationBar.dart' as custom_nav;
import 'package:google_fonts/google_fonts.dart';

class TeamM extends StatefulWidget {
  const TeamM({super.key});

  @override
  State<TeamM> createState() => _TeamMState();
}

class _TeamMState extends State<TeamM> {
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
                      SizedBox(height: 50),
                      Container(
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
                          padding: const EdgeInsets.all(20.0),
                          child: TeamsMobile(),
                        ),
                      ),
                      SizedBox(height: 50),
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
