class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? imageUrl;
  final List<String> features;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.imageUrl,
    required this.features,
  });
}

class WorkExperience {
  final String position;
  final String company;
  final String location;
  final String duration;
  final List<String> responsibilities;

  WorkExperience({
    required this.position,
    required this.company,
    required this.location,
    required this.duration,
    required this.responsibilities,
  });
}

class Skill {
  final String category;
  final List<String> items;

  Skill({
    required this.category,
    required this.items,
  });
}

class Certification {
  final String title;
  final String issuer;
  final String year;
  final String imagePath;

  Certification({
    required this.title,
    required this.issuer,
    required this.year,
    required this.imagePath,
  });
}