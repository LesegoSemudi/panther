import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'luxury_navigation_bar.dart';
import 'advanced_animations.dart';

class EnhancedHeroSection extends StatefulWidget {
  const EnhancedHeroSection({super.key});

  @override
  State<EnhancedHeroSection> createState() => _EnhancedHeroSectionState();
}

class _EnhancedHeroSectionState extends State<EnhancedHeroSection>
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

  final List<String> _heroTexts = [
    'Honoring Every Memory',
    'Celebrating Lives Lived',
    'Compassionate Care Always',
    'Dignity in Every Service',
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
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _memoryController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    _floatingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_floatingController);

    _heartPulse = Tween<double>(begin: 0.8, end: 1.2).animate(_heartController);

    _memoryFloat = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(_memoryController);

    _backgroundShift = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_backgroundController);
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _animationController.forward();
        _floatingController.repeat(reverse: true);
        _heartController.repeat(reverse: true);
        _memoryController.repeat(reverse: true);
        _backgroundController.repeat();
      }
    });
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
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;

    return GoldenParticleSystem(
      particleCount: 30,
      isActive: true,
      child: Container(
        height: size.height,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppTheme.blackGoldGradient),
        child: Stack(
          children: [
            // Background Animation Layer
            AnimatedBuilder(
              animation: _backgroundController,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.primaryBlack.withValues(alpha: 0.9),
                        AppTheme.luxuryGold.withValues(alpha: 0.1),
                        AppTheme.primaryBlack,
                      ],
                      stops: [0.0, _backgroundShift.value, 1.0],
                    ),
                  ),
                );
              },
            ),

            // Navigation Bar
            const LuxuryNavigationBar(),

            // Main Content
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: _buildHeroContent(size, isDesktop),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Floating Elements
            _buildFloatingElements(size),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroContent(Size size, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Morphing Title
          MorphingText(
            texts: _heroTexts,
            style: GoogleFonts.playfairDisplay(
              fontSize: isDesktop ? 64 : 36,
              fontWeight: FontWeight.w700,
              color: AppTheme.pureWhite,
              letterSpacing: -1,
              height: 1.1,
            ),
            duration: const Duration(milliseconds: 800),
            pauseDuration: const Duration(seconds: 4),
          ),

          const SizedBox(height: 40),

          // Subtitle with Liquid Fill
          LiquidFillAnimation(
            liquidColor: AppTheme.luxuryGold,
            fillPercentage: 0.6,
            duration: const Duration(seconds: 3),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Providing compassionate funeral services with dignity, respect, and personalized care for over 25 years',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 22 : 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.pureWhite.withValues(alpha: 0.9),
                  letterSpacing: 0.5,
                  height: 1.6,
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),

          // Stats Section with Animated Counters
          _buildStatsSection(isDesktop),

          const SizedBox(height: 60),

          // CTA Buttons
          _buildCTAButtons(isDesktop),
        ],
      ),
    );
  }

  Widget _buildStatsSection(bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('25+', 'Years of Service', isDesktop),
          _buildStatItem('5000+', 'Families Served', isDesktop),
          _buildStatItem('24/7', 'Support Available', isDesktop),
          _buildStatItem('100%', 'Satisfaction', isDesktop),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, bool isDesktop) {
    return AnimatedBuilder(
      animation: _heartController,
      builder: (context, child) {
        return Transform.scale(
          scale: value.contains('+') ? _heartPulse.value : 1.0,
          child: Column(
            children: [
              value.contains('+')
                  ? AnimatedCounter(
                      targetValue: int.parse(value.replaceAll('+', '')),
                      suffix: '+',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 32 : 24,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.luxuryGold,
                      ),
                      duration: const Duration(seconds: 2),
                    )
                  : Text(
                      value,
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 32 : 24,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.luxuryGold,
                      ),
                    ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 14 : 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.pureWhite.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCTAButtons(bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: AppTheme.accentButton.copyWith(
            backgroundColor: WidgetStateProperty.all(AppTheme.luxuryGold),
            foregroundColor: WidgetStateProperty.all(AppTheme.primaryBlack),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: isDesktop ? 40 : 30,
                vertical: isDesktop ? 20 : 16,
              ),
            ),
          ),
          child: Text(
            'Our Services',
            style: GoogleFonts.inter(
              fontSize: isDesktop ? 16 : 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 20),
        OutlinedButton(
          onPressed: () {},
          style: AppTheme.secondaryButton.copyWith(
            side: WidgetStateProperty.all(
              const BorderSide(color: AppTheme.pureWhite, width: 2),
            ),
            foregroundColor: WidgetStateProperty.all(AppTheme.pureWhite),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: isDesktop ? 40 : 30,
                vertical: isDesktop ? 20 : 16,
              ),
            ),
          ),
          child: Text(
            'Contact Us',
            style: GoogleFonts.inter(
              fontSize: isDesktop ? 16 : 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingElements(Size size) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        return Stack(
          children: [
            // Floating Heart
            Positioned(
              top: 200 + (_floatingAnimation.value * 20),
              right: 100,
              child: AnimatedBuilder(
                animation: _heartController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _heartPulse.value,
                    child: Icon(
                      Icons.favorite,
                      color: AppTheme.luxuryGold.withValues(alpha: 0.6),
                      size: 40,
                    ),
                  );
                },
              ),
            ),

            // Floating Memory Symbol
            Positioned(
              top: 300 + (_memoryFloat.value),
              left: 80,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.pureWhite.withValues(alpha: 0.1),
                  border: Border.all(
                    color: AppTheme.luxuryGold.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.auto_stories,
                  color: AppTheme.luxuryGold,
                  size: 30,
                ),
              ),
            ),

            // More floating elements
            Positioned(
              bottom: 200 + (_floatingAnimation.value * 15),
              right: 60,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.luxuryGold.withValues(alpha: 0.3),
                      AppTheme.luxuryGold.withValues(alpha: 0.1),
                    ],
                  ),
                ),
                child: Icon(Icons.church, color: AppTheme.luxuryGold, size: 24),
              ),
            ),
          ],
        );
      },
    );
  }
}
