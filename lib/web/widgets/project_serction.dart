import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../global/widgets.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/images.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 70,
        horizontal: width < 500
            ? 16
            : width < 900
            ? 30
            : 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          _buildHeader(width),
          const SizedBox(height: 50),
          _buildProjectLayout(width),
          const SizedBox(height: 50),
          TextButton(

            onPressed: (){}, child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View all projects",style: TextStyle(color: Colors.blueAccent),),
                SizedBox(width: 8,),
                Icon(Icons.arrow_forward_outlined,color: Colors.blueAccent,)
              ],
            ),


          )

        ],
      ),
    );
  }

  // ------------------------------
  // HEADER
  // ------------------------------
  Widget _buildHeader(double width) {
    return Column(
      children: [
        CustomButton(text: 'Projects', onPressed: () {}),
        const SizedBox(height: 18),
        Text(
          "My Projects",
          style: GoogleFonts.poppins(
            fontSize: width < 500
                ? 28
                : width < 900
                ? 38
                : 48,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Check out some of my professional and personal projects.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: width < 500
                ? 14
                : width < 900
                ? 16
                : 18,
          ),
        ),
      ],
    );
  }

  // ------------------------------
  // RESPONSIVE LAYOUT ENGINE
  // ------------------------------
  Widget _buildProjectLayout(double width) {
    // Mobile (≤700px)
    if (width < 700) {
      return Column(
        children: List.generate(
          projects.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ProjectCard(project: projects[index], width: width),
          ),
        ),
      );
    }

    if (width >= 1800) return _buildGrid(3, width);
    if (width >= 1200) return _buildGrid(3, width);
    if (width >= 1024) return _buildGrid(2, width);
    if (width >= 900) return _buildGrid(2, width);
    if (width >= 700) return _buildGrid(1, width);
    return _buildGrid(1, width);
  }

  double _getAspectRatio(double width) {
    print("Screen width: $width");

    // ---------- 4K & ULTRAWIDE (2560px – 4000px+) ----------
    if (width >= 3000) return 1.35; // 4K large screens
    if (width >= 2500) return 1.28; // 1440p Ultrawide (34”)
    if (width >= 2000) return 1.20; // 27” 2K monitors

    // ---------- LARGE DESKTOP (1650px – 1999px) ----------
    if (width >= 1800) return 1.14; // Big screens
    if (width >= 1650) return 1.10; // 24" monitors

    // ---------- NORMAL DESKTOP / LAPTOP (1280px – 1600px) ----------
    if (width >= 1500) return 0.95; // 16" laptops
    if (width >= 1400) return 0.74; // 15" laptops
    if (width >= 1300) return 0.62; // 14" laptops

    // ---------- 13" MACBOOK & MEDIUM LAPTOPS (1024px – 1299px) ----------
    if (width >= 1200) return 0.56; // 13.6" MacBook Air M2/M3
    if (width >= 1179) return 0.98;
    if (width >= 1024) return 0.98;

    // ---------- TABLETS LANDSCAPE (900px – 1023px) ----------
    if (width >= 980)  return 0.98;  // iPad Pro 12.9" landscape
    if (width >= 900)  return 0.98;

    // ---------- TABLETS PORTRAIT / LARGE PHONES (700px – 899px) ----------
    if (width >= 820) return 0.98; // iPad Air 11" portrait
    if (width >= 768) return 0.98; // Standard iPad 10.2"
    if (width >= 700) return 0.98; // Android tablets portrait

    // ---------- BIG PHONES (500px – 699px) ----------
    if (width >= 600) return 0.98; // iPhone Pro Max
    if (width >= 550) return 0.98;
    if (width >= 500) return 0.98; // large Android phones

    // ---------- NORMAL PHONES (400px – 499px) ----------
    if (width >= 450) return 0.98;
    if (width >= 400) return 0.98;

    // ---------- SMALL PHONES (< 400px) ----------
    if (width >= 360) return 0.54; // older iPhones
    return 0.50; // smallest devices
  }



  Widget _buildGrid(int columns, double width) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        childAspectRatio: _getAspectRatio(width),
      ),
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index], width: width);
      },
    );
  }

  // SAMPLE DATA
  static final projects = [

    Project(
      title: "PayRun",
      description:
          "Complete HR & payroll management app with employee tracking, payroll automation and admin interface.",
      imageUrl: AppImages.payrun,
      appStoreUrl: "https://apps.apple.com/us/app/payrun/id6483939439",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.gainhq.payrun",
      tags: [
        "Flutter",
        "Graphql",
        "aws",
        "graphql subscription",
        "Firebase",
        "Pushy",
        "Apns Server",
        "Hive",
        "Local notification",
        "Websocket",
      ],
    ),
    Project(
      title: "Gain.io",
      description:
          "Gain.io is a CRM platform for sales, customer support, and live chat management.",
      imageUrl: AppImages.gainio,
      appStoreUrl: "https://apps.apple.com/us/app/gain-io/id6760332301",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.gainhq.gainio&pcampaignid=web_share",
      tags: [
        "Flutter",
        "Graphql",
        "aws",
        "graphql subscription",
        "Pushy",
        "Apns Server",
        "Local notification",
      ],
    ),
    Project(
      title: "EasyDesk",
      description:
          "EasyDesk is more than just a helpdesk software. It is a complete online customer...",
      imageUrl: AppImages.easyDesk,
      appStoreUrl:
          "https://apps.apple.com/us/app/easydesk-support/id6738735433",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.gainhq.easydesk&hl=en",
      tags: [
        "Flutter",
        "Graphql",
        "aws",
        "graphql subscription",
        "Pushy",
        "Apns Server",
        "Local notification",
      ],
    ),
    
    
    Project(
      title: "LMS Mobile",
      description:
          "Full-featured LMS for students with offline access, quizzes & video learning...",
      imageUrl: AppImages.rise,
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.data_app_lms.lms_mobile_android_ios&hl=en",
      tags: ["Flutter", "REST API", "GetX", "SQLite"],
    ),

    Project(
      title: "Mango Cart",
      description:
          "Mango lets you order fresh mangoes and premium beef from trusted local suppliers—fast, easy, and delivered to your door...",
      imageUrl: AppImages.mangoCart,
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.rifatalhasan.mango_app_user&hl=en",
      tags: ["Flutter", "REST API", "GetX", "SQLite","WebSocket"],
    ),  Project(
      title: "Mango Cart Distributor",
      description:
          "Seasonal mangoes and premium beef, delivered fast from trusted local suppliers...",
      imageUrl: AppImages.mangoCart,
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.rifatalhasan.mango_app_admin&hl=en",
      tags: ["Flutter", "REST API", "GetX", "SQLite","WebSocket"],
    ),

  ];
}

// ===============================================
// MODEL
// ===============================================
class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final String? appStoreUrl;
  final String? playStoreUrl;

  /// Link opened by the "Details" button. Falls back to the store pages
  /// when not set explicitly.
  final String? detailsUrl;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    this.appStoreUrl,
    this.playStoreUrl,
    this.detailsUrl,
  });

  String? get detailsTarget => detailsUrl ?? playStoreUrl ?? appStoreUrl;
}

// ===============================================
// PROJECT CARD (FULLY RESPONSIVE)
// ===============================================
class ProjectCard extends StatefulWidget {
  final Project project;
  final double width;

  const ProjectCard({super.key, required this.project, required this.width});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  /// Whether the pointer is currently over this card.
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered == value || !mounted) return;
    setState(() => _hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    // dynamic card sizing
    final isSmall = widget.width < 450;
    final isMobile = widget.width < 700;

    final cardPadding = isSmall
        ? 10
        : isMobile
        ? 14
        : 18;
    final titleSize = isSmall
        ? 14
        : isMobile
        ? 16
        : 18;
    final descSize = isSmall
        ? 11
        : isMobile
        ? 12
        : 14;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedScale(
        scale: _hovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovered ? -8 : 0, 0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFF243044) : const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _hovered
                  ? Colors.blueAccent.withOpacity(0.6)
                  : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              if (_hovered)
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.28),
                  blurRadius: 30,
                  spreadRadius: 2,
                )
              else
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE (zooms slightly on hover)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            child: AnimatedScale(
              scale: _hovered ? 1.08 : 1.0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOut,
              child: Image.asset(
                widget.project.imageUrl,
                height: isSmall
                    ? 100
                    : isMobile
                    ? 140
                    : 190,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // CONTENT
          Padding(
            padding: EdgeInsets.all(cardPadding.toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: titleSize.toDouble(),
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // DESCRIPTION (AUTO TRIMS)
                Text(
                  widget.project.description,
                  maxLines: isSmall ? 3 : 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: descSize.toDouble(),
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 12),

                // TAGS
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: widget.project.tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF334155),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.poppins(
                              fontSize: isSmall ? 9 : 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                SizedBox(height: 20),



                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      _storeBadge(AppImages.appstore, widget.project.appStoreUrl),
                      const SizedBox(width: 8),
                      _storeBadge(AppImages.playstore, widget.project.playStoreUrl),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                OutlinedButton.icon(
                  onPressed: () {
                    final url = widget.project.detailsTarget;
                    if (url != null) _openUrl(url);
                  },

                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueAccent, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isSmall ? 4 : 8,
                      horizontal: 20,
                    ),
                  ),

                  label: Wrap(
                    children: [
                      Text(
                        "Details",
                        style: GoogleFonts.poppins(
                          fontSize: isSmall ? 10 : 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
                // BUTTONS
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
          ),
        ),
      );
  }

  // Store badge — opens the given store URL when the project has one.
  Widget _storeBadge(String asset, String? url) {
    final Widget badge = Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black, width: 2),
        image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
      ),
    );

    if (url == null) return badge;

    return InkWell(
      onTap: () => _openUrl(url),
      borderRadius: BorderRadius.circular(4),
      child: badge,
    );
  }
}

/// Opens [url] in a new tab (web) / the platform browser (mobile).
Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) await launchUrl(uri);
}
