import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ModernServicesSection extends StatefulWidget {
  const ModernServicesSection({super.key});

  @override
  State<ModernServicesSection> createState() => _ModernServicesSectionState();
}

class _ModernServicesSectionState extends State<ModernServicesSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _hoverController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.heroAnimation,
      vsync: this,
    );

    _hoverController = AnimationController(
      duration: AppTheme.fastAnimation,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.8, curve: Curves.elasticOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
          ),
        );
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.softWhite, AppTheme.lightGray.withValues(alpha: 0.3)],
        ),
      ),
      child: VisibilityDetector(
        key: const Key('services-section'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.3) {
            _startAnimation();
          }
        },
        child: Column(
          children: [
            // Section Header
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.luxuryGold.withValues(alpha: 0.1),
                          borderRadius: AppTheme.smallRadius,
                        ),
                        child: Text(
                          'OUR SERVICES',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.luxuryGold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Comprehensive Funeral Services',
                        style: AppTheme.sectionTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          'We provide a full range of professional funeral services designed to honor your loved ones with dignity and compassion.',
                          style: AppTheme.bodyText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 80),

            // Circular Services Layout
            AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Container(
                  width: 600,
                  height: 600,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Center circle
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.goldGradient,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                              offset: const Offset(0, 20),
                              blurRadius: 40,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 50,
                              color: AppTheme.softWhite,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'COMPASSIONATE',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.softWhite,
                                letterSpacing: 1.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'CARE',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.softWhite,
                                letterSpacing: 1.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      // Service items in circle
                      ..._buildServiceItems(_rotationAnimation.value),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 80),

            // Additional Services Grid
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      children: [
                        Text(
                          'Additional Services',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryBlack,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              child: _buildServiceCard(
                                'Pre-Planning',
                                'Plan ahead to ease the burden on your family',
                                Icons.calendar_today,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: _buildServiceCard(
                                'Grief Support',
                                'Counseling and support during difficult times',
                                Icons.support_agent,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: _buildServiceCard(
                                'Memorial Products',
                                'Beautiful keepsakes to honor memories',
                                Icons.card_giftcard,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildServiceItems(double animationValue) {
    final services = [
      ServiceItem(title: 'Traditional\nFunerals', icon: Icons.church, angle: 0),
      ServiceItem(
        title: 'Cremation\nServices',
        icon: Icons.local_fire_department,
        angle: 60,
      ),
      ServiceItem(
        title: 'Memorial\nServices',
        icon: Icons.photo_album,
        angle: 120,
      ),
      ServiceItem(
        title: 'Transportation',
        icon: Icons.directions_car,
        angle: 180,
      ),
      ServiceItem(title: 'Documentation', icon: Icons.description, angle: 240),
      ServiceItem(
        title: 'Flowers &\nArrangements',
        icon: Icons.local_florist,
        angle: 300,
      ),
    ];

    return services.map((service) {
      final radians = (service.angle * 3.14159) / 180;
      final radius = 250.0;
      final x = radius * math.cos(radians);
      final y = radius * math.sin(radians);

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.elasticOut,
        left: 300 + (x * animationValue) - 50,
        top: 300 + (y * animationValue) - 50,
        child: _buildCircularServiceItem(service),
      );
    }).toList();
  }

  Widget _buildCircularServiceItem(ServiceItem service) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.softWhite,
        border: Border.all(
          color: AppTheme.luxuryGold.withValues(alpha: 0.3),
          width: 2,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(service.icon, size: 24, color: AppTheme.luxuryGold),
          const SizedBox(height: 4),
          Text(
            service.title,
            style: GoogleFonts.inter(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppTheme.softWhite,
        borderRadius: AppTheme.largeRadius,
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.1),
              borderRadius: AppTheme.mediumRadius,
            ),
            child: Icon(icon, size: 30, color: AppTheme.luxuryGold),
          ),
          const SizedBox(height: 20),
          Text(title, style: AppTheme.cardTitle),
          const SizedBox(height: 10),
          Text(description, style: AppTheme.bodyText),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Learn More',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.luxuryGold,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppTheme.luxuryGold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final IconData icon;
  final double angle;

  ServiceItem({required this.title, required this.icon, required this.angle});
}

// Simplified visibility detector
class VisibilityDetector extends StatefulWidget {
  final Key key;
  final Widget child;
  final Function(VisibilityInfo) onVisibilityChanged;

  const VisibilityDetector({
    required this.key,
    required this.child,
    required this.onVisibilityChanged,
  }) : super(key: key);

  @override
  State<VisibilityDetector> createState() => _VisibilityDetectorState();
}

class _VisibilityDetectorState extends State<VisibilityDetector> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onVisibilityChanged(VisibilityInfo(visibleFraction: 0.5));
    });

    return widget.child;
  }
}

class VisibilityInfo {
  final double visibleFraction;

  VisibilityInfo({required this.visibleFraction});
}
