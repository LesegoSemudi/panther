import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/luxury_navigation_bar.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  String selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Facilities',
    'Services',
    'Memorials',
    'Ceremonies',
  ];

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

                  // Category Filter
                  _buildCategoryFilter(),

                  // Gallery Grid
                  _buildGalleryGrid(),

                  // Virtual Tour Section
                  _buildVirtualTourSection(),

                  // Testimonials Gallery
                  _buildTestimonialsGallery(),

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
                'Our Gallery',
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
                  'Explore our beautiful facilities, professional services, and meaningful ceremonies that honor the lives of those we serve.',
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

  Widget _buildCategoryFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected
                    ? AppTheme.luxuryGold
                    : Colors.transparent,
                foregroundColor: isSelected
                    ? AppTheme.primaryBlack
                    : AppTheme.primaryBlack,
                elevation: isSelected ? 8 : 0,
                side: BorderSide(
                  color: isSelected
                      ? AppTheme.luxuryGold
                      : AppTheme.charcoalGray,
                  width: 1.5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                category,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppTheme.primaryBlack
                      : AppTheme.charcoalGray,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGalleryGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          // Main Featured Images
          Row(
            children: [
              Expanded(
                child: _buildGalleryCard(
                  'Chapel Interior',
                  'Our peaceful chapel provides a serene setting for ceremonies',
                  'Facilities',
                  height: 400,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    _buildGalleryCard(
                      'Memorial Garden',
                      'Beautiful outdoor space for reflection',
                      'Facilities',
                      height: 190,
                    ),
                    const SizedBox(height: 20),
                    _buildGalleryCard(
                      'Reception Hall',
                      'Elegant space for post-service gatherings',
                      'Facilities',
                      height: 190,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Services Gallery
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8,
            children: [
              _buildGalleryCard(
                'Traditional Service',
                'Dignified traditional funeral ceremony',
                'Services',
              ),
              _buildGalleryCard(
                'Memorial Display',
                'Personalized memorial arrangements',
                'Memorials',
              ),
              _buildGalleryCard(
                'Viewing Room',
                'Private viewing areas for families',
                'Facilities',
              ),
              _buildGalleryCard(
                'Cremation Ceremony',
                'Respectful cremation services',
                'Services',
              ),
              _buildGalleryCard(
                'Floral Arrangements',
                'Beautiful tribute flowers',
                'Memorials',
              ),
              _buildGalleryCard(
                'Ceremony Setup',
                'Professional ceremony preparation',
                'Ceremonies',
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Memorial Products
          Row(
            children: [
              Expanded(
                child: _buildGalleryCard(
                  'Memorial Urns',
                  'Beautiful urns and keepsake collection',
                  'Memorials',
                  height: 300,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildGalleryCard(
                  'Casket Selection',
                  'Premium casket options available',
                  'Services',
                  height: 300,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildGalleryCard(
                  'Memorial Jewelry',
                  'Keepsake jewelry and mementos',
                  'Memorials',
                  height: 300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryCard(
    String title,
    String description,
    String category, {
    double? height,
  }) {
    final isVisible = selectedCategory == 'All' || selectedCategory == category;

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.3,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: AppTheme.cardShadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              // Placeholder image with gradient
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.lightGray,
                      AppTheme.softWhite,
                      AppTheme.luxuryGold.withValues(alpha: 0.1),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    _getCategoryIcon(category),
                    size: 60,
                    color: AppTheme.luxuryGold.withValues(alpha: 0.7),
                  ),
                ),
              ),

              // Overlay with hover effect
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppTheme.primaryBlack.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.luxuryGold,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          category,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryBlack,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.softWhite,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.softWhite.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Click overlay
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _showImageDialog(title, description);
                  },
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Facilities':
        return Icons.business;
      case 'Services':
        return Icons.support_agent;
      case 'Memorials':
        return Icons.favorite;
      case 'Ceremonies':
        return Icons.church;
      default:
        return Icons.photo;
    }
  }

  void _showImageDialog(String title, String description) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 600,
          height: 400,
          decoration: BoxDecoration(
            gradient: AppTheme.cardGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppTheme.hoverShadow,
          ),
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.luxuryGold.withValues(alpha: 0.2),
                      AppTheme.lightGray,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.photo,
                    size: 80,
                    color: AppTheme.luxuryGold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryBlack,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(description, style: AppTheme.bodyText),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Close',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.luxuryGold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVirtualTourSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primaryBlack, AppTheme.charcoalGray],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Virtual Tour',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.softWhite,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Take a virtual tour of our facilities from the comfort of your home. Explore our chapel, reception areas, and memorial gardens through our interactive 360° tour.',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.softWhite.withValues(alpha: 0.9),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.luxuryGold,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.threed_rotation,
                            color: AppTheme.primaryBlack,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Start Virtual Tour',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20),

                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.luxuryGold,
                        side: BorderSide(color: AppTheme.luxuryGold, width: 2),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Schedule Visit',
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
          ),

          const SizedBox(width: 80),

          Expanded(
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppTheme.hoverShadow,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.luxuryGold.withValues(alpha: 0.3),
                    AppTheme.softWhite.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppTheme.goldGradient,
                        boxShadow: AppTheme.glowShadow,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: 50,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '360° Virtual Tour',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.softWhite,
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

  Widget _buildTestimonialsGallery() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        children: [
          Text(
            'Families We\'ve Served',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            children: [
              Expanded(
                child: _buildTestimonialCard(
                  'The Johnson Family',
                  'Panther Funerals provided exceptional care during our most difficult time. Their attention to detail and compassionate service helped us honor our father\'s memory beautifully.',
                  '⭐⭐⭐⭐⭐',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildTestimonialCard(
                  'Sarah and Michael Williams',
                  'Professional, caring, and respectful throughout the entire process. We couldn\'t have asked for better support during our time of grief.',
                  '⭐⭐⭐⭐⭐',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildTestimonialCard(
                  'The Rodriguez Family',
                  'From pre-planning to the final service, every detail was handled with dignity and grace. Highly recommend their services.',
                  '⭐⭐⭐⭐⭐',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(
    String family,
    String testimonial,
    String rating,
  ) {
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
              shape: BoxShape.circle,
              gradient: AppTheme.goldGradient,
            ),
            child: Icon(
              Icons.format_quote,
              size: 40,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            testimonial,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppTheme.charcoalGray,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(rating, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Text(
            family,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
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
          colors: [AppTheme.lightGray, AppTheme.softWhite],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Visit Our Facilities',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            'We invite you to visit our facilities and see firsthand the care and attention we put into every detail.',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppTheme.charcoalGray,
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
                style: AppTheme.primaryButton,
                child: const Text('Schedule a Visit'),
              ),

              const SizedBox(width: 30),

              OutlinedButton(
                onPressed: () {},
                style: AppTheme.secondaryButton,
                child: const Text('Contact Us'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
