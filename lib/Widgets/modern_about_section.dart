import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ModernAboutSection extends StatefulWidget {
  const ModernAboutSection({super.key});

  @override
  State<ModernAboutSection> createState() => _ModernAboutSectionState();
}

class _ModernAboutSectionState extends State<ModernAboutSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.heroAnimation,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
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

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.repeat(reverse: true);
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Start animation immediately for now
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
      decoration: const BoxDecoration(color: AppTheme.softWhite),
      child: Row(
        children: [
          // Enhanced Left Side - Circular Brand Element
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
                        // Animated pulse rings
                        AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _pulseAnimation.value,
                              child: Container(
                                width: 450,
                                height: 450,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppTheme.luxuryGold.withValues(
                                      alpha: 0.2,
                                    ),
                                    width: 1,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        // Outer decorative circle
                        Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                        ),

                        // Main enhanced circular element
                        Container(
                          width: 320,
                          height: 320,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppTheme.goldGradient,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.luxuryGold.withValues(
                                  alpha: 0.3,
                                ),
                                offset: const Offset(0, 20),
                                blurRadius: 40,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon or Symbol
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.softWhite.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  size: 40,
                                  color: AppTheme.softWhite,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Years text
                              Text(
                                '15+',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.softWhite,
                                ),
                              ),
                              Text(
                                'YEARS OF\nCOMPASSIONATE\nCARE',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.softWhite,
                                  letterSpacing: 1.0,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Small decorative elements
                        Positioned(
                          top: 50,
                          right: 50,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.luxuryGold,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 70,
                          left: 40,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.luxuryGold.withValues(alpha: 0.6),
                            ),
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

          // Enhanced Right Side - Content with slide animation
          Expanded(
            flex: 3,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Enhanced section label
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppTheme.goldGradient,
                        borderRadius: AppTheme.mediumRadius,
                        boxShadow: AppTheme.softShadow,
                      ),
                      child: Text(
                        'ABOUT US',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.softWhite,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Main heading
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
                          TextSpan(text: 'and ', style: AppTheme.sectionTitle),
                          TextSpan(
                            text: 'compassion',
                            style: AppTheme.sectionTitle.copyWith(
                              color: AppTheme.luxuryGold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Description
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Text(
                        'At Panther Funerals, we understand that saying goodbye to a loved one is one of life\'s most difficult experiences. Our dedicated team provides compassionate, professional funeral services that honor the memory of your loved ones while supporting families through their time of grief.',
                        style: AppTheme.bodyText,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Feature points
                    Column(
                      children: [
                        _buildFeaturePoint(
                          'Professional Care',
                          'Expert funeral directors with years of experience',
                        ),
                        const SizedBox(height: 20),
                        _buildFeaturePoint(
                          '24/7 Support',
                          'Available around the clock for your needs',
                        ),
                        const SizedBox(height: 20),
                        _buildFeaturePoint(
                          'Personalized Services',
                          'Tailored to honor your loved one\'s unique life',
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    // CTA Button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: AppTheme.mediumRadius,
                        gradient: AppTheme.goldGradient,
                        boxShadow: AppTheme.buttonShadow,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: AppTheme.mediumRadius,
                          ),
                        ),
                        child: Text(
                          'Learn More About Us',
                          style: AppTheme.buttonText,
                        ),
                      ),
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

  Widget _buildFeaturePoint(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 8, right: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.luxuryGold,
          ),
        ),
        Expanded(
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
              const SizedBox(height: 4),
              Text(description, style: AppTheme.bodyText),
            ],
          ),
        ),
      ],
    );
  }
}

// Helper widget for visibility detection
class VisibilityDetector extends StatefulWidget {
  @override
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
    // Simplified visibility detection - in real app you'd use visibility_detector package
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
