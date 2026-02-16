import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Container(
      width: double.infinity,
      color: AppTheme.bgCream,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 32 : 24),
        vertical: isDesktop ? 100 : 80,
      ),
      child: Center(
        child: SizedBox(
          width: isDesktop ? 900 : double.infinity,
          child: Column(
            children: [
              // Decorative header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppTheme.accentGold.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.favorite_rounded,
                      color: AppTheme.accentRose,
                      size: 20,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.accentGold.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Text(
                'About Me',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: isDesktop ? 48 : (isTablet ? 40 : 32),
                  color: AppTheme.accentBrown,
                ),
              ),
              const SizedBox(height: 48),

              Container(
                padding: EdgeInsets.all(isDesktop ? 48 : 32),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceCard,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: AppTheme.accentRose.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentRose.withOpacity(0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Decorative flourish
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.accentRose.withOpacity(0.2),
                            AppTheme.accentPeach.withOpacity(0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        Icons.auto_stories_rounded,
                        color: AppTheme.accentBrown,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      PortfolioData.bio,
                      style: GoogleFonts.nunito(
                        fontSize: isDesktop ? 18 : 16,
                        height: 2,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
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
}


