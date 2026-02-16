import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../utils/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url.startsWith('http') || url.startsWith('tel') || url.startsWith('mailto')
        ? url
        : 'https://$url');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: PortfolioData.email,
      queryParameters: {'subject': 'Portfolio Inquiry'},
    );
    await launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            AppTheme.accentBrown.withOpacity(0.03),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 900 ? 80 : 24,
        vertical: 100,
      ),
      child: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.accentBrown.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.accentBrown.withOpacity(0.2)),
                ),
                child: Text(
                  "GET IN TOUCH",
                  style: GoogleFonts.nunito(
                    color: AppTheme.accentBrown,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Let's Connect",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Text(
                  "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your vision.",
                  style: GoogleFonts.nunito(
                    color: AppTheme.textSecondary,
                    height: 1.7,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialButton(
                    icon: Icons.email_outlined,
                    onPressed: _sendEmail,
                    tooltip: "Email Me",
                    color: AppTheme.accentMauve,
                  ),
                  const SizedBox(width: 16),
                  _SocialButton(
                    icon: FontAwesomeIcons.github,
                    onPressed: () => _launchURL(PortfolioData.github),
                    tooltip: "GitHub",
                    color: AppTheme.textMain,
                  ),
                  const SizedBox(width: 16),
                  _SocialButton(
                    icon: FontAwesomeIcons.linkedinIn,
                    onPressed: () => _launchURL('https://${PortfolioData.linkedin}'),
                    tooltip: "LinkedIn",
                    color: AppTheme.accentMauve,
                  ),
                ],
              ),
              const SizedBox(height: 64),

              Wrap(
                spacing: 48,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  _ContactInfo(
                    label: 'Email me at',
                    value: PortfolioData.email,
                    icon: Icons.email_outlined,
                    onTap: _sendEmail,
                  ),
                  _ContactInfo(
                    label: 'Call me at',
                    value: PortfolioData.phone,
                    icon: Icons.phone_outlined,
                    onTap: () => _launchURL('tel:${PortfolioData.phone}'),
                  ),
                  _ContactInfo(
                    label: 'Located in',
                    value: PortfolioData.location,
                    icon: Icons.location_on_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final Color color;

  const _SocialButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    required this.color,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: isHovered ? widget.color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered ? widget.color : AppTheme.borderLight,
              width: 1.5,
            ),
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: widget.color.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            ]
                : [
              BoxShadow(
                color: AppTheme.shadowColor,
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: IconButton(
            icon: widget.icon is IconData && (widget.icon as IconData).fontFamily == null
                ? Icon(widget.icon, color: isHovered ? Colors.white : widget.color)
                : FaIcon(widget.icon, color: isHovered ? Colors.white : widget.color),
            onPressed: widget.onPressed,
          ),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  const _ContactInfo({
    required this.label,
    required this.value,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(minWidth: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderLight),
          boxShadow: [
            BoxShadow(
              color: AppTheme.shadowColor,
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.accentBrown.withOpacity(0.1),
                    AppTheme.accentRose.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.accentBrown, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: GoogleFonts.nunito(
                color: AppTheme.textDim,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.nunito(
                color: AppTheme.textMain,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}