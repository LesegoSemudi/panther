import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/luxury_navigation_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.softWhite,
      body: Column(
        children: [
          // Navigation Bar
          Container(
            color: AppTheme.primaryBlack,
            child: const LuxuryNavigationBar(),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  // Hero Section
                  _buildHeroSection(),

                  // Company Story Section
                  _buildCompanyStorySection(),

                  // Mission & Values Section
                  _buildMissionValuesSection(),

                  // Team Section
                  _buildTeamSection(),

                  // Our Philosophy Section
                  _buildPhilosophySection(),

                  // Awards & Recognition
                  _buildAwardsSection(),

                  // Footer
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryBlack,
            AppTheme.primaryBlack.withValues(alpha: 0.8),
            AppTheme.charcoalGray,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 72,
                          fontWeight: FontWeight.w300,
                          color: AppTheme.softWhite,
                          height: 0.9,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 100,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: AppTheme.goldGradient,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 600,
                        child: Text(
                          'For over two decades, Panther Funerals has been providing compassionate, dignified, and personalized funeral services to families during their most difficult times.',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.softWhite.withValues(alpha: 0.9),
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyStorySection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Row(
        children: [
          // Left content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Our Story', style: AppTheme.sectionTitle),
                const SizedBox(height: 30),
                Text(
                  'Founded in 2002 by John and Maria Panther, our funeral home began with a simple mission: to honor the lives of those who have passed while providing comfort and support to grieving families.',
                  style: AppTheme.bodyText.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Text(
                  'What started as a small family business has grown into one of the most respected funeral service providers in the region, known for our attention to detail, compassionate care, and commitment to excellence.',
                  style: AppTheme.bodyText.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 30),

                // Key milestones
                _buildMilestone('2002', 'Founded by John and Maria Panther'),
                _buildMilestone('2008', 'Opened our second location'),
                _buildMilestone('2015', 'Introduced green burial services'),
                _buildMilestone('2020', 'Launched virtual memorial services'),
                _buildMilestone('2023', 'Served over 5,000 families'),
              ],
            ),
          ),

          const SizedBox(width: 80),

          // Right image
          Expanded(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppTheme.cardShadow,
                gradient: AppTheme.cardGradient,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: AppTheme.lightGray,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.business,
                          size: 80,
                          color: AppTheme.luxuryGold,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Our Facility',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestone(String year, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              shape: BoxShape.circle,
              boxShadow: AppTheme.buttonShadow,
            ),
            child: Center(
              child: Text(
                year,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryBlack,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionValuesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.lightGray, AppTheme.softWhite],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Our Mission & Values',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: _buildValueCard(
                  'Compassion',
                  'We approach every family with empathy, understanding, and genuine care during their time of loss.',
                  Icons.favorite,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildValueCard(
                  'Dignity',
                  'Every service is conducted with the utmost respect and reverence for the deceased and their loved ones.',
                  Icons.security,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildValueCard(
                  'Excellence',
                  'We strive for perfection in every detail, ensuring each service meets our highest standards.',
                  Icons.star,
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              gradient: AppTheme.blackGoldGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppTheme.hoverShadow,
            ),
            child: Column(
              children: [
                Text(
                  'Our Mission',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.softWhite,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'To provide families with meaningful, personalized funeral services that celebrate life, honor memory, and offer comfort during times of grief. We are committed to supporting our community with compassionate care, professional expertise, and unwavering integrity.',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.softWhite.withValues(alpha: 0.9),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              shape: BoxShape.circle,
              boxShadow: AppTheme.glowShadow,
            ),
            child: Icon(icon, size: 40, color: AppTheme.primaryBlack),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: AppTheme.bodyText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Meet Our Team',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: _buildTeamMember(
                  'John Panther',
                  'Founder & Director',
                  'With over 25 years of experience, John leads our team with compassion and dedication.',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildTeamMember(
                  'Maria Panther',
                  'Co-Founder & Family Liaison',
                  'Maria specializes in grief counseling and family support services.',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildTeamMember(
                  'Dr. Sarah Johnson',
                  'Mortician & Embalmer',
                  'Licensed mortician with expertise in restoration and preservation.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, String description) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.goldGradient,
              boxShadow: AppTheme.glowShadow,
            ),
            child: Icon(Icons.person, size: 60, color: AppTheme.primaryBlack),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            role,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.luxuryGold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: AppTheme.bodyText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophySection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryBlack, AppTheme.charcoalGray],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Our Philosophy',
            style: AppTheme.sectionTitle.copyWith(color: AppTheme.softWhite),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Celebrating Life',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.luxuryGold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'We believe that every life deserves to be celebrated and remembered in a meaningful way. Our approach focuses on honoring the unique story of each individual, creating personalized services that reflect their personality, values, and legacy.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.softWhite.withValues(alpha: 0.9),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Supporting Families',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.luxuryGold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Grief is a deeply personal journey, and we are committed to providing support every step of the way. From the initial arrangements to long-term bereavement care, our team is here to guide and comfort families through their healing process.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.softWhite.withValues(alpha: 0.9),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAwardsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Awards & Recognition',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAward('Excellence in Service', '2023'),
              _buildAward('Community Service Award', '2022'),
              _buildAward('Professional Excellence', '2021'),
              _buildAward('Outstanding Care', '2020'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAward(String title, String year) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: AppTheme.goldGradient,
            shape: BoxShape.circle,
            boxShadow: AppTheme.glowShadow,
          ),
          child: Icon(
            Icons.emoji_events,
            size: 50,
            color: AppTheme.primaryBlack,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlack,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          year,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppTheme.luxuryGold,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryBlack, AppTheme.deepBlack],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.luxuryGold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone: +27 (0)82 308 98 95\nEmail: info@pantherfunerals.co.za\nAddress: 123 Memorial Drive, Johannesburg',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.softWhite.withValues(alpha: 0.8),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hours of Operation',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.luxuryGold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Monday - Friday: 8:00 AM - 6:00 PM\nSaturday: 9:00 AM - 4:00 PM\nSunday: By appointment\n24/7 Emergency Service Available',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.softWhite.withValues(alpha: 0.8),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
