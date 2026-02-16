# 🚀 Complete Setup Guide for Android Studio

## Prerequisites

Before you begin, make sure you have:

1. ✅ **Android Studio** (latest version) installed
2. ✅ **Flutter SDK** installed and configured
3. ✅ **Android SDK** (via Android Studio)
4. ✅ **An Android device or emulator**

---

## Step-by-Step Setup Instructions

### 1️⃣ Open the Project in Android Studio

1. Launch **Android Studio**
2. Click on **File** → **Open**
3. Navigate to the `portfolio_app` folder
4. Click **OK** to open the project

### 2️⃣ Install Flutter Plugin (if not already installed)

1. Go to **File** → **Settings** (or **Preferences** on Mac)
2. Navigate to **Plugins**
3. Search for **Flutter**
4. Click **Install**
5. Also install **Dart** plugin if prompted
6. Restart Android Studio

### 3️⃣ Configure Flutter SDK Path

1. Go to **File** → **Settings** → **Languages & Frameworks** → **Flutter**
2. Set the **Flutter SDK path** (usually: `C:\src\flutter` on Windows or `/Users/username/flutter` on Mac)
3. Click **Apply** and **OK**

### 4️⃣ Get Flutter Dependencies

**Option A: Using Terminal in Android Studio**
1. Open the terminal at the bottom of Android Studio
2. Run:
   ```bash
   flutter pub get
   ```

**Option B: Using IDE**
1. Open `pubspec.yaml`
2. Click on **Pub get** at the top of the file

### 5️⃣ Set Up an Android Emulator

**Create a New Emulator:**
1. Click on **Device Manager** (phone icon) in the toolbar
2. Click **Create Device**
3. Select a device (e.g., **Pixel 5**)
4. Select a system image (e.g., **API 33** or higher)
5. Click **Next** → **Finish**

**Or Use a Physical Device:**
1. Enable **Developer Options** on your Android device
2. Enable **USB Debugging**
3. Connect your device via USB
4. Accept the debugging prompt on your device

### 6️⃣ Run the App

1. Select your device/emulator from the device dropdown
2. Click the **Run** button (green play icon) or press **Shift + F10**
3. Wait for the app to build and install

---

## 📱 Project Structure Overview

```
portfolio_app/
├── lib/
│   ├── main.dart                    ← App entry point
│   ├── data/
│   │   └── portfolio_data.dart      ← YOUR CONTENT HERE
│   ├── models/
│   │   └── portfolio_models.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── project_detail_screen.dart
│   ├── utils/
│   │   └── app_theme.dart           ← Colors & themes
│   └── widgets/
│       ├── hero_section.dart
│       ├── about_section.dart
│       ├── skills_section.dart
│       ├── experience_section.dart
│       ├── projects_section.dart
│       ├── certifications_section.dart
│       └── contact_section.dart
├── android/                         ← Android-specific files
├── pubspec.yaml                     ← Dependencies
└── README.md
```

---

## 🎨 Customizing Your Portfolio

### Update Personal Information

Open `lib/data/portfolio_data.dart` and modify:

```dart
class PortfolioData {
  static const String name = "Your Name Here";
  static const String title = "Your Job Title";
  static const String email = "your.email@example.com";
  static const String phone = "+20 XXX XXX XXXX";
  static const String location = "Your City, Country";
  
  // LinkedIn, GitHub, etc.
  static const String linkedin = "linkedin.com/in/yourprofile";
  static const String github = "github.com/yourusername";
  
  static const String bio = "Your professional bio here...";
  
  // Continue editing skills, projects, experience, etc.
}
```

### Change App Colors

Open `lib/utils/app_theme.dart`:

```dart
// Change these colors to match your brand
static const Color primaryAccent = Color(0xFF6C63FF);    // Purple
static const Color secondaryAccent = Color(0xFFFF6584);  // Pink
static const Color tertiaryAccent = Color(0xFF4ECDC4);   // Teal
```

### Add Your Projects

In `portfolio_data.dart`, add to the projects list:

```dart
static List<Project> projects = [
  Project(
    title: "Your Amazing App",
    description: "Description of what your app does...",
    technologies: ["Flutter", "Firebase", "API"],
    githubUrl: "https://github.com/yourusername/your-repo",
    features: [
      "Feature 1: What it does",
      "Feature 2: Another cool feature",
      "Feature 3: And another",
    ],
  ),
  // Add more projects...
];
```

---

## 🔧 Common Issues & Solutions

### Issue 1: "SDK not found"
**Solution:**
- Go to **File** → **Settings** → **Languages & Frameworks** → **Flutter**
- Set correct Flutter SDK path
- Click **Apply**

### Issue 2: "Pub get failed"
**Solution:**
```bash
flutter clean
flutter pub get
```

### Issue 3: "Google Fonts not loading"
**Solution:**
- Ensure you have internet connection
- Fonts will be cached after first download
- Try running: `flutter pub cache repair`

### Issue 4: Build errors
**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### Issue 5: Emulator not starting
**Solution:**
- Open **Device Manager**
- Delete and recreate the emulator
- Ensure virtualization is enabled in BIOS (for Windows)

---

## 📦 Building Release APK

### For Testing (Debug APK)
```bash
flutter build apk --debug
```
APK location: `build/app/outputs/flutter-apk/app-debug.apk`

### For Production (Release APK)
```bash
flutter build apk --release
```
APK location: `build/app/outputs/flutter-apk/app-release.apk`

### For Google Play (App Bundle)
```bash
flutter build appbundle --release
```
Bundle location: `build/app/outputs/bundle/release/app-release.aab`

---

## 🎯 Hot Reload & Hot Restart

While the app is running:

- **Hot Reload**: Press `r` in terminal or **Ctrl + \** (preserves app state)
- **Hot Restart**: Press `R` in terminal or **Ctrl + Shift + \** (resets app state)
- **Stop**: Press `q` in terminal

---

## 📊 App Features

✅ **Animated Hero Section** - Rotating gradient avatar
✅ **About Section** - Bio and education
✅ **Skills Section** - Categorized skill chips
✅ **Experience Timeline** - Work history with timeline
✅ **Projects Showcase** - Detailed project cards
✅ **Certifications Grid** - Beautiful certification display
✅ **Contact Section** - Social links and contact info
✅ **Dark/Light Theme** - Automatic theme switching
✅ **Smooth Animations** - Professional transitions

---

## 🎨 Design Features

- **Modern Gradient Designs** - Eye-catching color schemes
- **Custom Typography** - Playfair Display & Poppins fonts
- **Responsive Layout** - Works on all screen sizes
- **Material Design 3** - Latest design guidelines
- **Smooth Animations** - Professional feel
- **Glass-morphism Effects** - Modern UI trends

---

## 📝 Next Steps

1. ✅ Set up the project in Android Studio
2. ✅ Run the app on emulator/device
3. ✅ Customize `portfolio_data.dart` with your information
4. ✅ Add your own projects and experiences
5. ✅ Customize colors in `app_theme.dart`
6. ✅ Test on different devices
7. ✅ Build release APK
8. ✅ Share your portfolio!

---

## 💡 Tips

- Use **Hot Reload** frequently while developing
- Test on multiple screen sizes
- Add your own project screenshots later
- Consider adding URL launcher for social links
- Keep the code clean and organized

---

## 🆘 Need Help?

If you encounter any issues:

1. Check the error message in the terminal
2. Run `flutter doctor` to diagnose problems
3. Check Flutter version: `flutter --version`
4. Make sure all dependencies are installed: `flutter pub get`

---

## 📄 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)
- [Google Fonts](https://fonts.google.com/)

---

**Happy Coding! 🚀**

Created with ❤️ using Flutter
