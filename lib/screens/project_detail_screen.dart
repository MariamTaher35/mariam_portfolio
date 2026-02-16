import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_theme.dart';

class ProjectDetailScreen extends StatelessWidget {
  final dynamic project;

  const ProjectDetailScreen({super.key, required this.project});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgBeige,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: AppTheme.textMain),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Text(
                  project.title,
                  style: GoogleFonts.cormorantGaramond(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: AppTheme.textMain,
                  ),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  if (project.imageUrl != null)
                    Image.asset(
                      project.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                  if (project.imageUrl != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40),
                      child: Image.asset(
                        project.imageUrl!,
                        fit: BoxFit.contain,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection(
                        context,
                        'Project Overview',
                        Icons.description_outlined,
                        Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: AppTheme.bgBeige,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppTheme.borderLight),
                          ),
                          child: Text(
                            project.description,
                            style: GoogleFonts.nunito(
                              color: AppTheme.textSecondary,
                              fontSize: 16,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      _buildSection(
                        context,
                        'Technologies Used',
                        Icons.build_circle_outlined,
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: project.technologies.map<Widget>((tech) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppTheme.accentBrown.withOpacity(0.1),
                                  AppTheme.accentRose.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.accentBrown.withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.nunito(
                                color: AppTheme.accentBrown,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          )).toList(),
                        ),
                      ),
                      const SizedBox(height: 48),
                      _buildSection(
                        context,
                        'Key Features',
                        Icons.star_outline_rounded,
                        Column(
                          children: project.features.map<Widget>((feature) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppTheme.bgBeige,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppTheme.borderLight),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppTheme.accentBrown.withOpacity(0.2),
                                        AppTheme.accentRose.withOpacity(0.2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: AppTheme.accentBrown,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: GoogleFonts.nunito(
                                      color: AppTheme.textSecondary,
                                      fontSize: 15,
                                      height: 1.6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )).toList(),
                        ),
                      ),
                      const SizedBox(height: 64),
                      if (project.githubUrl != null)
                        SizedBox(
                          width: double.infinity,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () => _launchURL(project.githubUrl!),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.accentBrown,
                                    AppTheme.accentRose,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.code_rounded, size: 24),
                                    const SizedBox(width: 12),
                                    Text(
                                      'View Source Code',
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context,
      String title,
      IconData icon,
      Widget content,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.accentBrown.withOpacity(0.1),
                    AppTheme.accentRose.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.accentBrown, size: 20),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.cormorantGaramond(
                color: AppTheme.textMain,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        content,
      ],
    );
  }
}