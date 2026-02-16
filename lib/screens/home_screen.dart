import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/certifications_section.dart';
import '../widgets/contact_section.dart';
import '../utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey certificatesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1100;

    return Scaffold(
      backgroundColor: AppTheme.bgBeige,
      appBar: WebAppBar(
        aboutKey: aboutKey,
        skillsKey: skillsKey,
        educationKey: educationKey,
        experienceKey: experienceKey,
        projectsKey: projectsKey,
        certificatesKey: certificatesKey,
        contactKey: contactKey,
        onLaunchURL: _launchURL,
      ),
      endDrawer: isMobile
          ? MobileDrawer(
        aboutKey: aboutKey,
        skillsKey: skillsKey,
        educationKey: educationKey,
        experienceKey: experienceKey,
        projectsKey: projectsKey,
        certificatesKey: certificatesKey,
        contactKey: contactKey,
        onLaunchURL: _launchURL,
      )
          : null,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HeroSection(projectsKey: projectsKey),
            _SectionWrapper(key: aboutKey, child: const AboutSection()),
            _SectionWrapper(key: skillsKey, child: const SkillsSection()),
            _SectionWrapper(key: educationKey, child: const EducationSection()),
            _SectionWrapper(key: experienceKey, child: const ExperienceSection()),
            _SectionWrapper(key: projectsKey, child: const ProjectsSection()),
            _SectionWrapper(key: certificatesKey, child: const CertificationsSection()),
            _SectionWrapper(key: contactKey, child: const ContactSection()),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _SectionWrapper extends StatelessWidget {
  final Widget child;
  const _SectionWrapper({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.bgBeige,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderLight,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          "© 2026 Mariam Taher • Built with Flutter",
          style: TextStyle(
            color: AppTheme.textDim,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}