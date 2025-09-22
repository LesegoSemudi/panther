import 'dart:math' show sin;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/luxury_hero_section.dart';
import '../widgets/enhanced_about_section.dart';
import '../widgets/enhanced_services_section.dart';
import '../widgets/advanced_animations.dart';
import 'modern_mobile_home_screen.dart';

class LuxuryHomeScreen extends StatefulWidget {
  const LuxuryHomeScreen({super.key});

  @override
  State<LuxuryHomeScreen> createState() => _LuxuryHomeScreenState();
}

class _LuxuryHomeScreenState extends State<LuxuryHomeScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AutoScrollController _autoScrollController;
  late AnimationController _revealController;
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _autoScrollController = AutoScrollController(
      scrollController: _scrollController,
      scrollDuration: const Duration(seconds: 40),
      pauseDuration: const Duration(seconds: 8),
    );

    _revealController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Auto-scroll disabled for manual control
    // Future.delayed(const Duration(seconds: 10), () {
    //   if (mounted) {
    //     _autoScrollController.startAutoScroll();
    //   }
    // });

    // Listen to scroll position for reveal animations
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrollOffset = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;

    if (scrollOffset > 200 &&
        _revealController.status == AnimationStatus.dismissed) {
      _revealController.forward();
    }
  }

  @override
  void dispose() {
    _autoScrollController.dispose();
    _revealController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    // Auto-scroll disabled - only manual navigation
    // _autoScrollController.stopAutoScroll();
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    }
    // Auto-scroll restart disabled for manual control
    // Future.delayed(const Duration(seconds: 15), () {
    //   if (mounted) {
    //     _autoScrollController.startAutoScroll();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1024) {
          return const ModernMobileHomeScreen();
        }

        return Scaffold(
          backgroundColor: AppTheme.primaryBlack,
          floatingActionButton: _buildQuickNavigation(),
          body: GoldenParticleSystem(
            particleCount: 15,
            isActive: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  // Hero Section
                  Container(key: _heroKey, child: const EnhancedHeroSection()),

                  // Auto-reveal divider
                  _buildAutoRevealDivider(),

                  // About Section
                  Container(
                    key: _aboutKey,
                    child: _buildAutoRevealSection(
                      const EnhancedAboutSection(),
                      delay: const Duration(milliseconds: 200),
                    ),
                  ),

                  // Wave Divider
                  _buildWaveDivider(),

                  // Services Section
                  Container(
                    key: _servicesKey,
                    child: _buildAutoRevealSection(
                      const EnhancedServicesSection(),
                      delay: const Duration(milliseconds: 400),
                    ),
                  ),

                  // Gallery Section
                  Container(
                    key: _galleryKey,
                    child: _buildAutoRevealSection(
                      _buildGallerySection(),
                      delay: const Duration(milliseconds: 600),
                    ),
                  ),

                  // Contact Section
                  Container(
                    key: _contactKey,
                    child: _buildAutoRevealSection(
                      _buildContactSection(),
                      delay: const Duration(milliseconds: 800),
                    ),
                  ),

                  // Footer
                  _buildFooter(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickNavigation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          onPressed: () => _scrollToSection(_heroKey),
          backgroundColor: AppTheme.luxuryGold,
          foregroundColor: AppTheme.primaryBlack,
          heroTag: "hero",
          child: const Icon(Icons.home),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.small(
          onPressed: () => _scrollToSection(_aboutKey),
          backgroundColor: AppTheme.luxuryGold,
          foregroundColor: AppTheme.primaryBlack,
          heroTag: "about",
          child: const Icon(Icons.info),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.small(
          onPressed: () => _scrollToSection(_servicesKey),
          backgroundColor: AppTheme.luxuryGold,
          foregroundColor: AppTheme.primaryBlack,
          heroTag: "services",
          child: const Icon(Icons.miscellaneous_services),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.small(
          onPressed: () => _scrollToSection(_galleryKey),
          backgroundColor: AppTheme.luxuryGold,
          foregroundColor: AppTheme.primaryBlack,
          heroTag: "gallery",
          child: const Icon(Icons.photo_library),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.small(
          onPressed: () => _scrollToSection(_contactKey),
          backgroundColor: AppTheme.luxuryGold,
          foregroundColor: AppTheme.primaryBlack,
          heroTag: "contact",
          child: const Icon(Icons.contact_mail),
        ),
      ],
    );
  }

  Widget _buildAutoRevealSection(Widget child, {required Duration delay}) {
    return AnimatedBuilder(
      animation: _revealController,
      builder: (context, _) {
        return AnimatedOpacity(
          opacity: _revealController.value,
          duration: Duration(milliseconds: 500 + delay.inMilliseconds),
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - _revealController.value)),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildAutoRevealDivider() {
    return AnimatedBuilder(
      animation: _revealController,
      builder: (context, _) {
        return Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.primaryBlack,
                AppTheme.luxuryGold.withValues(
                  alpha: _revealController.value * 0.3,
                ),
                AppTheme.primaryBlack,
              ],
            ),
          ),
          child: CustomPaint(
            painter: GoldenWavePainter(_revealController.value),
          ),
        );
      },
    );
  }

  Widget _buildWaveDivider() {
    return Container(
      height: 100,
      width: double.infinity,
      child: CustomPaint(painter: LuxuryWavePainter()),
    );
  }

  Widget _buildGallerySection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.pureWhite, AppTheme.lightGray],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Our Memorials',
            style: AppTheme.sectionTitle.copyWith(color: AppTheme.primaryBlack),
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return _buildGalleryItem(index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(int index) {
    return LiquidFillAnimation(
      liquidColor: AppTheme.luxuryGold,
      fillPercentage: 0.3,
      duration: Duration(seconds: 2 + index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppTheme.mediumRadius,
          color: AppTheme.charcoalGray.withValues(alpha: 0.1),
          border: Border.all(
            color: AppTheme.luxuryGold.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo, size: 60, color: AppTheme.luxuryGold),
            const SizedBox(height: 16),
            Text(
              'Memorial ${index + 1}',
              style: AppTheme.cardTitle.copyWith(color: AppTheme.primaryBlack),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: const BoxDecoration(gradient: AppTheme.blackGoldGradient),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: AppTheme.sectionTitle.copyWith(
                    color: AppTheme.pureWhite,
                  ),
                ),
                const SizedBox(height: 40),
                _buildContactInfo(),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Expanded(child: _buildContactForm()),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          Icons.phone,
          '24/7 Emergency Line',
          '+27 11 123 4567',
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          Icons.email,
          'Email Us',
          'info@pantherfunerals.co.za',
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          Icons.location_on,
          'Visit Us',
          '123 Memorial Street, Johannesburg',
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            _buildSocialButton(Icons.facebook),
            const SizedBox(width: 16),
            _buildSocialButton(Icons.camera_alt),
            const SizedBox(width: 16),
            _buildSocialButton(Icons.message),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.luxuryGold.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppTheme.luxuryGold, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTheme.cardTitle.copyWith(
                color: AppTheme.pureWhite,
                fontSize: 16,
              ),
            ),
            Text(
              subtitle,
              style: AppTheme.bodyText.copyWith(
                color: AppTheme.pureWhite.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.luxuryGold,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppTheme.primaryBlack, size: 20),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppTheme.pureWhite,
        borderRadius: AppTheme.largeRadius,
        boxShadow: AppTheme.hoverShadow,
      ),
      child: Column(
        children: [
          Text(
            'Get in Touch',
            style: AppTheme.modernTitle.copyWith(color: AppTheme.primaryBlack),
          ),
          const SizedBox(height: 32),
          TextField(decoration: AppTheme.getInputDecoration('Your Name')),
          const SizedBox(height: 20),
          TextField(decoration: AppTheme.getInputDecoration('Your Email')),
          const SizedBox(height: 20),
          TextField(
            maxLines: 4,
            decoration: AppTheme.getInputDecoration('Your Message'),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: AppTheme.accentButton,
              child: Text(
                'Send Message',
                style: AppTheme.buttonText.copyWith(
                  color: AppTheme.primaryBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlack,
        border: Border(
          top: BorderSide(
            color: AppTheme.luxuryGold.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Panther Funerals',
                    style: AppTheme.modernTitle.copyWith(
                      color: AppTheme.luxuryGold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Honoring memories with dignity and compassion',
                    style: AppTheme.bodyText.copyWith(
                      color: AppTheme.pureWhite.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Links',
                    style: AppTheme.cardTitle.copyWith(
                      color: AppTheme.luxuryGold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFooterLink('Our Services'),
                  _buildFooterLink('About Us'),
                  _buildFooterLink('Contact'),
                  _buildFooterLink('Emergency'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            height: 1,
            color: AppTheme.luxuryGold.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 20),
          Text(
            '© 2024 Panther Funerals. All rights reserved.',
            style: AppTheme.smallText.copyWith(
              color: AppTheme.pureWhite.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppTheme.bodyText.copyWith(
          color: AppTheme.pureWhite.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}

// Custom Painters for Wave Effects
class GoldenWavePainter extends CustomPainter {
  final double animationValue;

  GoldenWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.luxuryGold.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = 20 * animationValue;
    final waveLength = size.width / 4;

    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= size.width; x += 1) {
      final y =
          size.height / 2 +
          sin((x / waveLength * 2 * 3.14159) + (animationValue * 6.28)) *
              waveHeight;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class LuxuryWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          AppTheme.luxuryGold.withValues(alpha: 0.8),
          AppTheme.elegantYellow.withValues(alpha: 0.6),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);

    for (double x = 0; x <= size.width; x += 1) {
      final y = size.height * 0.7 + sin(x / 50) * 15;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
