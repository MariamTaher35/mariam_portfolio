import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_theme.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final bool isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.surfaceCard,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isDesktop ? 80 : 40),
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Decorative header
              Icon(
                Icons.auto_awesome_rounded,
                color: AppTheme.accentGold,
                size: isMobile ? 24 : 32,
              ),
              const SizedBox(height: 16),
              Text(
                'Academic Background',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: isMobile ? 32 : (isDesktop ? 48 : 36),
                  color: AppTheme.accentBrown,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Building a strong foundation in computer science and technology',
                  style: GoogleFonts.nunito(
                    color: AppTheme.textDim,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: isMobile ? 40 : 64),

              // Education Card
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                padding: EdgeInsets.all(isMobile ? 24 : 48),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.bgCream,
                      AppTheme.accentPeach.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: AppTheme.accentMauve.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentMauve.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Adaptive Layout: Column for mobile, Row for desktop
                    Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: isMobile ? 70 : 80,
                          height: isMobile ? 70 : 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppTheme.accentMauve, AppTheme.accentRose],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.accentMauve.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.school_rounded,
                            color: Colors.white,
                            size: isMobile ? 32 : 40,
                          ),
                        ),
                        SizedBox(width: isMobile ? 0 : 24, height: isMobile ? 20 : 0),
                        Expanded(
                          flex: isMobile ? 0 : 1,
                          child: Column(
                            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bachelor of Computer and Information Systems',
                                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                                style: GoogleFonts.cormorantGaramond(
                                  fontSize: isMobile ? 22 : 28,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textMain,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Location Row
                              Wrap(
                                alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8,
                                children: [
                                  Icon(Icons.location_on_rounded, size: 18, color: AppTheme.accentBrown),
                                  Text(
                                    'El Shorouk Academy',
                                    style: GoogleFonts.nunito(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.accentBrown,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Cairo, Egypt',
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                    _buildDivider(),
                    const SizedBox(height: 32),

                    // Badges Section (Wrap handles overflow automatically)
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                      children: [
                        _buildBadge(
                          icon: Icons.calendar_today_rounded,
                          label: '2020 – 2024',
                          color: AppTheme.accentGold,
                        ),
                        _buildBadge(
                          icon: Icons.verified_rounded,
                          label: 'Graduated',
                          color: AppTheme.accentSage,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.accentRose.withOpacity(0),
            AppTheme.accentRose.withOpacity(0.3),
            AppTheme.accentRose.withOpacity(0),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color == AppTheme.accentSage ? color : AppTheme.accentBrown),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color == AppTheme.accentSage ? AppTheme.textMain : AppTheme.accentBrown,
            ),
          ),
        ],
      ),
    );
  }
}