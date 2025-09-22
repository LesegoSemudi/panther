import 'dart:math' show cos, sin;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class EnhancedAboutSection extends StatefulWidget {
  const EnhancedAboutSection({super.key});

  @override
  State<EnhancedAboutSection> createState() => _EnhancedAboutSectionState();
}

class _EnhancedAboutSectionState extends State<EnhancedAboutSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late AnimationController _heartController;
  late AnimationController _memoryController;
  late AnimationController _compassionController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _heartFloat;
  late Animation<double> _memoryGlow;
  late Animation<double> _compassionRipple;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _heartController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _memoryController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _compassionController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.3, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _heartFloat = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.easeInOut),
    );

    _memoryGlow = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _memoryController, curve: Curves.easeInOut),
    );

    _compassionRipple = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _compassionController, curve: Curves.easeOut),
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() {
    _animationController.forward();
    _pulseController.repeat(reverse: true);
    _heartController.repeat(reverse: true);
    _memoryController.repeat(reverse: true);
    _compassionController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    _heartController.dispose();
    _memoryController.dispose();
    _compassionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.softWhite, Color(0xFFF8FDF8), AppTheme.softWhite],
        ),
      ),
      child: Row(
        children: [
          // Enhanced Left Side - Emotional Circular Element
          Expanded(
            flex: 2,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: SizedBox(
                    height: 500,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Compassion ripples
                        ...List.generate(3, (index) {
                          return AnimatedBuilder(
                            animation: _compassionController,
                            builder: (context, child) {
                              final delay = index * 0.3;
                              final animValue =
                                  (_compassionRipple.value + delay) % 1.0;
                              return Transform.scale(
                                scale: animValue * 2,
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppTheme.luxuryGold.withValues(
                                        alpha: (1 - animValue) * 0.3,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),

                        // Memory glow effect
                        AnimatedBuilder(
                          animation: _memoryController,
                          builder: (context, child) {
                            return Container(
                              width: 380,
                              height: 380,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    AppTheme.luxuryGold.withValues(
                                      alpha: _memoryGlow.value * 0.1,
                                    ),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        // Floating heart elements
                        ...List.generate(6, (index) {
                          final angle = (index * 60.0) * (3.14159 / 180);
                          return AnimatedBuilder(
                            animation: _heartController,
                            builder: (context, child) {
                              return Positioned(
                                left:
                                    250 +
                                    (120 * (index % 2 == 0 ? 1 : 0.8)) *
                                        (1 + _heartFloat.value * 0.01) *
                                        (index % 2 == 0 ? 1 : -1) +
                                    180 * cos(angle),
                                top:
                                    250 +
                                    (120 * (index % 2 == 0 ? 1 : 0.8)) *
                                        (1 + _heartFloat.value * 0.01) *
                                        (index % 2 == 0 ? 1 : -1) +
                                    180 * sin(angle),
                                child: Transform.scale(
                                  scale: 0.8 + (_heartFloat.value + 8) / 32,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 12 + (index % 3) * 4,
                                    color: AppTheme.luxuryGold.withValues(
                                      alpha: 0.4 - (index % 3) * 0.1,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),

                        // Main enhanced circular element
                        AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _pulseAnimation.value,
                              child: Container(
                                width: 320,
                                height: 320,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppTheme.luxuryGold,
                                      AppTheme.luxuryGold,
                                      AppTheme.luxuryGold.withValues(
                                        alpha: 0.8,
                                      ),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.luxuryGold.withValues(
                                        alpha: 0.4,
                                      ),
                                      offset: const Offset(0, 20),
                                      blurRadius: 40,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: AppTheme.luxuryGold.withValues(
                                        alpha: 0.2,
                                      ),
                                      offset: const Offset(0, 10),
                                      blurRadius: 30,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Family icon with glow
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.softWhite.withValues(
                                          alpha: 0.2,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppTheme.softWhite
                                                .withValues(alpha: 0.3),
                                            blurRadius: 15,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.family_restroom,
                                        size: 40,
                                        color: AppTheme.softWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 20),

                                    // Enhanced years text
                                    Text(
                                      '15+',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.softWhite,
                                        shadows: [
                                          Shadow(
                                            color: AppTheme.primaryBlack
                                                .withValues(alpha: 0.3),
                                            offset: const Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'YEARS OF\nCOMPASSIONATE\nFAMILY CARE',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.softWhite,
                                        letterSpacing: 1.2,
                                        height: 1.3,
                                        shadows: [
                                          Shadow(
                                            color: AppTheme.primaryBlack
                                                .withValues(alpha: 0.2),
                                            offset: const Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        // Decorative family elements
                        Positioned(
                          top: 40,
                          right: 60,
                          child: AnimatedBuilder(
                            animation: _heartController,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _heartFloat.value * 0.01,
                                child: Icon(
                                  Icons.people,
                                  size: 24,
                                  color: AppTheme.luxuryGold.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Positioned(
                          bottom: 50,
                          left: 40,
                          child: AnimatedBuilder(
                            animation: _heartController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: 1.0 + _heartFloat.value * 0.02,
                                child: Icon(
                                  Icons.support_agent,
                                  size: 20,
                                  color: AppTheme.luxuryGold.withValues(
                                    alpha: 0.4,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 80),

          // Enhanced Right Side - Content with emotional elements
          Expanded(
            flex: 3,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Enhanced section label with glow
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppTheme.goldGradient,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                            offset: const Offset(0, 8),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 16,
                            color: AppTheme.softWhite,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'ABOUT US',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.softWhite,
                              letterSpacing: 3.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Enhanced main heading with floating elements
                    Stack(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Dedicated to ',
                                style: AppTheme.sectionTitle,
                              ),
                              TextSpan(
                                text: 'dignity\n',
                                style: AppTheme.sectionTitle.copyWith(
                                  color: AppTheme.luxuryGold,
                                ),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: AppTheme.sectionTitle,
                              ),
                              TextSpan(
                                text: 'compassion',
                                style: AppTheme.sectionTitle.copyWith(
                                  color: AppTheme.luxuryGold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Floating hearts for emotional connection
                        AnimatedBuilder(
                          animation: _heartController,
                          builder: (context, child) {
                            return Positioned(
                              right: -40,
                              top: 30 + _heartFloat.value,
                              child: Icon(
                                Icons.favorite,
                                size: 20,
                                color: AppTheme.luxuryGold.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Enhanced description with emotional language
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Text(
                        'At Panther Funerals, we understand that losing a loved one is one of life\'s most profound challenges. For over 15 years, our compassionate family has been honored to serve families in their time of need, providing comfort, dignity, and professional care that honors life and celebrates cherished memories.',
                        style: AppTheme.bodyText.copyWith(height: 1.7),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Enhanced feature points with emotional icons
                    Column(
                      children: [
                        _buildEnhancedFeaturePoint(
                          'Family-Centered Care',
                          'We treat every family like our own, with compassion and understanding',
                          Icons.family_restroom,
                          AppTheme.luxuryGold,
                        ),
                        const SizedBox(height: 20),
                        _buildEnhancedFeaturePoint(
                          '24/7 Emotional Support',
                          'Our caring team is available day and night for guidance and comfort',
                          Icons.support_agent,
                          AppTheme.luxuryGold,
                        ),
                        const SizedBox(height: 20),
                        _buildEnhancedFeaturePoint(
                          'Personalized Remembrance',
                          'Every service is uniquely crafted to honor your loved one\'s legacy',
                          Icons.auto_stories,
                          AppTheme.luxuryGold,
                        ),
                        const SizedBox(height: 20),
                        _buildEnhancedFeaturePoint(
                          'Community Connection',
                          'Deeply rooted in our community, serving with integrity and love',
                          Icons.people,
                          AppTheme.luxuryGold,
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    // Enhanced CTA Button with heart animation
                    AnimatedBuilder(
                      animation: _heartController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.0 + (_heartFloat.value + 8) / 200,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: AppTheme.goldGradient,
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.luxuryGold.withValues(
                                    alpha: 0.4,
                                  ),
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
                                'Learn More About Our Family',
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
                                  horizontal: 32,
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedFeaturePoint(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return AnimatedBuilder(
      animation: _heartController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_heartFloat.value * 0.1, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Enhanced icon with glow
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color, color.withValues(alpha: 0.7)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.3),
                      offset: const Offset(0, 4),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(icon, color: AppTheme.softWhite, size: 24),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTheme.bodyText.copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
