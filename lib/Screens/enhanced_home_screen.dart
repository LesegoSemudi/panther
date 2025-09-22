import 'dart:math' show sin;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/luxury_hero_section.dart';
import '../widgets/enhanced_about_section.dart';
import '../widgets/enhanced_services_section.dart';
import 'modern_mobile_home_screen.dart';

class ModernHomeScreen extends StatefulWidget {
  const ModernHomeScreen({super.key});

  @override
  State<ModernHomeScreen> createState() => _ModernHomeScreenState();
}

class _ModernHomeScreenState extends State<ModernHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // If screen width is less than 1024px, show mobile version
        if (constraints.maxWidth < 1024) {
          return const ModernMobileHomeScreen();
        }

        // Desktop version
        return Scaffold(
          backgroundColor: AppTheme.softWhite,
          body: Stack(
            children: [
              // Main Content
              SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Column(
                  children: [
                    // Enhanced Hero Section
                    const EnhancedHeroSection(),

                    // Wave Divider
                    _buildWaveDivider(),

                    // Enhanced About Section
                    const EnhancedAboutSection(),

                    // Wave Divider
                    _buildWaveDivider(),

                    // Enhanced Services Section
                    const EnhancedServicesSection(),

                    // Wave Divider
                    _buildWaveDivider(),

                    // Projects Section
                    _buildProjectsSection(),

                    // Wave Divider
                    _buildWaveDivider(),

                    // Contact Section
                    _buildContactSection(),

                    // Footer
                    _buildFooter(),
                  ],
                ),
              ),

              // Floating Action Button for quick contact
              Positioned(
                bottom: 30,
                right: 30,
                child: _buildFloatingContactButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWaveDivider() {
    return Container(
      height: 100,
      child: CustomPaint(
        painter: WavePainter(),
        size: Size(double.infinity, 100),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
      decoration: const BoxDecoration(color: AppTheme.softWhite),
      child: Column(
        children: [
          // Section header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'OUR WORK',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.luxuryGold,
                letterSpacing: 2.0,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Recent Services & Testimonials',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 60),

          // Projects grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.2,
            children: [
              _buildProjectCard(
                'Traditional Funeral Service',
                'A beautiful celebration of life with family and friends',
                'assets/images/background.webp',
              ),
              _buildProjectCard(
                'Memorial Garden Service',
                'Peaceful outdoor ceremony honoring cherished memories',
                'assets/images/background.webp',
              ),
              _buildProjectCard(
                'Cremation Memorial',
                'Dignified cremation service with personalized touches',
                'assets/images/background.webp',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTheme.bodyText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryBlack, Color(0xFF1a3d2e)],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Contact Us',
            style: GoogleFonts.playfairDisplay(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: AppTheme.softWhite,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Text(
            'We\'re here for you 24/7 during your time of need',
            style: AppTheme.bodyText.copyWith(
              color: AppTheme.softWhite.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 60),

          Row(
            children: [
              // Contact info
              Expanded(
                child: Column(
                  children: [
                    _buildContactInfo(
                      Icons.phone,
                      'Call Us 24/7',
                      '+27 (0)82 308 98 95',
                    ),
                    const SizedBox(height: 30),
                    _buildContactInfo(
                      Icons.email,
                      'Email Us',
                      'info@pantherfunerals.co.za',
                    ),
                    const SizedBox(height: 30),
                    _buildContactInfo(
                      Icons.location_on,
                      'Visit Us',
                      'Johannesburg, South Africa',
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // Contact form
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: AppTheme.softWhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Send us a message', style: AppTheme.cardTitle),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: AppTheme.getInputDecoration('Full Name'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: AppTheme.getInputDecoration('Email'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: AppTheme.getInputDecoration('Phone'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        maxLines: 4,
                        decoration: AppTheme.getInputDecoration('Message'),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: AppTheme.goldGradient,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: AppTheme.buttonShadow,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Send Message',
                            style: AppTheme.buttonText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppTheme.luxuryGold.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: AppTheme.luxuryGold, size: 28),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.softWhite,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppTheme.softWhite.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
      decoration: const BoxDecoration(color: AppTheme.primaryBlack),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and description
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.luxuryGold,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'P',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.luxuryGold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Panther Funerals',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.softWhite,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Providing compassionate funeral services with dignity and respect for over 15 years. We honor life and support families during their most difficult times.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppTheme.softWhite.withValues(alpha: 0.7),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // Quick links
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Links',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.softWhite,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink('Home'),
                    _buildFooterLink('About Us'),
                    _buildFooterLink('Services'),
                    _buildFooterLink('Gallery'),
                    _buildFooterLink('Contact'),
                  ],
                ),
              ),

              // Services
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Services',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.softWhite,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink('Traditional Funerals'),
                    _buildFooterLink('Cremation Services'),
                    _buildFooterLink('Memorial Services'),
                    _buildFooterLink('Pre-Planning'),
                    _buildFooterLink('Grief Support'),
                  ],
                ),
              ),

              // Contact
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Info',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.softWhite,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '+27 (0)82 308 98 95',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppTheme.luxuryGold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'info@pantherfunerals.co.za',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppTheme.softWhite.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Available 24/7',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppTheme.softWhite.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Container(
            height: 1,
            color: AppTheme.softWhite.withValues(alpha: 0.1),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2024 Panther Funerals. All rights reserved.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.softWhite.withValues(alpha: 0.5),
                ),
              ),
              Text(
                'Designed with love and care',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.luxuryGold.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppTheme.softWhite.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingContactButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.goldGradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppTheme.luxuryGold.withValues(alpha: 0.4),
            offset: const Offset(0, 8),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        icon: Icon(Icons.phone, color: AppTheme.softWhite, size: 24),
        label: Text(
          'Call Now',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.softWhite,
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.luxuryGold.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);

    for (double i = 0; i <= size.width; i++) {
      path.lineTo(
        i,
        size.height * 0.7 +
            20 * sin((i / size.width) * 2 * 3.14159) +
            10 * sin((i / size.width) * 4 * 3.14159),
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
