import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class EnhancedServicesSection extends StatefulWidget {
  const EnhancedServicesSection({super.key});

  @override
  State<EnhancedServicesSection> createState() =>
      _EnhancedServicesSectionState();
}

class _EnhancedServicesSectionState extends State<EnhancedServicesSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _cardController;
  late AnimationController _floatingController;
  late AnimationController _rippleController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _cardScale;
  late Animation<double> _cardFloat;
  late Animation<double> _rippleAnimation;

  final List<ServiceItem> _services = [
    ServiceItem(
      title: 'Traditional Funerals',
      description:
          'Complete traditional funeral services with dignity and respect for your loved ones.',
      icon: Icons.church,
      color: AppTheme.luxuryGold,
      features: [
        'Religious ceremonies',
        'Custom arrangements',
        'Family support',
      ],
    ),
    ServiceItem(
      title: 'Cremation Services',
      description:
          'Professional cremation services with various memorial options available.',
      icon: Icons.local_fire_department,
      color: AppTheme.luxuryGold,
      features: ['Private ceremonies', 'Memorial urns', 'Ash scattering'],
    ),
    ServiceItem(
      title: 'Memorial Services',
      description:
          'Personalized memorial services celebrating the life of your loved one.',
      icon: Icons.photo_album,
      color: AppTheme.luxuryGold,
      features: ['Photo displays', 'Video tributes', 'Memory books'],
    ),
    ServiceItem(
      title: 'Pre-Planning',
      description:
          'Plan ahead to ensure your wishes are honored and ease the burden on family.',
      icon: Icons.schedule,
      color: AppTheme.luxuryGold,
      features: ['Payment plans', 'Detailed planning', 'Peace of mind'],
    ),
    ServiceItem(
      title: 'Grief Support',
      description:
          'Professional counseling and support groups for families in mourning.',
      icon: Icons.support_agent,
      color: AppTheme.luxuryGold,
      features: ['Individual counseling', 'Group therapy', 'Resource library'],
    ),
    ServiceItem(
      title: 'Transportation',
      description:
          'Professional transportation services for all funeral arrangements.',
      icon: Icons.directions_car,
      color: AppTheme.luxuryGold,
      features: ['Hearse services', 'Family transportation', 'Flower car'],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _cardController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _cardScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _cardController, curve: Curves.elasticOut),
    );

    _cardFloat = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() {
    _animationController.forward();
    _cardController.forward();
    _floatingController.repeat(reverse: true);
    _rippleController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cardController.dispose();
    _floatingController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.softWhite,
            AppTheme.lightGray.withValues(alpha: 0.3),
            AppTheme.softWhite,
          ],
        ),
      ),
      child: Column(
        children: [
          // Enhanced section header
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  // Animated service badge
                  AnimatedBuilder(
                    animation: _rippleController,
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          // Ripple effect
                          Transform.scale(
                            scale: _rippleAnimation.value * 2,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppTheme.luxuryGold.withValues(
                                    alpha: (1 - _rippleAnimation.value) * 0.3,
                                  ),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          // Main badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: AppTheme.goldGradient,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: AppTheme.softShadow,
                            ),
                            child: Text(
                              'OUR SERVICES',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.softWhite,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  // Enhanced title with floating elements
                  Stack(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Comprehensive ',
                              style: AppTheme.sectionTitle,
                            ),
                            TextSpan(
                              text: 'Funeral Services\n',
                              style: AppTheme.sectionTitle.copyWith(
                                color: AppTheme.luxuryGold,
                              ),
                            ),
                            TextSpan(
                              text: 'With ',
                              style: AppTheme.sectionTitle,
                            ),
                            TextSpan(
                              text: 'Heart & Dignity',
                              style: AppTheme.sectionTitle.copyWith(
                                color: AppTheme.luxuryGold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Floating hearts
                      AnimatedBuilder(
                        animation: _floatingController,
                        builder: (context, child) {
                          return Positioned(
                            right: -30,
                            top: 20 + _cardFloat.value,
                            child: Icon(
                              Icons.favorite,
                              size: 20,
                              color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                            ),
                          );
                        },
                      ),

                      AnimatedBuilder(
                        animation: _floatingController,
                        builder: (context, child) {
                          return Positioned(
                            left: -20,
                            bottom: 10 - _cardFloat.value,
                            child: Icon(
                              Icons.favorite,
                              size: 16,
                              color: AppTheme.luxuryGold.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Enhanced description
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      'We provide compassionate, professional funeral services tailored to honor your loved ones. Our experienced team ensures every detail is handled with care and dignity.',
                      style: AppTheme.bodyText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 80),

          // Enhanced services grid with animations
          ScaleTransition(
            scale: _cardScale,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 0.85,
              ),
              itemCount: _services.length,
              itemBuilder: (context, index) {
                return _buildEnhancedServiceCard(_services[index], index);
              },
            ),
          ),

          const SizedBox(height: 80),

          // Enhanced CTA section
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryBlack.withValues(alpha: 0.05),
                    AppTheme.luxuryGold.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.luxuryGold.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Need Immediate Assistance?',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlack,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Our compassionate team is available 24/7 to support you during this difficult time.',
                    style: AppTheme.bodyText,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Call now button
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppTheme.goldGradient,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: AppTheme.buttonShadow,
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: AppTheme.softWhite,
                            size: 20,
                          ),
                          label: Text(
                            'Call Now: +27 (0)82 308 98 95',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.softWhite,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Email contact
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.luxuryGold,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.email,
                            color: AppTheme.luxuryGold,
                            size: 20,
                          ),
                          label: Text(
                            'Email Us',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.luxuryGold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedServiceCard(ServiceItem service, int index) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _cardFloat.value * (index % 2 == 0 ? 1 : -1) * 0.5),
          child: MouseRegion(
            onEnter: (_) {
              // Add hover animations if needed
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: service.color.withValues(alpha: 0.1),
                    offset: const Offset(0, 8),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                  ...AppTheme.cardShadow,
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animated icon container
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            service.color,
                            service.color.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: service.color.withValues(alpha: 0.3),
                            offset: const Offset(0, 8),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Icon(
                        service.icon,
                        size: 32,
                        color: AppTheme.softWhite,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Service title
                    Text(
                      service.title,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryBlack,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Service description
                    Text(
                      service.description,
                      style: AppTheme.bodyText,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 20),

                    // Service features
                    ...service.features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: service.color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                feature,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryBlack.withValues(
                                    alpha: 0.8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Learn more button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: service.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: service.color.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Learn More',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: service.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> features;

  ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
  });
}
