import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/app_theme.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  final GlobalKey projectsKey;

  const HeroSection({
    super.key,
    required this.projectsKey,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.bgCream,
            AppTheme.bgBeige,
            AppTheme.accentPeach.withOpacity(0.1),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Decorative floral elements
          Positioned(
            top: 50,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.accentRose.withOpacity(0.15),
                    AppTheme.accentRose.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.accentMauve.withOpacity(0.12),
                    AppTheme.accentMauve.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          // Decorative dots
          Positioned(
            top: 150,
            left: 100,
            child: _DecorativeDots(),
          ),
          Positioned(
            bottom: 200,
            right: 150,
            child: _DecorativeDots(),
          ),

          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Availability Badge with feminine touch
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceCard,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppTheme.accentRose.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.accentRose.withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppTheme.accentRose,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.accentRose.withOpacity(0.5),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "AVAILABLE FOR HIRE",
                          style: GoogleFonts.nunito(
                            color: AppTheme.accentBrown,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Decorative line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
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
                          Icons.star_rounded,
                          color: AppTheme.accentGold,
                          size: 20,
                        ),
                      ),
                      Container(
                        width: 60,
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
                  const SizedBox(height: 32),

                  // Main Headline
                  Text(
                    "Hello, I'm",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: isMobile ? 18 : 24,
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Mariam Taher",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: isMobile ? 52 : 88,
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accentBrown,
                      shadows: [
                        Shadow(
                          color: AppTheme.accentRose.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tagline with decorative elements
                  SizedBox(
                    width: isMobile ? double.infinity : 700,
                    child: Text(
                      PortfolioData.tagline,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: isMobile ? 16 : 20,
                        color: AppTheme.textSecondary,
                        height: 1.8,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // CTA Buttons - Girly style
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _GirlyButton(
                        label: 'View My Work',
                        isPrimary: true,
                        icon: Icons.arrow_forward_rounded,
                        onPressed: () {
                          Scrollable.ensureVisible(
                            projectsKey.currentContext!,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                      ),
                      _GirlyButton(
                        label: "Download CV",
                        isPrimary: false,
                        icon: Icons.download_rounded,
                        onPressed: () {
                          const String assetPath = 'assets/my_cv/Mariam_Taher_Kamel.pdf';
                          html.AnchorElement anchorElement = html.AnchorElement(href: assetPath);
                          anchorElement.download = "Mariam_Taher_Kamel_CV.pdf";
                          anchorElement.click();
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),

                  // Scroll Indicator
                  _ScrollIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GirlyButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final IconData icon;
  final VoidCallback onPressed;

  const _GirlyButton({
    required this.label,
    required this.isPrimary,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<_GirlyButton> createState() => _GirlyButtonState();
}

class _GirlyButtonState extends State<_GirlyButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, isHovered ? -4.0 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: widget.isPrimary
                ? LinearGradient(
              colors: [
                AppTheme.accentBrown,
                AppTheme.accentLightBrown,
              ],
            )
                : null,
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: widget.isPrimary
                    ? AppTheme.accentBrown.withOpacity(0.3)
                    : AppTheme.accentRose.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ]
                : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.isPrimary ? Colors.transparent : AppTheme.surfaceCard,
              foregroundColor: widget.isPrimary ? Colors.white : AppTheme.accentBrown,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
              elevation: 0,
              shadowColor: Colors.transparent,
              side: widget.isPrimary
                  ? BorderSide.none
                  : BorderSide(
                color: AppTheme.accentRose.withOpacity(0.4),
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(widget.icon, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DecorativeDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.only(right: 8),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppTheme.accentGold.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 10 * _controller.value),
          child: Opacity(
            opacity: 1 - _controller.value,
            child: Column(
              children: [
                Text(
                  'Scroll to explore',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: AppTheme.textDim,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppTheme.accentGold,
                  size: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}