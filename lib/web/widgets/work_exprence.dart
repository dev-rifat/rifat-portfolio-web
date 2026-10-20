import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  final experiences = const [
    {
      "title": "Apps Developer - Futter",
      "company": "Gain Solutions Ltd - Mirpur 12, Dhaka, Bangladesh (Onsite)",
      "duration": "Jan 2023 - Present",
      "description":
          "Built and maintained Flutter applications for Android & iOS platforms. Developed HRM solutions and support software using Flutter framework. Implemented GetX for state management and Hive for local storage."
    },
    {
      "title": "Apps Developer - Futter",
      "company": "Data App LLC - USA (Remote)",
      "duration": "Oct 2022 - Dec 2023",
      "description":
          "Developed cross-platform mobile applications using Flutter framework. Built LMS, HRM, and E-commerce applications with responsive UI designs"
    },
    {
      "title": "Apps Developer - Futter",
      "company": "GigaSoft LTD.- Mirpur 2, Dhaka, Bangladesh (Onsite)",
      "duration": "Jun 2022 - OCT 2022",
      "description":
          "Started professional Flutter development career. Worked on various mobile projects learning best practices and architecture patterns."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 800;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 80,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Work Experience',
                onPressed: () {},
              ),
              const SizedBox(height: 60),
              Column(
                children: experiences.asMap().entries.map((entry) {
                  int idx = entry.key;
                  Map exp = entry.value;
                  return _experienceItem(
                    exp,
                    isMobile,
                    isLast: idx == experiences.length - 1,
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _experienceItem(Map exp, bool isMobile, {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line and Dot
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white24,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          // Experience Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1117),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            exp["title"],
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        _durationTag(exp["duration"]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exp["company"],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      exp["description"],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.white70,
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

  Widget _durationTag(String duration) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        duration,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF020817),
        ),
      ),
    );
  }
}
