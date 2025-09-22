import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ModernMobileHomeScreen extends StatefulWidget {
  const ModernMobileHomeScreen({super.key});

  @override
  State<ModernMobileHomeScreen> createState() => _ModernMobileHomeScreenState();
}

class _ModernMobileHomeScreenState extends State<ModernMobileHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.softWhite,
      drawer: _buildMobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMobileHeroSection(),
            _buildMobileAboutSection(),
            _buildMobileServicesSection(),
            _buildMobileProjectsSection(),
            _buildMobileContactSection(),
            _buildMobileFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: AppTheme.primaryBlack,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.luxuryGold, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        'P',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.luxuryGold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Panther Funerals',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.softWhite,
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: Column(
                children: [
                  _buildDrawerItem('Home', Icons.home),
                  _buildDrawerItem('About', Icons.info),
                  _buildDrawerItem('Services', Icons.local_hospital),
                  _buildDrawerItem('Gallery', Icons.photo_library),
                  _buildDrawerItem('Contact', Icons.contact_phone),
                ],
              ),
            ),

            // Contact Info
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppTheme.softWhite.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone, color: AppTheme.luxuryGold, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        '+27 (0)82 308 98 95',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.softWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Available 24/7',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.softWhite.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.luxuryGold, size: 24),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.softWhite,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildMobileHeroSection() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(gradient: AppTheme.heroGradient),
      child: Stack(
        children: [
          // App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.luxuryGold,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'P',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.luxuryGold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Panther Funerals',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.softWhite,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: AppTheme.softWhite,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Hero Content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _animationController,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.3),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'DIGNIFIED\n',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.softWhite,
                                        height: 1.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'FUNERAL\n',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.luxuryGold,
                                        height: 1.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'SERVICES',
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.softWhite,
                                        height: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Compassionate funeral services that honor life and provide comfort to families during their most difficult times.',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: AppTheme.softWhite.withValues(alpha: 0.8),
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Column(
                                children: [
                                  Container(
                                    width: double.infinity,
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
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: AppTheme.mediumRadius,
                                        ),
                                      ),
                                      child: Text(
                                        'Our Services',
                                        style: AppTheme.buttonText,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Contact Us',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.softWhite,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: AppTheme.luxuryGold,
                                          size: 20,
                                        ),
                                      ],
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
                ],
              ),
            ),
          ),

          // Stats
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _animationController,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMobileStatItem('15+', 'Years'),
                      _buildMobileStatItem('1000+', 'Families'),
                      _buildMobileStatItem('24/7', 'Support'),
                    ],
                  ),
                );
              },
            ),
          ),

          // Scroll Indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppTheme.softWhite.withValues(alpha: 0.7),
                    size: 30,
                  ),
                  Text(
                    'Scroll to explore',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.softWhite.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileStatItem(String number, String label) {
    return Column(
      children: [
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
            fontWeight: FontWeight.w400,
            color: AppTheme.softWhite.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileAboutSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(color: AppTheme.softWhite),
      child: Column(
        children: [
          // Circular Element
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.goldGradient,
              boxShadow: AppTheme.buttonShadow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, size: 40, color: AppTheme.softWhite),
                const SizedBox(height: 10),
                Text(
                  '15+',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.softWhite,
                  ),
                ),
                Text(
                  'YEARS OF\nCOMPASSIONATE\nCARE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.softWhite,
                    letterSpacing: 1.0,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Content
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.1),
              borderRadius: AppTheme.smallRadius,
            ),
            child: Text(
              'ABOUT US',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.luxuryGold,
                letterSpacing: 2.0,
              ),
            ),
          ),

          const SizedBox(height: 20),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Dedicated to ',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlack,
                  ),
                ),
                TextSpan(
                  text: 'dignity\n',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.luxuryGold,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlack,
                  ),
                ),
                TextSpan(
                  text: 'compassion',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.luxuryGold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'At Panther Funerals, we understand that saying goodbye to a loved one is one of life\'s most difficult experiences. Our dedicated team provides compassionate, professional funeral services.',
            style: AppTheme.bodyText,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

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
              child: Text('Learn More About Us', style: AppTheme.buttonText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileServicesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.softWhite, AppTheme.lightGray.withValues(alpha: 0.3)],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.1),
              borderRadius: AppTheme.smallRadius,
            ),
            child: Text(
              'OUR SERVICES',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.luxuryGold,
                letterSpacing: 2.0,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Comprehensive Funeral Services',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Services Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.1,
            children: [
              _buildMobileServiceCard('Traditional\nFunerals', Icons.church),
              _buildMobileServiceCard(
                'Cremation\nServices',
                Icons.local_fire_department,
              ),
              _buildMobileServiceCard('Memorial\nServices', Icons.photo_album),
              _buildMobileServiceCard('Transportation', Icons.directions_car),
              _buildMobileServiceCard('Documentation', Icons.description),
              _buildMobileServiceCard(
                'Flowers &\nArrangements',
                Icons.local_florist,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileServiceCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.softWhite,
        borderRadius: AppTheme.mediumRadius,
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.1),
              borderRadius: AppTheme.mediumRadius,
            ),
            child: Icon(icon, size: 24, color: AppTheme.luxuryGold),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(color: AppTheme.softWhite),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.1),
              borderRadius: AppTheme.smallRadius,
            ),
            child: Text(
              'OUR WORK',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.luxuryGold,
                letterSpacing: 2.0,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Recent Services',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          Column(
            children: [
              _buildMobileProjectCard(
                'Traditional Service',
                'A beautiful celebration of life with traditional elements',
                'assets/images/background.webp',
              ),
              const SizedBox(height: 20),
              _buildMobileProjectCard(
                'Memorial Service',
                'A personalized memorial honoring cherished memories',
                'assets/images/background.webp',
              ),
              const SizedBox(height: 20),
              _buildMobileProjectCard(
                'Cremation Service',
                'Dignified cremation service with family gathering',
                'assets/images/background.webp',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectCard(
    String title,
    String description,
    String imagePath,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: AppTheme.largeRadius,
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
                const SizedBox(height: 8),
                Text(description, style: AppTheme.bodyText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(gradient: AppTheme.heroGradient),
      child: Column(
        children: [
          Text(
            'Contact Us',
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppTheme.softWhite,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Text(
            'We\'re here to help you during this difficult time. Contact us 24/7 for immediate assistance.',
            style: AppTheme.bodyText.copyWith(
              color: AppTheme.softWhite.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Contact Info
          Column(
            children: [
              _buildMobileContactItem(
                Icons.phone,
                '+27 (0)82 308 98 95',
                'Available 24/7',
              ),
              const SizedBox(height: 20),
              _buildMobileContactItem(
                Icons.email,
                'info@pantherfunerals.co.za',
                'Email us anytime',
              ),
              const SizedBox(height: 20),
              _buildMobileContactItem(
                Icons.location_on,
                'Johannesburg, South Africa',
                'Serving all areas',
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Contact Form
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppTheme.softWhite,
              borderRadius: AppTheme.largeRadius,
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Send us a message', style: AppTheme.cardTitle),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: AppTheme.getInputDecoration('Full Name'),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: AppTheme.getInputDecoration('Email Address'),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: AppTheme.getInputDecoration('Phone Number'),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  maxLines: 4,
                  decoration: AppTheme.getInputDecoration('Message'),
                ),
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
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
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTheme.mediumRadius,
                      ),
                    ),
                    child: Text('Send Message', style: AppTheme.buttonText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContactItem(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.softWhite.withValues(alpha: 0.1),
        borderRadius: AppTheme.mediumRadius,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.luxuryGold.withValues(alpha: 0.2),
              borderRadius: AppTheme.mediumRadius,
            ),
            child: Icon(icon, color: AppTheme.luxuryGold, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.softWhite,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.softWhite.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(color: AppTheme.primaryBlack),
      child: Column(
        children: [
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.luxuryGold, width: 2),
                ),
                child: Center(
                  child: Text(
                    'P',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.luxuryGold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Panther Funerals',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.softWhite,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            'Providing compassionate funeral services with dignity and respect for over 15 years.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.softWhite.withValues(alpha: 0.7),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          // Quick Links
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 10,
            children: [
              _buildFooterLink('Home'),
              _buildFooterLink('About'),
              _buildFooterLink('Services'),
              _buildFooterLink('Gallery'),
              _buildFooterLink('Contact'),
            ],
          ),

          const SizedBox(height: 30),

          Container(height: 1, color: AppTheme.softWhite.withValues(alpha: 0.1)),

          const SizedBox(height: 20),

          Text(
            '© 2024 Panther Funerals. All rights reserved.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.softWhite.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 14,
          color: AppTheme.softWhite.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
