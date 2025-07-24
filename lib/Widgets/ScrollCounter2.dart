import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollCounter2 extends StatefulWidget {
  const ScrollCounter2({super.key});

  @override
  State<ScrollCounter2> createState() => _ScrollCounter2State();
}

class _ScrollCounter2State extends State<ScrollCounter2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _count1;
  late Animation<int> _count2;
  late Animation<int> _count3;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define different count targets
    _count1 = IntTween(begin: 0, end: 25).animate(_controller);
    _count2 = IntTween(begin: 0, end: 100).animate(_controller);
    _count3 = IntTween(begin: 0, end: 50).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('scroll-counter'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _startAnimation();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCounter(_count1.value, 'Our Team'),
              _buildCounter(_count2.value, 'Happy Clients'),
              _buildCounter(_count3.value, 'Funerals Done'),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCounter(int value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString(),
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(fontSize: 25, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
