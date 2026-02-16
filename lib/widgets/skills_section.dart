import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;
    final isTablet = screenWidth > 700 && screenWidth <= 1100;

    return Container(
      color: AppTheme.bgBeige,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 900 ? 80 : 24,
        vertical: 100,
      ),
      child: Center(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.spa_rounded, color: AppTheme.accentSage, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'Technical Expertise',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: isDesktop ? 48 : 36,
                      color: AppTheme.accentBrown,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.spa_rounded, color: AppTheme.accentSage, size: 20),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Text(
                  'The tools and technologies I use to bring ideas to life',
                  style: GoogleFonts.nunito(
                    color: AppTheme.textDim,
                    fontSize: 16,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 64),
              isDesktop
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: PortfolioData.skills
                    .map((skill) => Expanded(
                  child: _SkillCategory(skill: skill),
                ))
                    .toList(),
              )
                  : Wrap(
                spacing: 24,
                runSpacing: 24,
                children: PortfolioData.skills
                    .map((skill) => SizedBox(
                  width: isTablet ? (screenWidth - 100) / 2 : double.infinity,
                  child: _SkillCategory(skill: skill),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCategory extends StatefulWidget {
  final dynamic skill;
  const _SkillCategory({required this.skill});

  @override
  State<_SkillCategory> createState() => _SkillCategoryState();
}

class _SkillCategoryState extends State<_SkillCategory> {
  bool _isHovered = false;

  IconData _getIcon(String category) {
    switch (category.toLowerCase()) {
      case 'language':
        return Icons.code_rounded;
      case 'framework':
        return Icons.layers_outlined;
      case 'tool':
        return Icons.build_circle_outlined;
      default:
        return Icons.auto_awesome_outlined;
    }
  }

  Color _getAccentColor(String category) {
    switch (category.toLowerCase()) {
      case 'language':
        return AppTheme.accentTerracotta;
      case 'framework':
        return AppTheme.accentMauve;
      case 'tool':
        return AppTheme.accentSage;
      default:
        return AppTheme.accentBrown;
    }
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _getAccentColor(widget.skill.category);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(36),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          color: AppTheme.surfaceCard,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: _isHovered ? accentColor.withOpacity(0.4) : AppTheme.borderLight,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? accentColor.withOpacity(0.15) : AppTheme.shadowColor,
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 15 : 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor.withOpacity(0.25),
                    accentColor.withOpacity(0.15),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: accentColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                _getIcon(widget.skill.category),
                size: 32,
                color: accentColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.skill.category.toUpperCase(),
              style: GoogleFonts.cormorantGaramond(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.accentBrown,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 12,
              children: widget.skill.items
                  .map<Widget>(
                    (item) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppTheme.bgBeige,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.borderLight,
                    ),
                  ),
                  child: Text(
                    item,
                    style: GoogleFonts.nunito(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
