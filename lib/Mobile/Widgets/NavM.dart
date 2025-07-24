import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:panther/Screens/AboutScreen.dart';
import 'package:panther/Screens/ContactScreen.dart';
import 'package:panther/Screens/GalleryScreen.dart';
import 'package:panther/Screens/HomeScreen.dart';
import 'package:panther/Screens/ServicesScreen.dart';
import 'package:panther/Screens/TeamScreen.dart';

class NavM extends StatelessWidget {
  const NavM({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(45, 0, 0, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homescreen()),
                );
              },
              icon: Container(
                height: 60,
                width: 60,
                color: Colors.transparent,
                child: Image.network(
                  'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1752961405/smalllogo_ytthch.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Social Media Icons
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/facebook.svg',
                    height: 22,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/instagram.svg',
                    height: 22,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/tiktok.svg', height: 22),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/whatsapp.svg',
                    height: 22,
                  ),
                ),
              ],
            ),

            // Custom Popup Menu
            PopupMenuButton<int>(
              icon: const Icon(Icons.menu, color: Colors.black87, size: 28),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color.fromARGB(98, 0, 0, 0),
              elevation: 8,
              itemBuilder: (context) => [
                _buildMenuItem(0, Icons.home, 'Home'),
                _buildMenuItem(1, Icons.info_outline, 'About'),
                _buildMenuItem(2, Icons.miscellaneous_services, 'Services'),
                _buildMenuItem(3, Icons.people_outline, 'Team'),
                _buildMenuItem(4, Icons.photo_library_outlined, 'Gallery'),
                _buildMenuItem(5, Icons.mail_outline, 'Contact'),
              ],
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Homescreen()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutScreen()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ServicesScreen()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Teamscreen()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GalleryScreen()),
                    );
                    break;
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ContactScreen()),
                    );
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Custom menu item builder
  PopupMenuItem<int> _buildMenuItem(int value, IconData icon, String text) {
    return PopupMenuItem<int>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
