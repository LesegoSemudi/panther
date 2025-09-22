import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/luxury_navigation_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  String selectedService = 'General Inquiry';
  final List<String> services = [
    'General Inquiry',
    'Funeral Planning',
    'Pre-Planning',
    'Cremation Services',
    'Memorial Services',
    'Grief Support',
    'Other',
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
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
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

                  // Contact Form & Info
                  _buildContactSection(),

                  // Emergency Contact
                  _buildEmergencyContact(),

                  // Office Hours & Location
                  _buildLocationAndHours(),

                  // FAQ Section
                  _buildFAQSection(),
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
      height: 450,
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
                'Contact Us',
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
                  'We\'re here to help you through this difficult time. Our compassionate team is available 24/7 to provide support and guidance.',
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

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact Form
          Expanded(flex: 2, child: _buildContactForm()),

          const SizedBox(width: 80),

          // Contact Information
          Expanded(flex: 1, child: _buildContactInfo()),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send us a Message',
              style: GoogleFonts.playfairDisplay(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryBlack,
              ),
            ),
            const SizedBox(height: 30),

            // Name and Email Row
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Full Name *',
                    _nameController,
                    Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildTextField(
                    'Email Address *',
                    _emailController,
                    Icons.email_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Phone and Service Row
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Phone Number',
                    _phoneController,
                    Icons.phone_outlined,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(child: _buildServiceDropdown()),
              ],
            ),

            const SizedBox(height: 25),

            // Subject
            _buildTextField(
              'Subject *',
              _subjectController,
              Icons.subject_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),

            const SizedBox(height: 25),

            // Message
            _buildTextField(
              'Message *',
              _messageController,
              Icons.message_outlined,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),

            const SizedBox(height: 30),

            // Privacy Notice
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppTheme.lightGray.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Your privacy is important to us. All personal information will be kept confidential and used solely for the purpose of responding to your inquiry.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.charcoalGray,
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: AppTheme.primaryButton.copyWith(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                child: Text(
                  'Send Message',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlack,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppTheme.luxuryGold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.lightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.lightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.luxuryGold, width: 2),
            ),
            filled: true,
            fillColor: AppTheme.softWhite,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          style: GoogleFonts.inter(fontSize: 16, color: AppTheme.primaryBlack),
        ),
      ],
    );
  }

  Widget _buildServiceDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Service Type',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlack,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedService,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.business_center_outlined,
              color: AppTheme.luxuryGold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.lightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.lightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.luxuryGold, width: 2),
            ),
            filled: true,
            fillColor: AppTheme.softWhite,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items: services.map((service) {
            return DropdownMenuItem(
              value: service,
              child: Text(
                service,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppTheme.primaryBlack,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedService = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      children: [
        _buildContactCard(
          'Phone',
          '+27 11 123 4567',
          'Available 24/7',
          Icons.phone,
          onTap: () {
            // Handle phone call
          },
        ),

        const SizedBox(height: 30),

        _buildContactCard(
          'Email',
          'info@pantherfunerals.co.za',
          'Response within 24 hours',
          Icons.email,
          onTap: () {
            // Handle email
          },
        ),

        const SizedBox(height: 30),

        _buildContactCard(
          'Address',
          '123 Memorial Avenue\nJohannesburg, 2000\nSouth Africa',
          'Visit us anytime',
          Icons.location_on,
          onTap: () {
            // Handle map
          },
        ),

        const SizedBox(height: 40),

        Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.luxuryGold.withValues(alpha: 0.1),
                AppTheme.lightGray.withValues(alpha: 0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppTheme.luxuryGold.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(Icons.schedule, size: 40, color: AppTheme.luxuryGold),
              const SizedBox(height: 15),
              Text(
                'Emergency Service',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlack,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Available 24 hours a day,\n7 days a week',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppTheme.charcoalGray,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(
    String title,
    String content,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppTheme.cardShadow,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 30, color: AppTheme.primaryBlack),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryBlack,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppTheme.charcoalGray,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppTheme.charcoalGray.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContact() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
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
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: AppTheme.goldGradient,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.emergency,
                    size: 40,
                    color: AppTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Emergency Support',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.softWhite,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'When you need immediate assistance, we\'re here. Our emergency support team is available around the clock to help you during your time of need.',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: AppTheme.softWhite.withValues(alpha: 0.9),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.phone, color: AppTheme.luxuryGold, size: 24),
                    const SizedBox(width: 15),
                    Text(
                      '+27 11 911 HELP (4357)',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.luxuryGold,
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
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.softWhite.withValues(alpha: 0.1),
                    AppTheme.luxuryGold.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'What to expect when you call:',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.softWhite,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildExpectationItem(
                    'Immediate response from our caring staff',
                  ),
                  _buildExpectationItem('Guidance through next steps'),
                  _buildExpectationItem('Arrangement of necessary services'),
                  _buildExpectationItem('Emotional support and understanding'),
                  _buildExpectationItem('24/7 availability, no exceptions'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpectationItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 15),
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppTheme.softWhite.withValues(alpha: 0.9),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationAndHours() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Office Hours',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 30),

                _buildHoursRow('Monday - Friday', '8:00 AM - 6:00 PM'),
                _buildHoursRow('Saturday', '9:00 AM - 4:00 PM'),
                _buildHoursRow('Sunday', '10:00 AM - 2:00 PM'),
                _buildHoursRow('Holidays', 'By appointment'),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.luxuryGold.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.luxuryGold.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppTheme.luxuryGold,
                        size: 24,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Emergency services available 24/7',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 80),

          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.lightGray,
                    AppTheme.luxuryGold.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppTheme.cardShadow,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 80, color: AppTheme.luxuryGold),
                    const SizedBox(height: 20),
                    Text(
                      'Interactive Map',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Click to view our location',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppTheme.charcoalGray,
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

  Widget _buildHoursRow(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          Text(
            hours,
            style: GoogleFonts.inter(
              fontSize: 18,
              color: AppTheme.charcoalGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection() {
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
            'Frequently Asked Questions',
            style: AppTheme.sectionTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildFAQItem(
                      'What should I do first after a death occurs?',
                      'Contact us immediately at our 24/7 emergency number. We will guide you through the immediate steps and handle all necessary arrangements.',
                    ),
                    _buildFAQItem(
                      'Do you handle all the paperwork?',
                      'Yes, we take care of all death certificates, permits, and legal documentation required for the funeral service.',
                    ),
                    _buildFAQItem(
                      'Can I pre-plan my funeral?',
                      'Absolutely. Pre-planning allows you to make your wishes known and reduces the burden on your family during their time of grief.',
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              Expanded(
                child: Column(
                  children: [
                    _buildFAQItem(
                      'What payment options do you accept?',
                      'We accept cash, credit cards, bank transfers, and offer flexible payment plans to accommodate different financial situations.',
                    ),
                    _buildFAQItem(
                      'Do you provide grief support?',
                      'Yes, we offer ongoing grief support and can connect you with professional counseling services and support groups.',
                    ),
                    _buildFAQItem(
                      'Can you accommodate special requests?',
                      'We work closely with families to honor special requests and cultural or religious traditions that are important to you.',
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          Text(
            'Have more questions? Don\'t hesitate to reach out to our caring team.',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: AppTheme.charcoalGray,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            answer,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppTheme.charcoalGray,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Thank you for your message. We will respond within 24 hours.',
            style: GoogleFonts.inter(color: AppTheme.softWhite),
          ),
          backgroundColor: AppTheme.luxuryGold,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _subjectController.clear();
      _messageController.clear();
      setState(() {
        selectedService = 'General Inquiry';
      });
    }
  }
}
