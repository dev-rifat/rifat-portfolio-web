import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFF020817),
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          // Section Badge
          CustomButton(text: 'Technical Skills', onPressed: () {}),
          const SizedBox(height: 60),

          // Skills Grid using Wrap for exact layout control
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              SkillCategory(
                title: "Mobile Development",
                skills: [
                  "Flutter & Dart",
                  "Responsive UI Development",
                  "Pixel-perfect UI",
                  "Clean Architecture",
                  "Reusable Components",
                  "App Store Publishing",
                  "Play Store Publishing",
                ],
              ),
              SkillCategory(
                title: "State Management",
                skills: [
                  "GetX",
                  "BLoC Pattern",
                  "MVC Architecture",
                  "MVVM Architecture",
                  "Clean Architecture",
                  "Dependency Injection",
                ],
              ),
              SkillCategory(
                title: "APIs & Backend",
                skills: [
                  "REST APIs",
                  "GraphQL & Subscriptions",
                  "WebSocket",
                  "Real-time Data Handling",
                  "Firebase Auth",
                  "Firestore",
                  "Live chat",
                ],
              ),
              SkillCategory(
                title: "Features & Modules",
                skills: [
                  "Chat Modules",
                  "Payment Gateway Integration",
                  "Push Notification Systems",
                  "Offline Storage (Hive)",
                  "HRM Solutions",
                  "E-commerce Features",
                  "LMS Development",
                ],
              ),
              SkillCategory(
                title: "Push Notification",
                skills: [
                  "Firebase Cloud Messaging (FCM)",
                  "Pushy",
                  "Apple Push Notification (APNs)",
                  "Notification Systems",
                ],
              ),
              SkillCategory(
                title: "Tools & DevOps",
                skills: [
                  "Git & GitHub",
                  "GitLab",
                  "GitHub Actions CI/CD",
                  "Firebase App Distribution",
                  "Jira",
                  "Zen Hub",
                  "Trello",
                  "Slack",
                  "MS Teams",
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCategory extends StatefulWidget {
  final String title;
  final List<String> skills;

  const SkillCategory({
    super.key,
    required this.title,
    required this.skills,
  });

  @override
  State<SkillCategory> createState() => _SkillCategoryState();
}

class _SkillCategoryState extends State<SkillCategory> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 330,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF0E1628), // Matches dark background in screenshot
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered 
                ? const Color(0xFF3B82F6).withOpacity(0.8) 
                : Colors.white.withOpacity(0.05),
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: const Color(0xFF3B82F6).withOpacity(0.2), // Blue outer glow
                blurRadius: 40,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Vertical Blue Bar + Category Title
            Row(
              children: [
                Container(
                  width: 3.5,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            // Skill Pills
            Wrap(
              spacing: 10,
              runSpacing: 12,
              children: widget.skills.map((skill) => _SkillChip(skill: skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String skill;
  const _SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Matches pill background
        borderRadius: BorderRadius.circular(30), // Pill shape
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Text(
        skill,
        style: GoogleFonts.poppins(
          color: Colors.white.withOpacity(0.9),
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
