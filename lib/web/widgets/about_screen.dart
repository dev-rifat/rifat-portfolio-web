import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFF020817),
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : 80,
      ),
      child: Column(
        children: [
          // Badge
          CustomButton(text: 'About Me', onPressed: () {}),
          const SizedBox(height: 30),

          // Title
          Text(
            'Who I Am',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),

          // Description
          SizedBox(
            width: 1000,
            child: Text(
              "I'm a dedicated Flutter developer specializing in fast, beautiful, and scalable cross-platform mobile apps. "
              "Focused on clean architecture, performance optimization, and pixel-perfect UI to deliver smooth, modern user experiences.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 80),

          // Responsive Content: Features & Journey
          isMobile
              ? Column(
                  children: [
                    _buildFeaturesColumn(),
                    const SizedBox(height: 60),
                    _buildJourneyCard(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: _buildFeaturesColumn()),
                    const SizedBox(width: 80),
                    Expanded(flex: 1, child: _buildJourneyCard()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildFeaturesColumn() {
    return Column(
      children: [
        _featureItem(
          Icons.shield_outlined,
          'Reliable & Secure',
          'I build applications with reliability and security at their core, ensuring your data stays protected.',
        ),
        const SizedBox(height: 32),
        _featureItem(
          Icons.lightbulb_outline,
          'Innovative Solutions',
          'I use modern technologies and industry best practices to solve problems creatively and efficiently.',
        ),
        const SizedBox(height: 32),
        _featureItem(
          Icons.architecture,
          'User-Focused Design',
          'I prioritize user experience to create intuitive, smooth, and visually appealing interfaces.',
        ),
      ],
    );
  }

  Widget _featureItem(IconData icon, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                desc,
                style: GoogleFonts.poppins(
                  color: Colors.white60,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJourneyCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Journey',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Flutter developer with 3+ years of experience building scalable, high-performance mobile apps. "
          "Skilled in GetX, BLoC, REST / GraphQL, Firebase, CI/CD, and push notifications. "
          "Experienced in full development lifecycle – UI/UX, architecture, and publishing to Play Store & App Store.",
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 16,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}
