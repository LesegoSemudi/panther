import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class LuxuryNavigationBar extends StatefulWidget {
  const LuxuryNavigationBar({super.key});

  @override
  State<LuxuryNavigationBar> createState() => _LuxuryNavigationBarState();
}

class _LuxuryNavigationBarState extends State<LuxuryNavigationBar>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _logoController;
  late AnimationController _authController;
  late Animation<double> _logoScale;
  late Animation<double> _logoRotate;
  late Animation<double> _authSlide;
  late Animation<double> _backgroundOpacity;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _logoController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _authController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _logoScale = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _logoRotate = Tween<double>(begin: 0.0, end: 0.02).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _authSlide = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _authController,
        curve: const Interval(0.5, 1.0, curve: Curves.elasticOut),
      ),
    );

    _backgroundOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    // Start animations
    _headerController.forward();
    _authController.forward();
    _logoController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _headerController.dispose();
    _logoController.dispose();
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _headerController,
      builder: (context, child) {
        return Container(
          height: 90,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.primaryBlack.withValues(alpha: 0.95),
                AppTheme.primaryBlack.withValues(alpha: 0.85),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlack.withValues(alpha: 0.3),
                offset: const Offset(0, 8),
                blurRadius: 32,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Luxury background pattern
              Positioned.fill(
                child: Opacity(
                  opacity: _backgroundOpacity.value * 0.1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.luxuryGold.withValues(alpha: 0.1),
                          Colors.transparent,
                          AppTheme.luxuryGold.withValues(alpha: 0.05),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Main content
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    // Enhanced logo section
                    AnimatedBuilder(
                      animation: _logoController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _logoScale.value,
                          child: Transform.rotate(
                            angle: _logoRotate.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
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
                                        offset: const Offset(0, 8),
                                        blurRadius: 20,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      'https://res.cloudinary.com/dqtr6uqzi/image/upload/v1758567173/lll_nepluy.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'PANTHER FUNERALS',
                                      style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.softWhite,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                    Text(
                                      '+27 (0)82 308 98 95',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.luxuryGold,
                                        letterSpacing: 1.0,
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

                    const Spacer(),

                    // Luxury navigation menu
                    Row(
                      children: [
                        _buildNavItem('Home', isActive: true),
                        _buildNavItem('About'),
                        _buildNavItem('Services'),
                        _buildNavItem('Gallery'),
                        _buildNavItem('Contact'),
                      ],
                    ),

                    const SizedBox(width: 40),

                    // Enhanced auth section
                    AnimatedBuilder(
                      animation: _authController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_authSlide.value, 0),
                          child: Row(
                            children: [
                              // Call button
                              Container(
                                decoration: BoxDecoration(
                                  gradient: AppTheme.goldGradient,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.luxuryGold.withValues(
                                        alpha: 0.3,
                                      ),
                                      offset: const Offset(0, 4),
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: _makePhoneCall,
                                  icon: Icon(
                                    Icons.phone,
                                    color: AppTheme.softWhite,
                                    size: 22,
                                  ),
                                  tooltip: 'Call Us Now',
                                ),
                              ),

                              const SizedBox(width: 15),

                              // Login button
                              _buildAuthButton(
                                'Login',
                                isOutlined: true,
                                onPressed: _showLoginDialog,
                              ),

                              const SizedBox(width: 10),

                              // Sign up button
                              _buildAuthButton(
                                'Sign Up',
                                isOutlined: false,
                                onPressed: _showSignUpDialog,
                              ),
                            ],
                          ),
                        );
                      },
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

  Widget _buildNavItem(String title, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => _navigateToPage(title),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? AppTheme.luxuryGold : AppTheme.softWhite,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  void _navigateToPage(String page) {
    switch (page) {
      case 'Home':
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
      case 'About':
        Navigator.pushNamed(context, '/about');
        break;
      case 'Services':
        Navigator.pushNamed(context, '/services');
        break;
      case 'Gallery':
        Navigator.pushNamed(context, '/gallery');
        break;
      case 'Contact':
        Navigator.pushNamed(context, '/contact');
        break;
    }
  }

  void _makePhoneCall() {
    // In a real app, you would use url_launcher package to make phone calls
    // For now, show a dialog with the phone number
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.softWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Call Panther Funerals',
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlack,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone, size: 50, color: AppTheme.luxuryGold),
            const SizedBox(height: 20),
            Text(
              '+27 (0)82 308 98 95',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryBlack,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Available 24/7 for emergencies',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppTheme.charcoalGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: GoogleFonts.inter(
                color: AppTheme.charcoalGray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // In a real app, launch phone dialer
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.luxuryGold,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Call Now',
              style: GoogleFonts.inter(
                color: AppTheme.primaryBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.softWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Login',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlack,
          ),
        ),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.email, color: AppTheme.luxuryGold),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.lock, color: AppTheme.luxuryGold),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.luxuryGold,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      color: AppTheme.primaryBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSignUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.softWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Sign Up',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlack,
          ),
        ),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.person, color: AppTheme.luxuryGold),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.email, color: AppTheme.luxuryGold),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.lock, color: AppTheme.luxuryGold),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppTheme.luxuryGold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.luxuryGold,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.inter(
                      color: AppTheme.primaryBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton(
    String text, {
    required bool isOutlined,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: isOutlined ? null : AppTheme.goldGradient,
        border: isOutlined
            ? Border.all(color: AppTheme.luxuryGold, width: 1.5)
            : null,
        borderRadius: BorderRadius.circular(25),
        boxShadow: isOutlined
            ? null
            : [
                BoxShadow(
                  color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isOutlined ? AppTheme.luxuryGold : AppTheme.softWhite,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
