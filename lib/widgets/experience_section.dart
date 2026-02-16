import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Define breakpoints for responsiveness
    final bool isMobile = screenWidth < 768;
    final bool isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      color: AppTheme.bgBeige,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (screenWidth > 1200 ? screenWidth * 0.1 : 40),
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          // Prevents the section from becoming too wide on ultra-wide monitors
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Section Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.accentGold.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppTheme.accentGold.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  "EXPERIENCE",
                  style: GoogleFonts.nunito(
                    color: AppTheme.accentGold,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Professional Journey',
                textAlign: TextAlign.center,
                style: isMobile
                    ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textMain,
                )
                    : Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 16),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'My career path and professional growth',
                  style: GoogleFonts.nunito(
                    color: AppTheme.textDim,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: isMobile ? 40 : 64),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Elegant Timeline - Hidden on Mobile for better space usage
                  if (!isMobile)
                    SizedBox(
                      width: 40,
                      child: Column(
                        children: List.generate(
                          PortfolioData.experiences.length,
                              (index) => Column(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [AppTheme.accentBrown, AppTheme.accentMauve],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.accentBrown.withOpacity(0.3),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                              if (index != PortfolioData.experiences.length - 1)
                                Container(
                                  width: 2,
                                  height: 250, // Matches approximate card height
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppTheme.accentBrown.withOpacity(0.3),
                                        AppTheme.accentMauve.withOpacity(0.1),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (!isMobile) const SizedBox(width: 40),

                  // Experience Cards
                  Expanded(
                    child: Column(
                      children: PortfolioData.experiences
                          .map((exp) => _ExperienceCard(
                          experience: exp,
                          isMobile: isMobile
                      ))
                          .toList(),
                    ),
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

class _ExperienceCard extends StatefulWidget {
  final dynamic experience;
  final bool isMobile;

  const _ExperienceCard({
    required this.experience,
    required this.isMobile
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 32),
        padding: EdgeInsets.all(widget.isMobile ? 24 : 36),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -4.0 : 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered ? AppTheme.accentBrown.withOpacity(0.3) : AppTheme.borderLight,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppTheme.accentBrown.withOpacity(0.1)
                  : AppTheme.shadowColor,
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 12 : 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section: Swaps between Row and Column based on screen size
            Flex(
              direction: widget.isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: widget.isMobile ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.experience.position,
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: widget.isMobile ? 20 : 22,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textMain,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.business_rounded,
                            size: 16,
                            color: AppTheme.accentBrown,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.experience.company,
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.accentBrown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.isMobile) const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.accentGold.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.accentGold.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_today_rounded, size: 12, color: AppTheme.accentGold),
                      const SizedBox(width: 8),
                      Text(
                        widget.experience.duration,
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          color: AppTheme.accentGold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Responsibilities List
            ...widget.experience.responsibilities.map<Widget>((resp) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.accentBrown, AppTheme.accentMauve],
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      resp,
                      style: GoogleFonts.nunito(
                        fontSize: widget.isMobile ? 14 : 15,
                        height: 1.6,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}