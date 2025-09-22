import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/luxury_navigation_bar.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
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

                  // Main Services Section
                  _buildMainServicesSection(),

                  // Traditional Services
                  _buildTraditionalServicesSection(),

                  // Modern Services
                  _buildModernServicesSection(),

                  // Additional Services
                  _buildAdditionalServicesSection(),

                  // Pricing Section
                  _buildPricingSection(),

                  // Pre-Planning Section
                  _buildPrePlanningSection(),

                  // Contact Section
                  _buildContactSection(),
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
      height: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryBlack,
            AppTheme.primaryBlack.withValues(alpha: 0.9),
            AppTheme.charcoalGray,
          ],
        ),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Services',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 64,
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
                width: 700,
                child: Text(
                  'We offer a comprehensive range of funeral services designed to honor your loved one\'s memory and provide comfort to your family during this difficult time.',
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
    );
  }

  Widget _buildMainServicesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Our Main Services',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: _buildMainServiceCard(
                  'Traditional Funeral Services',
                  'Complete traditional funeral arrangements with viewing, ceremony, and burial services.',
                  Icons.church,
                  [
                    'Family consultation',
                    'Body preparation and embalming',
                    'Viewing arrangements',
                    'Religious or secular ceremony',
                    'Transportation services',
                    'Burial or interment',
                    'Death certificate assistance',
                  ],
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildMainServiceCard(
                  'Cremation Services',
                  'Dignified cremation services with various memorial options and personalized ceremonies.',
                  Icons.local_fire_department,
                  [
                    'Direct cremation',
                    'Cremation with ceremony',
                    'Memorial service planning',
                    'Urn selection',
                    'Ash scattering services',
                    'Memorial jewelry',
                    'Columbarium placement',
                  ],
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildMainServiceCard(
                  'Memorial Services',
                  'Personalized memorial celebrations that honor the unique life and legacy of your loved one.',
                  Icons.photo_album,
                  [
                    'Life celebration planning',
                    'Memorial video creation',
                    'Photo displays',
                    'Memory books',
                    'Guest registration',
                    'Reception arrangements',
                    'Keepsake coordination',
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainServiceCard(
    String title,
    String description,
    IconData icon,
    List<String> features,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 25),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 15),
          Text(description, style: AppTheme.bodyText),
          const SizedBox(height: 20),

          // Features list
          ...features
              .map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.luxuryGold,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.charcoalGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _buildTraditionalServicesSection() {
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
            'Traditional Services',
            style: AppTheme.sectionTitle,
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
                      'Full Service Funeral',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Our most comprehensive service includes everything needed for a traditional funeral. From initial arrangements to final interment, we handle every detail with care and professionalism.',
                      style: AppTheme.bodyText.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    _buildServiceFeature(
                      'Professional embalming and restoration',
                    ),
                    _buildServiceFeature('Premium casket selection'),
                    _buildServiceFeature('Viewing and visitation arrangements'),
                    _buildServiceFeature('Religious or secular ceremony'),
                    _buildServiceFeature('Graveside service'),
                    _buildServiceFeature('Transportation coordination'),
                    _buildServiceFeature('Memorial stationery'),
                    _buildServiceFeature('Grief support resources'),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              Expanded(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppTheme.cardShadow,
                    gradient: AppTheme.cardGradient,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.church,
                          size: 80,
                          color: AppTheme.luxuryGold,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Traditional Ceremony',
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceFeature(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, size: 14, color: AppTheme.primaryBlack),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              feature,
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

  Widget _buildModernServicesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Modern & Alternative Services',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.2,
            children: [
              _buildModernServiceCard(
                'Green Burial',
                'Environmentally conscious burial options using biodegradable materials and natural settings.',
                Icons.eco,
                AppTheme.goldGradient,
              ),
              _buildModernServiceCard(
                'Virtual Services',
                'Live-streamed ceremonies allowing distant family and friends to participate remotely.',
                Icons.videocam,
                AppTheme.goldGradient,
              ),
              _buildModernServiceCard(
                'Celebration of Life',
                'Uplifting gatherings that focus on celebrating the joy and achievements of your loved one.',
                Icons.celebration,
                AppTheme.goldGradient,
              ),
              _buildModernServiceCard(
                'Memorial Jewelry',
                'Beautiful keepsakes incorporating cremated remains or other meaningful elements.',
                Icons.diamond,
                AppTheme.goldGradient,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModernServiceCard(
    String title,
    String description,
    IconData icon,
    Gradient gradient,
  ) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
              boxShadow: AppTheme.glowShadow,
            ),
            child: Icon(icon, size: 35, color: AppTheme.primaryBlack),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTheme.bodyText.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalServicesSection() {
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
            'Additional Services',
            style: AppTheme.sectionTitle.copyWith(color: AppTheme.softWhite),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: _buildAdditionalServiceItem(
                  'Transportation',
                  'Professional hearse and limousine services for family transportation.',
                  Icons.directions_car,
                ),
              ),
              Expanded(
                child: _buildAdditionalServiceItem(
                  'Flowers & Arrangements',
                  'Beautiful floral tributes and arrangements to honor your loved one.',
                  Icons.local_florist,
                ),
              ),
              Expanded(
                child: _buildAdditionalServiceItem(
                  'Catering Services',
                  'Reception and meal arrangements for after-service gatherings.',
                  Icons.restaurant,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Row(
            children: [
              Expanded(
                child: _buildAdditionalServiceItem(
                  'Documentation',
                  'Assistance with death certificates, permits, and legal paperwork.',
                  Icons.description,
                ),
              ),
              Expanded(
                child: _buildAdditionalServiceItem(
                  'Grief Counseling',
                  'Professional support and counseling services for bereaved families.',
                  Icons.psychology,
                ),
              ),
              Expanded(
                child: _buildAdditionalServiceItem(
                  'Memorial Products',
                  'Headstones, urns, keepsakes, and other memorial items.',
                  Icons.ac_unit,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalServiceItem(
    String title,
    String description,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppTheme.softWhite.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppTheme.luxuryGold.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: AppTheme.luxuryGold),
          const SizedBox(height: 15),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.softWhite,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.softWhite.withValues(alpha: 0.8),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPricingSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Service Packages',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: _buildPricingCard(
                  'Essential',
                  'R15,000',
                  'Basic funeral service with essential arrangements',
                  [
                    'Basic casket',
                    'Transportation',
                    'Documentation assistance',
                    'Simple ceremony',
                    '24/7 support',
                  ],
                  false,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildPricingCard(
                  'Premium',
                  'R35,000',
                  'Comprehensive service with enhanced options',
                  [
                    'Premium casket selection',
                    'Embalming & restoration',
                    'Viewing arrangements',
                    'Full ceremony service',
                    'Transportation package',
                    'Floral arrangements',
                    'Memorial stationery',
                    'Grief support',
                  ],
                  true,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildPricingCard(
                  'Luxury',
                  'R55,000',
                  'Our most exclusive service with premium amenities',
                  [
                    'Luxury casket collection',
                    'Professional photography',
                    'Video memorial service',
                    'Premium venue options',
                    'Catering arrangements',
                    'Luxury transportation',
                    'Custom memorial products',
                    'Extended grief support',
                    'Personal coordinator',
                  ],
                  false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard(
    String title,
    String price,
    String description,
    List<String> features,
    bool isPopular,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: isPopular
            ? AppTheme.blackGoldGradient
            : AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isPopular ? AppTheme.hoverShadow : AppTheme.cardShadow,
        border: isPopular
            ? Border.all(color: AppTheme.luxuryGold, width: 2)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'MOST POPULAR',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryBlack,
                ),
              ),
            ),
          if (isPopular) const SizedBox(height: 20),

          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: isPopular ? AppTheme.softWhite : AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppTheme.luxuryGold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isPopular
                  ? AppTheme.softWhite.withValues(alpha: 0.9)
                  : AppTheme.charcoalGray,
            ),
          ),
          const SizedBox(height: 25),

          // Features
          ...features
              .map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 18,
                        color: AppTheme.luxuryGold,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isPopular
                                ? AppTheme.softWhite.withValues(alpha: 0.9)
                                : AppTheme.charcoalGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPopular
                    ? AppTheme.luxuryGold
                    : AppTheme.primaryBlack,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Contact for Details',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isPopular ? AppTheme.primaryBlack : AppTheme.softWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrePlanningSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.lightGray, AppTheme.softWhite],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pre-Planning Services', style: AppTheme.sectionTitle),
                const SizedBox(height: 30),
                Text(
                  'Planning ahead provides peace of mind and ensures your wishes are honored while relieving your family of difficult decisions during a time of grief.',
                  style: AppTheme.bodyText.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 30),

                _buildPrePlanningBenefit('Lock in today\'s prices'),
                _buildPrePlanningBenefit('Flexible payment plans available'),
                _buildPrePlanningBenefit('Personal consultation included'),
                _buildPrePlanningBenefit('Detailed documentation provided'),
                _buildPrePlanningBenefit('No obligation to family members'),
                _buildPrePlanningBenefit('Can be transferred to any location'),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {},
                  style: AppTheme.primaryButton,
                  child: const Text('Schedule Consultation'),
                ),
              ],
            ),
          ),

          const SizedBox(width: 80),

          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppTheme.cardShadow,
                gradient: AppTheme.goldGradient,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 80,
                      color: AppTheme.primaryBlack,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Plan Ahead',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Secure your family\'s future with thoughtful pre-planning',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.primaryBlack,
                        ),
                        textAlign: TextAlign.center,
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

  Widget _buildPrePlanningBenefit(String benefit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, size: 16, color: AppTheme.primaryBlack),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              benefit,
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

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppTheme.primaryBlack, AppTheme.deepBlack],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Ready to Discuss Your Needs?',
            style: GoogleFonts.playfairDisplay(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: AppTheme.softWhite,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            'Our compassionate team is available 24/7 to assist you with any questions or immediate needs.',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppTheme.softWhite.withValues(alpha: 0.9),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.luxuryGold,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.phone, color: AppTheme.primaryBlack),
                    const SizedBox(width: 10),
                    Text(
                      'Call Now: +27 (0)82 308 98 95',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 30),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.luxuryGold,
                  side: BorderSide(color: AppTheme.luxuryGold, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Schedule Consultation',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.luxuryGold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
