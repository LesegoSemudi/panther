import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'luxury_navigation_bar.dart';

class ModernHeroSection extends StatefulWidget {
  const ModernHeroSection({super.key});

  @override
  State<ModernHeroSection> createState() => _ModernHeroSectionState();
}

class _ModernHeroSectionState extends State<ModernHeroSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _floatingController;
  late AnimationController _heartController;
  late AnimationController _memoryController;
  late AnimationController _backgroundController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _heartPulse;
  late Animation<double> _memoryFloat;
  late Animation<double> _backgroundShift;

  // Family silhouette positions
  final List<Offset> _familyPositions = [
    const Offset(0.15, 0.7),
    const Offset(0.25, 0.65),
    const Offset(0.35, 0.75),
    const Offset(0.8, 0.6),
    const Offset(0.9, 0.65),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: AppTheme.heroAnimation,
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _heartController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _memoryController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    _floatingAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _heartPulse = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.easeInOut),
    );

    _memoryFloat = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _memoryController, curve: Curves.easeInOut),
    );

    _backgroundShift = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.linear),
    );

    // Start animations
    _animationController.forward();
    _floatingController.repeat(reverse: true);
    _heartController.repeat(reverse: true);
    _memoryController.repeat(reverse: true);
    _backgroundController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _floatingController.dispose();
    _heartController.dispose();
    _memoryController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Enhanced animated background
          AnimatedBuilder(
            animation: _backgroundController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.primaryBlack,
                      AppTheme.primaryBlack.withValues(alpha: 0.9),
                      AppTheme.luxuryGold.withValues(alpha: 0.7),
                    ],
                    stops: [0.0, 0.6 + _backgroundShift.value * 0.1, 1.0],
                  ),
                ),
              );
            },
          ),

          // Floating memory particles
          ...List.generate(8, (index) {
            return AnimatedBuilder(
              animation: _memoryController,
              builder: (context, child) {
                final delay = index * 0.2;
                final animValue = (_memoryFloat.value + delay) % 1.0;
                return Positioned(
                  left:
                      100 + (index * 180.0) % MediaQuery.of(context).size.width,
                  top:
                      100 +
                      animValue * (MediaQuery.of(context).size.height - 200),
                  child: Opacity(
                    opacity: (1 - animValue) * 0.6,
                    child: Container(
                      width: 4 + (index % 3) * 2,
                      height: 4 + (index % 3) * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.luxuryGold.withValues(alpha: 0.7),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),

          // Family silhouettes
          ...List.generate(_familyPositions.length, (index) {
            return AnimatedBuilder(
              animation: _floatingController,
              builder: (context, child) {
                return Positioned(
                  left:
                      _familyPositions[index].dx *
                      MediaQuery.of(context).size.width,
                  top:
                      _familyPositions[index].dy *
                          MediaQuery.of(context).size.height +
                      (_floatingAnimation.value * (index % 2 == 0 ? 1 : -1)),
                  child: Opacity(
                    opacity: 0.1,
                    child: Icon(
                      index % 2 == 0 ? Icons.person : Icons.family_restroom,
                      size: 40 + (index % 3) * 10,
                      color: AppTheme.softWhite,
                    ),
                  ),
                );
              },
            );
          }),

          // Luxury navigation
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LuxuryNavigationBar(),
          ),

          // Main hero content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Enhanced main title with floating hearts
                          Stack(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'DIGNIFIED\n',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w300,
                                        color: AppTheme.softWhite,
                                        height: 0.9,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'FUNERAL\n',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.luxuryGold,
                                        height: 0.9,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'SERVICES',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w300,
                                        color: AppTheme.softWhite,
                                        height: 0.9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Floating heart animations
                              AnimatedBuilder(
                                animation: _heartController,
                                builder: (context, child) {
                                  return Positioned(
                                    right: -50,
                                    top: 50,
                                    child: Transform.scale(
                                      scale: _heartPulse.value,
                                      child: Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: AppTheme.luxuryGold.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              AnimatedBuilder(
                                animation: _heartController,
                                builder: (context, child) {
                                  return Positioned(
                                    left: -30,
                                    bottom: 30,
                                    child: Transform.scale(
                                      scale: _heartPulse.value * 0.8,
                                      child: Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: AppTheme.luxuryGold.withValues(
                                          alpha: 0.2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // Enhanced subtitle with family focus
                          AnimatedBuilder(
                            animation: _floatingController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  _floatingAnimation.value * 0.3,
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 600,
                                  ),
                                  child: Text(
                                    'Compassionate funeral services that honor life and provide comfort to families during their most difficult times. We offer dignified, professional, and personalized services with the love and care your family deserves.',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.softWhite.withValues(
                                        alpha: 0.9,
                                      ),
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 50),

                          // Enhanced CTA buttons with animations
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: Row(
                              children: [
                                // Primary CTA with heart pulse
                                AnimatedBuilder(
                                  animation: _heartController,
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale:
                                          1.0 + (_heartPulse.value - 1.0) * 0.1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: AppTheme.goldGradient,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppTheme.luxuryGold
                                                  .withValues(alpha: 0.4),
                                              offset: const Offset(0, 8),
                                              blurRadius: 25,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: AppTheme.softWhite,
                                            size: 20,
                                          ),
                                          label: Text(
                                            'Our Services',
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(width: 20),

                                // Secondary CTA
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
                                      Icons.phone,
                                      color: AppTheme.luxuryGold,
                                      size: 20,
                                    ),
                                    label: Text(
                                      'Contact Us',
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Enhanced floating stats with family imagery
          Positioned(
            bottom: 100,
            left: 80,
            right: 80,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFloatingStatCard(
                    '500+',
                    'Families Served',
                    Icons.family_restroom,
                  ),
                  _buildFloatingStatCard(
                    '15+',
                    'Years of Care',
                    Icons.favorite,
                  ),
                  _buildFloatingStatCard(
                    '24/7',
                    'Support Available',
                    Icons.support_agent,
                  ),
                  _buildFloatingStatCard(
                    '100%',
                    'Dedicated Service',
                    Icons.star,
                  ),
                ],
              ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _floatingController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _floatingAnimation.value * 0.3),
                  child: Column(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppTheme.softWhite.withValues(alpha: 0.7),
                        size: 30,
                      ),
                      Text(
                        'Discover Our Services',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.softWhite.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingStatCard(String number, String label, IconData icon) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatingAnimation.value * 0.5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: AppTheme.softWhite.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.3),
                  offset: const Offset(0, 8),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(icon, color: AppTheme.luxuryGold, size: 24),
                const SizedBox(height: 8),
                Text(
                  number,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.luxuryGold,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.softWhite.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
