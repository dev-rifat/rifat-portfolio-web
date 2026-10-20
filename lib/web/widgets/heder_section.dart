import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  final Function(String) onMenuTap;
  const HeaderSection({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LOGO
          Text(
            "Rifat",
            style: GoogleFonts.poppins(
              color: const Color(0xFF3B82F6),
              fontSize: isMobile ? 22 : 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          /// DESKTOP NAVIGATION
          if (!isMobile)
            Row(
              children: [
                _navItem("About", onMenuTap),
                _navItem("Skills", onMenuTap),
                _navItem("Projects", onMenuTap),
                _navItem("Contact", onMenuTap),
              ],
            ),

          /// MOBILE MENU ICON
          if (isMobile)
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _navItem(String title, Function(String) onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => onTap(title),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
