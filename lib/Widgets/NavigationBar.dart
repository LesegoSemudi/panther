import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:panther/Mobile/Widgets/NavM.dart';
import 'package:panther/Screens/AboutScreen.dart';
import 'package:panther/Screens/ContactScreen.dart';
import 'package:panther/Screens/GalleryScreen.dart';
import 'package:panther/Screens/HomeScreen.dart';
import 'package:panther/Screens/ServicesScreen.dart';
import 'package:panther/Screens/TeamScreen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  Widget _buildNavM() {
    return const NavM();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width < 1024) {
          return _buildNavM();
        }

        return Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            height: 64,
            width: 1000,
            decoration: BoxDecoration(
              color: const Color.fromARGB(45, 0, 0, 0),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(45, 0, 0, 0),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homescreen()),
                      );
                    },
                    icon: Container(
                      height: 50,
                      width: 100,
                      color: Colors.transparent,
                      child: Image.network(
                        'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961405/smalllogo_ytthch.webp',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homescreen()),
                      );
                    },
                    child: ShaderMask(
                      shaderCallback: (bounds) =>
                          LinearGradient(
                            colors: [Colors.red, Colors.amber, Colors.black],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServicesScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Services',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Teamscreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Team',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GalleryScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
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
            ),
          ),
        );
      },
    );
  }
}
