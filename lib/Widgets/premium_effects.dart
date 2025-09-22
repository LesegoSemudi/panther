import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';

// Premium Golden Shimmer Effect
class GoldenShimmerEffect extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final Duration duration;

  const GoldenShimmerEffect({
    super.key,
    required this.child,
    this.isActive = true,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<GoldenShimmerEffect> createState() => _GoldenShimmerEffectState();
}

class _GoldenShimmerEffectState extends State<GoldenShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller);

    if (widget.isActive) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) return widget.child;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Colors.transparent,
                AppTheme.luxuryGold,
                Colors.transparent,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: widget.child,
        );
      },
    );
  }
}

// Luxury Glow Container
class LuxuryGlowContainer extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final double glowRadius;
  final bool isPulsing;

  const LuxuryGlowContainer({
    super.key,
    required this.child,
    this.glowColor = AppTheme.luxuryGold,
    this.glowRadius = 20.0,
    this.isPulsing = false,
  });

  @override
  State<LuxuryGlowContainer> createState() => _LuxuryGlowContainerState();
}

class _LuxuryGlowContainerState extends State<LuxuryGlowContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isPulsing) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        final glowOpacity = widget.isPulsing ? _pulseAnimation.value : 1.0;
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withValues(alpha: 0.3 * glowOpacity),
                blurRadius: widget.glowRadius,
                spreadRadius: widget.glowRadius / 4,
              ),
              BoxShadow(
                color: widget.glowColor.withValues(alpha: 0.1 * glowOpacity),
                blurRadius: widget.glowRadius * 2,
                spreadRadius: widget.glowRadius / 2,
              ),
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}

// Premium Transition Effects
class PremiumPageTransition extends PageRouteBuilder {
  final Widget page;
  final TransitionType transitionType;

  PremiumPageTransition({
    required this.page,
    this.transitionType = TransitionType.fadeScale,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: const Duration(milliseconds: 600),
         reverseTransitionDuration: const Duration(milliseconds: 400),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           switch (transitionType) {
             case TransitionType.fadeScale:
               return _buildFadeScaleTransition(animation, child);
             case TransitionType.goldSlide:
               return _buildGoldSlideTransition(animation, child);
             case TransitionType.luxuryRotate:
               return _buildLuxuryRotateTransition(animation, child);
           }
         },
       );

  static Widget _buildFadeScaleTransition(
    Animation<double> animation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.elasticOut)),
        child: child,
      ),
    );
  }

  static Widget _buildGoldSlideTransition(
    Animation<double> animation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: FadeTransition(opacity: animation, child: child),
    );
  }

  static Widget _buildLuxuryRotateTransition(
    Animation<double> animation,
    Widget child,
  ) {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0.1,
        end: 0.0,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
      child: ScaleTransition(scale: animation, child: child),
    );
  }
}

enum TransitionType { fadeScale, goldSlide, luxuryRotate }

// Luxury Ripple Effect
class LuxuryRippleEffect extends StatefulWidget {
  final Widget child;
  final Color rippleColor;
  final VoidCallback? onTap;

  const LuxuryRippleEffect({
    super.key,
    required this.child,
    this.rippleColor = AppTheme.luxuryGold,
    this.onTap,
  });

  @override
  State<LuxuryRippleEffect> createState() => _LuxuryRippleEffectState();
}

class _LuxuryRippleEffectState extends State<LuxuryRippleEffect>
    with TickerProviderStateMixin {
  final List<RippleAnimation> _ripples = [];
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  void _createRipple(Offset position) {
    final ripple = RippleAnimation(
      controller: AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
      position: position,
      color: widget.rippleColor,
    );

    setState(() {
      _ripples.add(ripple);
    });

    ripple.controller.forward().then((_) {
      setState(() {
        _ripples.remove(ripple);
      });
      ripple.controller.dispose();
    });
  }

  @override
  void dispose() {
    _rippleController.dispose();
    for (var ripple in _ripples) {
      ripple.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _createRipple(details.localPosition);
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Stack(
        children: [
          widget.child,
          ..._ripples.map(
            (ripple) => AnimatedBuilder(
              animation: ripple.controller,
              builder: (context, child) {
                return Positioned.fill(
                  child: CustomPaint(
                    painter: RipplePainter(
                      animation: ripple.controller,
                      position: ripple.position,
                      color: ripple.color,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RippleAnimation {
  final AnimationController controller;
  final Offset position;
  final Color color;

  RippleAnimation({
    required this.controller,
    required this.position,
    required this.color,
  });
}

class RipplePainter extends CustomPainter {
  final Animation<double> animation;
  final Offset position;
  final Color color;

  RipplePainter({
    required this.animation,
    required this.position,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: (1 - animation.value) * 0.6)
      ..style = PaintingStyle.fill;

    final radius = animation.value * 100;
    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Golden Text Effect
class GoldenTextEffect extends StatefulWidget {
  final String text;
  final TextStyle baseStyle;
  final bool isAnimated;

  const GoldenTextEffect({
    super.key,
    required this.text,
    required this.baseStyle,
    this.isAnimated = true,
  });

  @override
  State<GoldenTextEffect> createState() => _GoldenTextEffectState();
}

class _GoldenTextEffectState extends State<GoldenTextEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(_controller);

    if (widget.isAnimated) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.luxuryGold,
                AppTheme.elegantYellow,
                AppTheme.richGold,
                AppTheme.luxuryGold,
              ],
              stops: widget.isAnimated
                  ? [
                      (_shimmerAnimation.value - 0.3).clamp(0.0, 1.0),
                      (_shimmerAnimation.value - 0.1).clamp(0.0, 1.0),
                      (_shimmerAnimation.value + 0.1).clamp(0.0, 1.0),
                      (_shimmerAnimation.value + 0.3).clamp(0.0, 1.0),
                    ]
                  : [0.0, 0.3, 0.7, 1.0],
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: widget.baseStyle.copyWith(
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: [AppTheme.luxuryGold, AppTheme.elegantYellow],
                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
            ),
          ),
        );
      },
    );
  }
}

// Luxury Background Effect
class LuxuryBackgroundEffect extends StatefulWidget {
  final Widget child;
  final bool isActive;

  const LuxuryBackgroundEffect({
    super.key,
    required this.child,
    this.isActive = true,
  });

  @override
  State<LuxuryBackgroundEffect> createState() => _LuxuryBackgroundEffectState();
}

class _LuxuryBackgroundEffectState extends State<LuxuryBackgroundEffect>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _particleController;

  @override
  void initState() {
    super.initState();

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    if (widget.isActive) {
      _backgroundController.repeat();
      _particleController.repeat();
    }
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated Background
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
                    AppTheme.charcoalGray.withValues(
                      alpha:
                          0.8 +
                          0.2 *
                              math.sin(
                                _backgroundController.value * 2 * math.pi,
                              ),
                    ),
                    AppTheme.primaryBlack,
                  ],
                  stops: [
                    0.0,
                    0.5 +
                        0.3 *
                            math.sin(_backgroundController.value * 2 * math.pi),
                    1.0,
                  ],
                ),
              ),
            );
          },
        ),

        // Floating Golden Particles
        if (widget.isActive)
          AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              return CustomPaint(
                painter: BackgroundParticlePainter(_particleController.value),
                size: Size.infinite,
              );
            },
          ),

        // Main Content
        widget.child,
      ],
    );
  }
}

class BackgroundParticlePainter extends CustomPainter {
  final double animationValue;

  BackgroundParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 20; i++) {
      final x = (i * 137.5) % size.width;
      final y = (i * 87.3 + animationValue * 100) % size.height;
      final opacity = (math.sin(animationValue * 2 * math.pi + i) + 1) / 2;

      paint.color = AppTheme.luxuryGold.withValues(alpha: opacity * 0.3);

      canvas.drawCircle(
        Offset(x, y),
        2 + 3 * math.sin(animationValue * 4 * math.pi + i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
