# 📱 Flutter Portfolio App - Mariam Taher Kamel

A modern, animated Flutter portfolio application showcasing mobile development skills, projects, experience, and certifications.

## ✨ Features

- 🎨 **Modern UI/UX** - Beautiful gradient designs with smooth animations
- 🌓 **Dark/Light Theme** - Automatic theme switching based on system preferences
- 📱 **Responsive Design** - Optimized for all screen sizes
- 🎯 **Animated Sections** - Engaging transitions and micro-interactions
- 📊 **Project Showcase** - Detailed project cards with technology tags
- 💼 **Work Experience** - Timeline-based experience section
- 🏆 **Certifications Grid** - Colorful certification cards
- 📧 **Contact Section** - Easy-to-access contact information and social links

## 🛠️ Technologies Used

- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Google Fonts** - Beautiful typography (Playfair Display & Poppins)
- **Material Design 3** - Modern design system

## 📂 Project Structure

```
portfolio_app/
├── lib/
│   ├── main.dart                       # App entry point
│   ├── data/
│   │   └── portfolio_data.dart         # All portfolio content
│   ├── models/
│   │   └── portfolio_models.dart       # Data models
│   ├── screens/
│   │   ├── home_screen.dart            # Main screen
│   │   └── project_detail_screen.dart  # Project details
│   ├── utils/
│   │   └── app_theme.dart              # Theme configuration
│   └── widgets/
│       ├── custom_app_bar.dart         # Custom app bar
│       ├── hero_section.dart           # Hero/header section
│       ├── about_section.dart          # About me section
│       ├── skills_section.dart         # Skills showcase
│       ├── experience_section.dart     # Work experience
│       ├── projects_section.dart       # Projects grid
│       ├── certifications_section.dart # Certifications
│       └── contact_section.dart        # Contact info
├── pubspec.yaml                        # Dependencies
└── README.md                           # This file
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Installation Steps

1. **Clone or download this project**

2. **Navigate to the project directory**
   ```bash
   cd portfolio_app
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🎨 Customization

### Update Your Information

Edit `lib/data/portfolio_data.dart` to customize:

```dart
static const String name = "Your Name";
static const String title = "Your Title";
static const String email = "your.email@example.com";
static const String phone = "+1 234 567 8900";
// ... and more
```

### Change Theme Colors

Edit `lib/utils/app_theme.dart`:

```dart
static const Color primaryAccent = Color(0xFF6C63FF);  // Your color
static const Color secondaryAccent = Color(0xFFFF6584); // Your color
static const Color tertiaryAccent = Color(0xFF4ECDC4);  // Your color
```

### Add Your Projects

In `portfolio_data.dart`, add to the projects list:

```dart
Project(
  title: "Your Project Name",
  description: "Project description...",
  technologies: ["Flutter", "Firebase", "etc"],
  githubUrl: "https://github.com/yourusername/project",
  features: [
    "Feature 1",
    "Feature 2",
  ],
),
```

## 📱 Screenshots

The app includes:
- Animated hero section with rotating gradient avatar
- Skills section with animated chips
- Timeline-based experience section
- Project cards with detail screens
- Certification grid with gradient cards
- Contact section with social links

## 🎯 Key Highlights

- ✅ Clean architecture with separation of concerns
- ✅ Reusable widgets and components
- ✅ Smooth animations and transitions
- ✅ Professional gradient designs
- ✅ Easy to customize and extend
- ✅ No backend required - all data in code
- ✅ Lightweight and fast performance

## 📄 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0      # Beautiful fonts
  url_launcher: ^6.2.2       # Open URLs
  font_awesome_flutter: ^10.6.0  # Icons
```

## 🔧 Troubleshooting

**Issue: Google Fonts not loading**
- Make sure you have internet connection on first run
- Fonts are cached after first download

**Issue: Build errors**
- Run `flutter clean` then `flutter pub get`
- Check Flutter version: `flutter --version`

## 📝 License

This project is open source and available for personal and commercial use.

## 👤 Author

**Mariam Taher Kamel**
- GitHub: [@MariamTaher35](https://github.com/MariamTaher35)
- LinkedIn: [Mariam Taher](https://linkedin.com/in/mariam-taher-5873b4246)
- Email: mariamtaher714@gmail.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for beautiful typography
- Material Design for design guidelines

---

Made with ❤️ using Flutter
