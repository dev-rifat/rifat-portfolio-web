import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1100;
    bool isDesktop = width >= 1100;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : isTablet ? 50 : 80,
            vertical: isMobile ? 40 : isTablet ? 60 : 80,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: _leftText(isMobile, isTablet, isDesktop),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Opacity(
                      opacity: _fadeAnimation.value,
                      child: _rightImage(isMobile, isTablet, isDesktop),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Transform.translate(
                        offset: Offset(-_slideAnimation.value, 0),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _leftText(isMobile, isTablet, isDesktop),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: Transform.translate(
                        offset: Offset(_slideAnimation.value, 0),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _rightImage(isMobile, isTablet, isDesktop),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _leftText(bool isMobile, bool isTablet, bool isDesktop) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi,",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "I'm Rifat",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 48 : 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Apps Developer",
          style: GoogleFonts.poppins(
            color: const Color(0xFF3B82F6),
            fontSize: isMobile ? 48 : 64,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 600,
          child: Text(
            "I develop modern, scalable Flutter applications for mobile and web, following clean architecture principles, with robust state management and seamless user experiences",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildButton(
              "View My Work",
              const Color(0xFF3B82F6),
              isMobile,
              hasIcon: true,
              click: () async {
                final url = Uri.parse("https://github.com/dev-rifat");
                if (await canLaunchUrl(url)) await launchUrl(url);
              },
            ),
            _buildButton(
              "My resume",
              Colors.transparent,
              isMobile,
              border: true,
              click: () async {
                final url = Uri.parse("https://drive.google.com/file/d/17c5KrbqtvnFzaWQ9QTpxq8X0nGL54kib/view?usp=sharing");
                if (await canLaunchUrl(url)) await launchUrl(url);
              },
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _socialIcon("assets/images/git.png", () async {
              final url = Uri.parse("https://github.com/dev-rifat");
              if (await canLaunchUrl(url)) await launchUrl(url);
            }),
            const SizedBox(width: 25),
            _socialIcon("assets/images/linkdin.png", () async {
              final url = Uri.parse("https://www.linkedin.com/in/lutfar-rahman-rifat-1a769323a");
              if (await canLaunchUrl(url)) await launchUrl(url);
            }),
            const SizedBox(width: 25),
            _socialIcon("assets/images/email.png", () async {
              final url = Uri.parse("mailto:lutfurrh850@gmail.com");
              if (await canLaunchUrl(url)) await launchUrl(url);
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    Color bgColor,
    bool isMobile, {
    bool border = false,
    bool hasIcon = false,
    required Function click,
  }) {
    return InkWell(
      onTap: () => click(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
          border: border ? Border.all(color: Colors.white24, width: 1) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (hasIcon) ...[
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _rightImage(bool isMobile, bool isTablet, bool isDesktop) {
    final double targetSize = isMobile ? 280 : isTablet ? 340 : 400;
    const double ringWidth = 20;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double available = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : targetSize;
        final double size = math.min(targetSize, available);
        final double dpr = MediaQuery.devicePixelRatioOf(context);

        return Align(
          alignment: Alignment.center,
          child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(ringWidth),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF0D1117),
              border: Border.all(color: Colors.white10, width: ringWidth),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/images/me.jpeg",
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.15),
                cacheWidth: (size * dpr).round(),
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1E293B), Color(0xFF0D1117)],
                    ),
                  ),
                  child: const Icon(Icons.person, size: 80, color: Colors.white38),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _socialIcon(String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        asset,
        width: 32,
        height: 32,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.link,
          size: 24,
          color: Colors.white70,
        ),
      ),
    );
  }
}
