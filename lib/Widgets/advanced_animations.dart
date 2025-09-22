import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class GoldenParticleSystem extends StatefulWidget {
  final Widget child;
  final int particleCount;
  final bool isActive;
  final Duration duration;

  const GoldenParticleSystem({
    super.key,
    required this.child,
    this.particleCount = 20,
    this.isActive = true,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<GoldenParticleSystem> createState() => _GoldenParticleSystemState();
}

class _GoldenParticleSystemState extends State<GoldenParticleSystem>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _initializeParticles();
    if (widget.isActive) {
      _controller.repeat();
    }
  }

  void _initializeParticles() {
    _particles = List.generate(widget.particleCount, (index) {
      return Particle(
        position: Offset(_random.nextDouble(), _random.nextDouble()),
        velocity: Offset(
          (_random.nextDouble() - 0.5) * 0.002,
          (_random.nextDouble() - 0.5) * 0.002,
        ),
        size: _random.nextDouble() * 4 + 1,
        opacity: _random.nextDouble() * 0.8 + 0.2,
        color: _getRandomGoldColor(),
        life: _random.nextDouble(),
      );
    });
  }

  Color _getRandomGoldColor() {
    final colors = [
      const Color(0xFFFFD700),
      const Color(0xFFB8860B),
      const Color(0xFFFFF700),
      const Color(0xFFFFEB3B),
    ];
    return colors[_random.nextInt(colors.length)];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isActive)
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: ParticlePainter(_particles, _controller.value),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class Particle {
  Offset position;
  Offset velocity;
  double size;
  double opacity;
  Color color;
  double life;

  Particle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.opacity,
    required this.color,
    required this.life,
  });

  void update() {
    position += velocity;
    life += 0.01;

    // Wrap around edges
    if (position.dx < 0) position = Offset(1.0, position.dy);
    if (position.dx > 1) position = Offset(0.0, position.dy);
    if (position.dy < 0) position = Offset(position.dx, 1.0);
    if (position.dy > 1) position = Offset(position.dx, 0.0);

    // Fade based on life
    opacity = (sin(life * pi) * 0.5 + 0.5) * 0.8;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update();

      final paint = Paint()
        ..color = particle.color.withValues(alpha: particle.opacity)
        ..style = PaintingStyle.fill;

      final center = Offset(
        particle.position.dx * size.width,
        particle.position.dy * size.height,
      );

      // Draw glowing particle
      canvas.drawCircle(center, particle.size, paint);

      // Add glow effect
      final glowPaint = Paint()
        ..color = particle.color.withValues(alpha: particle.opacity * 0.3)
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

      canvas.drawCircle(center, particle.size * 2, glowPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Morphing Text Animation
class MorphingText extends StatefulWidget {
  final List<String> texts;
  final TextStyle style;
  final Duration duration;
  final Duration pauseDuration;

  const MorphingText({
    super.key,
    required this.texts,
    required this.style,
    this.duration = const Duration(milliseconds: 800),
    this.pauseDuration = const Duration(seconds: 3),
  });

  @override
  State<MorphingText> createState() => _MorphingTextState();
}

class _MorphingTextState extends State<MorphingText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.pauseDuration, (_) {
      _morphToNext();
    });
  }

  void _morphToNext() {
    _controller.reverse().then((_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.texts.length;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Text(
              widget.texts[_currentIndex],
              style: widget.style,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

// Liquid Fill Animation
class LiquidFillAnimation extends StatefulWidget {
  final Widget child;
  final Color liquidColor;
  final double fillPercentage;
  final Duration duration;

  const LiquidFillAnimation({
    super.key,
    required this.child,
    this.liquidColor = const Color(0xFFFFD700),
    this.fillPercentage = 0.7,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<LiquidFillAnimation> createState() => _LiquidFillAnimationState();
}

class _LiquidFillAnimationState extends State<LiquidFillAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fillAnimation;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _fillAnimation = Tween<double>(
      begin: 0.0,
      end: widget.fillPercentage,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          widget.child,
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: LiquidPainter(
                    fillLevel: _fillAnimation.value,
                    wavePhase: _waveAnimation.value,
                    color: widget.liquidColor,
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

class LiquidPainter extends CustomPainter {
  final double fillLevel;
  final double wavePhase;
  final Color color;

  LiquidPainter({
    required this.fillLevel,
    required this.wavePhase,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = 10.0;
    final waveLength = size.width / 2;

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * (1 - fillLevel));

    for (double x = 0; x <= size.width; x += 1) {
      final y =
          size.height * (1 - fillLevel) +
          sin((x / waveLength * 2 * pi) + wavePhase) * waveHeight;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Auto-scroll behavior
class AutoScrollController {
  final ScrollController scrollController;
  final Duration scrollDuration;
  final Duration pauseDuration;

  AutoScrollController({
    required this.scrollController,
    this.scrollDuration = const Duration(seconds: 30),
    this.pauseDuration = const Duration(seconds: 5),
  });

  late Timer _timer;
  bool _isAutoScrolling = false;

  void startAutoScroll() {
    if (_isAutoScrolling) return;
    _isAutoScrolling = true;

    _timer = Timer.periodic(pauseDuration, (_) {
      if (scrollController.hasClients) {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        if (currentScroll >= maxScroll) {
          // Scroll back to top
          scrollController.animateTo(
            0,
            duration: scrollDuration,
            curve: Curves.easeInOut,
          );
        } else {
          // Scroll to next section
          final nextScroll = (currentScroll + 800).clamp(0.0, maxScroll);
          scrollController.animateTo(
            nextScroll,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  void stopAutoScroll() {
    _isAutoScrolling = false;
    _timer.cancel();
  }

  void dispose() {
    stopAutoScroll();
  }
}

// Enhanced Counter Animation
class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final String suffix;
  final TextStyle style;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    this.suffix = '',
    required this.style,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<double>(
      begin: 0,
      end: widget.targetValue.toDouble(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          '${_animation.value.toInt()}${widget.suffix}',
          style: widget.style,
        );
      },
    );
  }
}
