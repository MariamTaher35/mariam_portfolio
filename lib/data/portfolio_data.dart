import '../models/portfolio_models.dart';

class PortfolioData {
  static const String name = "Mariam Taher Kamel";
  static const String initials = "MK.";
  static const String title = "Mobile Application Developer";
  static const String tagline = "Mobile Application Developer crafting exceptional digital experiences.";
  static const String email = "mariamtaher714@gmail.com";
  static const String phone = "+20 114 095 0459";
  static const String location = "Cairo, Egypt";
  static const String linkedin = "www.linkedin.com/in/mariam-taher-5873b4246";
  static const String github = "https://github.com/MariamTaher35";
  static const String portfolio = "flutter-developer-portfo-4oxgqs1.gamma.site";

  static const String bio =
      "I am a passionate Mobile Application Developer based in Cairo, Egypt. With a strong foundation in modern development frameworks and a keen eye for detail, I specialize in building responsive, user-friendly applications that solve real-world problems. My journey in tech is driven by curiosity and a commitment to continuous learning.";

  static List<Skill> skills = [
    Skill(category: "Language", items: ["Dart", "Kotlin", "Java", "C#", "HTML5", "CSS3", "SQL"]),
    Skill(category: "Framework", items: ["Flutter", "Android SDK", "Provider/Bloc"]),
    Skill(category: "Tool", items: ["Android Studio", "VS Code", "Firebase", "Git/GitHub", "Figma", "RESTful APIs"]),
  ];

  static List<WorkExperience> experiences = [
    WorkExperience(
      position: "Flutter Developer Intern",
      company: "NPT Solutions (Paws Pal Connection), India",
      location: "India",
      duration: "Nov 2025 – Feb 2026",
      responsibilities: [
        "Developing comprehensive Flutter mobile app for integrated pet care platform. Implementing state management and real-time synchronization.",
      ],
    ),
    WorkExperience(
      position: "Mobile Application Developer Intern",
      company: "(DEPI), Cairo",
      location: "Cairo",
      duration: "Oct 2024 – May 2025",
      responsibilities: [
        "Engineered Food Planner Android app using Java, Kotlin, and Firebase for backend services and real-time data management.",
      ],
    ),
    WorkExperience(
      position: "Flutter Development Diploma",
      company: "Route Academy, Cairo",
      location: "Cairo",
      duration: "Aug 2023 – Nov 2023",
      responsibilities: [
        "Built multiple practical applications including XO Game, Islami App, and News App with API integration. Developed TODO App with Firebase backend.",
      ],
    ),
  ];

  static List<Project> projects = [
    Project(
      title: "Drive Wise – Smart Car Application",
      description:
      "Developed comprehensive smart car embedded system with real-time safety features, speed control, distance monitoring, and drowsiness detection. Integrated Firmware Over The Air (FOTA) updates through Flutter-based mobile UI for control and monitoring.",
      technologies: ["Flutter", "Embedded Systems", "FOTA"],
      githubUrl: "https://github.com/MariamTaher35/Drive_Wise",
      imageUrl: "assets/projects/drive_wise.png",
      features: [
        "Real-time speed control and distance monitoring",
        "Drowsiness detection algorithms",
        "Firmware Over The Air (FOTA) updates",
      ],
    ),
    Project(
      title: "Islami Application",
      description:
      "Comprehensive Islamic application enabling users to read the Quran, perform Tashbih, and access Hadith collections. Features bilingual interface (Arabic/English) with customizable light/dark themes.",
      technologies: ["Flutter", "Provider", "Dart"],
      githubUrl: "https://github.com/MariamTaher35/Application_Islami",
      imageUrl: "assets/projects/islami.png",
      features: [
        "Bilingual interface (Arabic/English)",
        "Customizable light/dark themes",
        "Provider state management",
      ],
    ),
    Project(
      title: "News Application",
      description:
      "Dynamic news aggregation platform integrating reliable APIs to deliver real-time articles across various categories. Features bilingual support and advanced search functionality.",
      technologies: ["Flutter", "API Integration", "Dart"],
      githubUrl: "https://github.com/MariamTaher35/News-Application",
      imageUrl: "assets/projects/news.jpg",
      features: [
        "Real-time news from multiple categories",
        "Bilingual support (English/Arabic)",
        "Advanced search functionality",
      ],
    ),
    Project(
      title: "Food Planner Application",
      description:
      "Feature-rich Android application leveraging MVVM architecture and Retrofit to provide dynamic meal discovery, daily recommendations, and high-performance image loading. The solution integrates Firebase for cross-device authentication and utilizes Room Database for robust offline access to favorites and meal planning data.",
      technologies: ["Android", "Kotlin", "Firebase", "Room", "Retrofit"],
      githubUrl: "https://github.com/MariamTaher35/Food_Planner_App",
      imageUrl: "assets/projects/food_planner.png",
      features: [
        "Comprehensive meal discovery by category, country, or ingredient",
        "Room-powered offline access and weekly meal planning",
        "Bilingual interface with Google/Email authentication",
        "MVVM architecture with high-performance media loading",
      ],
    ),
  ];

  static List<Certification> certifications = [
    Certification(
        title: "Flutter Internship Completion",
        issuer: "NPT Solutions",
        year: "2025-2026",
        imagePath: "assets/certificates/NPT_solutions.png"
    ),
    Certification(
        title: "Mobile App Developer",
        issuer: "DEPI",
        year: "2024-2025",
        imagePath: "assets/certificates/DEPI.png"
    ),
    Certification(
        title: "Flutter Development Diploma",
        issuer: "Route Academy",
        year: "2024",
        imagePath: "assets/certificates/Route.png"
    ),
    Certification(
        title: "AI Career Essentials",
        issuer: "ALX",
        year: "2024",
        imagePath: "assets/certificates/ALX.jpg"
    ),
    Certification(
        title: "Database Fundamentals",
        issuer: "Mahara-Tech",
        year: "2024",
        imagePath: "assets/certificates/DataBase_Fundamentals.png"
    ),
    Certification(
        title: "Software Testing",
        issuer: "Mahara-Tech",
        year: "2024",
        imagePath: "assets/certificates/introduction_software_testing.png"
    ),
    Certification(
        title: "Java Basic",
        issuer: "HackerRank",
        year: "2024",
        imagePath: "assets/certificates/java_basic.png"
    ),
  ];

  static const String education =
      "Bachelor of Computer and Information Systems\nEl Shorouk Academy, Cairo, Egypt (2020 – 2024)";
}