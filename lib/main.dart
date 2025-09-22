import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:panther/screens/luxury_home_screen.dart';
import 'package:panther/screens/about_page.dart';
import 'package:panther/screens/services_page.dart';
import 'package:panther/screens/gallery_page.dart';
import 'package:panther/screens/contact_page.dart';

void main() {
  runApp(const MyApp());
}

// Custom scroll behavior for faster, smoother scrolling
class FastScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // Enhanced scrollbar for better UX
    return RawScrollbar(
      controller: details.controller,
      thumbVisibility: true,
      thickness: 8.0,
      radius: const Radius.circular(4.0),
      thumbColor: Colors.black.withValues(alpha: 0.3),
      trackColor: Colors.grey.withValues(alpha: 0.1),
      child: child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panther Funerals - Luxury Memorial Services',
      scrollBehavior: FastScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LuxuryHomeScreen(),
        '/about': (context) => const AboutPage(),
        '/services': (context) => const ServicesPage(),
        '/gallery': (context) => const GalleryPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
