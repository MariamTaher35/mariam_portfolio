import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey educationKey;
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final GlobalKey certificatesKey;
  final GlobalKey contactKey;
  final Function(String) onLaunchURL;

  const WebAppBar({
    super.key,
    required this.aboutKey,
    required this.skillsKey,
    required this.educationKey,
    required this.experienceKey,
    required this.projectsKey,
    required this.certificatesKey,
    required this.contactKey,
    required this.onLaunchURL,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  void _scrollToSection(BuildContext context, GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
      alignment: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1100;

    if (isMobile) {
      return AppBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              AppTheme.accentBrown,
              AppTheme.accentRose,
            ],
          ).createShader(bounds),
          child: Text(
            PortfolioData.initials,
            style: GoogleFonts.cormorantGaramond(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, color: AppTheme.textMain),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: AppTheme.borderLight,
          ),
        ),
      );
    }

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: AppTheme.borderLight, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                AppTheme.accentBrown,
                AppTheme.accentRose,
              ],
            ).createShader(bounds),
            child: Text(
              PortfolioData.initials,
              style: GoogleFonts.cormorantGaramond(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 28,
                letterSpacing: -1,
              ),
            ),
          ),
          const Spacer(),
          _NavLink(label: 'About', onTap: () => _scrollToSection(context, aboutKey)),
          const SizedBox(width: 32),
          _NavLink(label: 'Skills', onTap: () => _scrollToSection(context, skillsKey)),
          const SizedBox(width: 32),
          _NavLink(label: 'Education', onTap: () => _scrollToSection(context, educationKey)),
          const SizedBox(width: 32),
          _NavLink(label: 'Experience', onTap: () => _scrollToSection(context, experienceKey)),
          const SizedBox(width: 32),
          _NavLink(label: 'Projects', onTap: () => _scrollToSection(context, projectsKey)),
          const SizedBox(width: 32),
          _NavLink(label: 'Certificates', onTap: () => _scrollToSection(context, certificatesKey)),
          const SizedBox(width: 32),
          _NavLink(label: 'Contact', onTap: () => _scrollToSection(context, contactKey)),
          const SizedBox(width: 24),
          Container(height: 25, width: 1, color: AppTheme.borderLight),
          const SizedBox(width: 24),
          _SocialIconButton(
            icon: FontAwesomeIcons.github,
            onPressed: () => onLaunchURL(PortfolioData.github),
          ),
          const SizedBox(width: 12),
          _SocialIconButton(
            icon: FontAwesomeIcons.linkedinIn,
            onPressed: () => onLaunchURL('https://${PortfolioData.linkedin}'),
          ),
        ],
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey educationKey;
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final GlobalKey certificatesKey;
  final GlobalKey contactKey;
  final Future<void> Function(String) onLaunchURL;

  const MobileDrawer({
    super.key,
    required this.aboutKey,
    required this.skillsKey,
    required this.educationKey,
    required this.experienceKey,
    required this.projectsKey,
    required this.certificatesKey,
    required this.contactKey,
    required this.onLaunchURL,
  });

  void _scrollTo(BuildContext context, GlobalKey key) {
    Navigator.pop(context);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (key.currentContext == null) return;
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.accentBrown.withOpacity(0.1),
                  AppTheme.accentRose.withOpacity(0.1),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      AppTheme.accentBrown,
                      AppTheme.accentRose,
                    ],
                  ).createShader(bounds),
                  child: Text(
                    PortfolioData.initials,
                    style: GoogleFonts.cormorantGaramond(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: AppTheme.textMain),
                ),
              ],
            ),
          ),
          _DrawerTile(label: 'About', onTap: () => _scrollTo(context, aboutKey)),
          _DrawerTile(label: 'Skills', onTap: () => _scrollTo(context, skillsKey)),
          _DrawerTile(label: 'Education', onTap: () => _scrollTo(context, educationKey)),
          _DrawerTile(label: 'Experience', onTap: () => _scrollTo(context, experienceKey)),
          _DrawerTile(label: 'Projects', onTap: () => _scrollTo(context, projectsKey)),
          _DrawerTile(label: 'Certificates', onTap: () => _scrollTo(context, certificatesKey)),
          _DrawerTile(label: 'Contact', onTap: () => _scrollTo(context, contactKey)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _DrawerSocialIcon(
                  icon: FontAwesomeIcons.github,
                  onTap: () => onLaunchURL(PortfolioData.github),
                ),
                const SizedBox(width: 16),
                _DrawerSocialIcon(
                  icon: FontAwesomeIcons.linkedinIn,
                  onTap: () => onLaunchURL('https://${PortfolioData.linkedin}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _isHovered ? AppTheme.accentBrown : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.nunito(
              color: _isHovered ? AppTheme.accentBrown : AppTheme.textSecondary,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialIconButton({required this.icon, required this.onPressed});

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered ? AppTheme.accentBrown.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon: FaIcon(
            widget.icon,
            color: _isHovered ? AppTheme.accentBrown : AppTheme.textSecondary,
            size: 18,
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DrawerTile({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            label,
            style: GoogleFonts.nunito(
              color: AppTheme.textMain,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          onTap: onTap,
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: AppTheme.textDim,
          ),
        ),
        Divider(color: AppTheme.borderLight, height: 1),
      ],
    );
  }
}

class _DrawerSocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerSocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderLight),
          color: AppTheme.bgCream,
        ),
        child: FaIcon(icon, color: AppTheme.textMain, size: 20),
      ),
    );
  }
}