import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../screens/project_detail_screen.dart';
import '../utils/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 700 && screenWidth <= 1200;

    int crossAxisCount = isDesktop ? 2 : 1;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 900 ? 80 : 24,
        vertical: 100,
      ),
      child: Center(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.accentTerracotta.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.accentTerracotta.withOpacity(0.2)),
                ),
                child: Text(
                  "PORTFOLIO",
                  style: GoogleFonts.nunito(
                    color: AppTheme.accentTerracotta,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text('Featured Projects', style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Text(
                  'A showcase of my latest work and digital experiments',
                  style: GoogleFonts.nunito(color: AppTheme.textDim, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 64),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: isDesktop ? 1.1 : 0.95,
                ),
                itemCount: PortfolioData.projects.length,
                itemBuilder: (context, index) {
                  final project = PortfolioData.projects[index];
                  return _ProjectCard(
                    project: project,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDetailScreen(project: project),
                        ),
                      );
                    },
                    onGitHubTap: () {
                      if (project.githubUrl != null) _launchURL(project.githubUrl!);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final dynamic project;
  final VoidCallback onGitHubTap;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.project,
    required this.onGitHubTap,
    required this.onTap,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
          decoration: BoxDecoration(
            color: AppTheme.bgBeige,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: _isHovered ? AppTheme.accentBrown.withOpacity(0.3) : AppTheme.borderLight,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? AppTheme.accentBrown.withOpacity(0.15) : AppTheme.shadowColor,
                blurRadius: _isHovered ? 30 : 20,
                offset: Offset(0, _isHovered ? 15 : 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          widget.project.imageUrl ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.image_outlined,
                              color: AppTheme.textDim.withOpacity(0.3),
                              size: 48,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _isHovered ? 1.0 : 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppTheme.accentBrown.withOpacity(0.8),
                                  AppTheme.accentTerracotta.withOpacity(0.8),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Icon(Icons.visibility_rounded, color: Colors.white, size: 40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textMain,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Text(
                          widget.project.description,
                          style: GoogleFonts.nunito(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.technologies.take(3).map<Widget>((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppTheme.accentBrown.withOpacity(0.1),
                                  AppTheme.accentTerracotta.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppTheme.accentBrown.withOpacity(0.2)),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.nunito(
                                color: AppTheme.accentBrown,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: widget.onGitHubTap,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.code_rounded, size: 16, color: AppTheme.accentBrown),
                            const SizedBox(width: 8),
                            Text(
                              'View Code',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: AppTheme.accentBrown,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_forward_rounded, size: 14, color: AppTheme.accentBrown),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}