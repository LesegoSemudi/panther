import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';

// Interactive Progress Ring
class InteractiveProgressRing extends StatefulWidget {
  final double progress;
  final String label;
  final Color primaryColor;
  final Color backgroundColor;
  final double size;
  final Duration animationDuration;

  const InteractiveProgressRing({
    super.key,
    required this.progress,
    required this.label,
    this.primaryColor = AppTheme.luxuryGold,
    this.backgroundColor = AppTheme.charcoalGray,
    this.size = 120,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  State<InteractiveProgressRing> createState() =>
      _InteractiveProgressRingState();
}

class _InteractiveProgressRingState extends State<InteractiveProgressRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: ProgressRingPainter(
                      progress: _animation.value,
                      primaryColor: widget.primaryColor,
                      backgroundColor: widget.backgroundColor,
                      isHovered: _isHovered,
                    ),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Text(
                        '${(_animation.value * 100).toInt()}%',
                        style: AppTheme.cardTitle.copyWith(
                          color: widget.primaryColor,
                          fontSize: widget.size * 0.15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Text(
                    widget.label,
                    style: AppTheme.smallText.copyWith(
                      color: AppTheme.charcoalGray,
                      fontSize: widget.size * 0.08,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressRingPainter extends CustomPainter {
  final double progress;
  final Color primaryColor;
  final Color backgroundColor;
  final bool isHovered;

  ProgressRingPainter({
    required this.progress,
    required this.primaryColor,
    required this.backgroundColor,
    required this.isHovered,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 20) / 2;
    final strokeWidth = isHovered ? 12.0 : 8.0;

    // Background ring
    final backgroundPaint = Paint()
      ..color = backgroundColor.withValues(alpha: 0.3)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress ring
    final progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [primaryColor, primaryColor.withValues(alpha: 0.7)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Add glow effect when hovered
    if (isHovered) {
      final glowPaint = Paint()
        ..color = primaryColor.withValues(alpha: 0.3)
        ..strokeWidth = strokeWidth + 4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        glowPaint,
      );
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Interactive Service Card with Hover Effects
class InteractiveServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const InteractiveServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  State<InteractiveServiceCard> createState() => _InteractiveServiceCardState();
}

class _InteractiveServiceCardState extends State<InteractiveServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: _isHovered
                      ? AppTheme.goldGradient
                      : LinearGradient(
                          colors: [AppTheme.pureWhite, AppTheme.lightGray],
                        ),
                  borderRadius: AppTheme.mediumRadius,
                  boxShadow: _isHovered
                      ? AppTheme.glowShadow
                      : AppTheme.softShadow,
                  border: Border.all(
                    color: _isHovered
                        ? AppTheme.luxuryGold
                        : AppTheme.charcoalGray.withValues(alpha: 0.2),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? AppTheme.pureWhite
                              : AppTheme.luxuryGold.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.icon,
                          size: 48,
                          color: _isHovered
                              ? AppTheme.primaryBlack
                              : AppTheme.luxuryGold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: AppTheme.cardTitle.copyWith(
                        color: _isHovered
                            ? AppTheme.pureWhite
                            : AppTheme.primaryBlack,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.description,
                      style: AppTheme.bodyText.copyWith(
                        color: _isHovered
                            ? AppTheme.pureWhite.withValues(alpha: 0.9)
                            : AppTheme.charcoalGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Interactive Loading Button
class InteractiveLoadingButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Duration loadingDuration;

  const InteractiveLoadingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loadingDuration = const Duration(seconds: 2),
  });

  @override
  State<InteractiveLoadingButton> createState() =>
      _InteractiveLoadingButtonState();
}

class _InteractiveLoadingButtonState extends State<InteractiveLoadingButton>
    with TickerProviderStateMixin {
  late AnimationController _loadingController;
  late AnimationController _pulseController;
  late Animation<double> _loadingAnimation;
  late Animation<double> _pulseAnimation;
  bool _isLoading = false;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      duration: widget.loadingDuration,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _loadingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_loadingController);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _loadingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isLoading = false;
          _isCompleted = true;
        });
        _pulseController.forward().then((_) {
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() => _isCompleted = false);
              _pulseController.reset();
            }
          });
        });
      }
    });
  }

  void _handlePress() {
    if (_isLoading || _isCompleted) return;

    setState(() => _isLoading = true);
    _loadingController.forward();

    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  void dispose() {
    _loadingController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_loadingController, _pulseController]),
      builder: (context, child) {
        return Transform.scale(
          scale: _isCompleted ? _pulseAnimation.value : 1.0,
          child: Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: _handlePress,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isCompleted
                    ? Colors.green
                    : AppTheme.luxuryGold,
                foregroundColor: AppTheme.primaryBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: _isLoading ? 0 : 4,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background progress
                  if (_isLoading)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            stops: [
                              _loadingAnimation.value,
                              _loadingAnimation.value,
                            ],
                            colors: [
                              AppTheme.elegantYellow,
                              AppTheme.luxuryGold,
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Content
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isCompleted
                        ? Icon(
                            Icons.check,
                            key: const ValueKey('check'),
                            color: AppTheme.pureWhite,
                          )
                        : _isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            key: const ValueKey('loading'),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(
                                AppTheme.primaryBlack,
                              ),
                            ),
                          )
                        : Text(
                            widget.text,
                            key: const ValueKey('text'),
                            style: AppTheme.buttonText.copyWith(
                              color: AppTheme.primaryBlack,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Interactive Floating Action Button
class LuxuryFloatingButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String tooltip;

  const LuxuryFloatingButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip = '',
  });

  @override
  State<LuxuryFloatingButton> createState() => _LuxuryFloatingButtonState();
}

class _LuxuryFloatingButtonState extends State<LuxuryFloatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _controller.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _controller.reverse();
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: AppTheme.goldGradient,
                  shape: BoxShape.circle,
                  boxShadow: _isPressed
                      ? []
                      : [
                          BoxShadow(
                            color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                ),
                child: Icon(
                  widget.icon,
                  color: AppTheme.primaryBlack,
                  size: 24,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Progress Indicator with Percentage
class LuxuryProgressIndicator extends StatefulWidget {
  final double progress;
  final String label;
  final Duration animationDuration;

  const LuxuryProgressIndicator({
    super.key,
    required this.progress,
    required this.label,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  State<LuxuryProgressIndicator> createState() =>
      _LuxuryProgressIndicatorState();
}

class _LuxuryProgressIndicatorState extends State<LuxuryProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: AppTheme.bodyText.copyWith(fontWeight: FontWeight.w600),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  '${(_animation.value * 100).toInt()}%',
                  style: AppTheme.bodyText.copyWith(
                    color: AppTheme.luxuryGold,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppTheme.lightGray,
            borderRadius: BorderRadius.circular(4),
          ),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppTheme.goldGradient,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.luxuryGold.withValues(alpha: 0.4),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
