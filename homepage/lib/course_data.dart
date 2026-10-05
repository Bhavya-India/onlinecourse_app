import 'package:flutter/material.dart';

class Course {
  final String title;
  final String instructor;
  final String category;
  final double rating;
  final int lessons;
  final String price;
  final IconData icon;
  final Color color;
  final String imageUrl;
  final String description;
  final List<String> learnPoints;
  final List<String> lessonTitles;

  const Course({
    required this.title,
    required this.instructor,
    required this.category,
    required this.rating,
    required this.lessons,
    required this.price,
    required this.icon,
    required this.color,
    required this.imageUrl,
    required this.description,
    required this.learnPoints,
    required this.lessonTitles,
  });
}

// Images come from LoremFlickr (keyword based photos). `lock` keeps the same
// photo every time. Replace with your own URLs or asset images anytime.
const List<Course> allCourses = [
  Course(
    title: 'Flutter App Development',
    instructor: 'Ravi Kumar',
    category: 'Programming',
    rating: 4.8,
    lessons: 48,
    price: '₹499',
    icon: Icons.phone_android,
    color: Color(0xFF5B5BD6),
    imageUrl: 'https://loremflickr.com/800/500/smartphone,app?lock=11',
    description:
        'Build beautiful, fast mobile apps for Android and iOS from a single '
        'codebase. You will go from Dart basics to publishing a complete '
        'app with navigation, state management and Firebase.',
    learnPoints: [
      'Dart language fundamentals',
      'Widgets, layouts and Material 3 design',
      'Navigation and state management',
      'Firebase login and database',
      'Publishing apps to the Play Store',
    ],
    lessonTitles: [
      'Introduction to Flutter & Dart',
      'Setting up your development environment',
      'Stateless and Stateful widgets',
      'Layouts: Row, Column and Stack',
      'Forms and input validation',
      'Navigation and routing',
      'State management basics',
      'Connecting to Firebase',
    ],
  ),
  Course(
    title: 'Python for Beginners',
    instructor: 'Anita Sharma',
    category: 'Programming',
    rating: 4.7,
    lessons: 36,
    price: '₹399',
    icon: Icons.code,
    color: Color(0xFF2E9E6B),
    imageUrl: 'https://loremflickr.com/800/500/coding,laptop?lock=12',
    description:
        'Start programming with the most beginner-friendly language. Learn '
        'core concepts through simple exercises and finish with small '
        'real-world projects like a calculator and a to-do app.',
    learnPoints: [
      'Variables, data types and operators',
      'Loops, conditions and functions',
      'Lists, dictionaries and file handling',
      'Object-oriented programming basics',
      'Building mini projects',
    ],
    lessonTitles: [
      'Installing Python and writing Hello World',
      'Variables and data types',
      'Conditions and loops',
      'Functions and modules',
      'Lists, tuples and dictionaries',
      'Working with files',
      'Intro to classes and objects',
      'Project: Command-line to-do app',
    ],
  ),
  Course(
    title: 'UI/UX Design Basics',
    instructor: 'Sneha Reddy',
    category: 'Design',
    rating: 4.6,
    lessons: 24,
    price: '₹449',
    icon: Icons.brush,
    color: Color(0xFFE0568B),
    imageUrl: 'https://loremflickr.com/800/500/design,sketch?lock=13',
    description:
        'Learn how to design apps and websites people love to use. Cover '
        'user research, wireframes, colour, typography and prototyping, '
        'and build a portfolio-ready case study.',
    learnPoints: [
      'Principles of user-centred design',
      'Wireframing and prototyping',
      'Colour theory and typography',
      'Designing for mobile and web',
      'Creating a design portfolio',
    ],
    lessonTitles: [
      'What is UI vs UX?',
      'Understanding users and research',
      'Sketching and low-fidelity wireframes',
      'Colour and typography essentials',
      'Designing components and layouts',
      'Building an interactive prototype',
      'Usability testing',
      'Project: Redesign a mobile app',
    ],
  ),
  Course(
    title: 'Digital Marketing',
    instructor: 'Kiran Patel',
    category: 'Business',
    rating: 4.5,
    lessons: 30,
    price: '₹349',
    icon: Icons.campaign,
    color: Color(0xFFE8863A),
    imageUrl: 'https://loremflickr.com/800/500/marketing,business?lock=14',
    description:
        'Grow brands online with proven strategies. Learn SEO, social media '
        'marketing, email campaigns and paid ads, and how to measure results '
        'with analytics.',
    learnPoints: [
      'Search engine optimisation (SEO)',
      'Social media strategy and content',
      'Email marketing campaigns',
      'Google and Facebook ads',
      'Tracking results with analytics',
    ],
    lessonTitles: [
      'Digital marketing overview',
      'Understanding your target audience',
      'SEO fundamentals',
      'Content marketing and blogging',
      'Social media marketing',
      'Email marketing',
      'Running paid ad campaigns',
      'Measuring success with analytics',
    ],
  ),
  Course(
    title: 'Data Science with Python',
    instructor: 'Dr. Meena Iyer',
    category: 'Data',
    rating: 4.9,
    lessons: 60,
    price: '₹699',
    icon: Icons.bar_chart,
    color: Color(0xFF2A8BC9),
    imageUrl: 'https://loremflickr.com/800/500/data,analytics?lock=15',
    description:
        'Turn raw data into insights. Learn data cleaning, visualisation and '
        'machine learning using Pandas, NumPy and Scikit-learn through '
        'hands-on projects.',
    learnPoints: [
      'Data analysis with Pandas and NumPy',
      'Data visualisation with Matplotlib',
      'Statistics for data science',
      'Machine learning fundamentals',
      'Real-world capstone project',
    ],
    lessonTitles: [
      'Introduction to data science',
      'NumPy arrays and operations',
      'Data cleaning with Pandas',
      'Visualising data',
      'Statistics and probability',
      'Intro to machine learning',
      'Regression and classification',
      'Capstone: Predict house prices',
    ],
  ),
  Course(
    title: 'Spoken English Mastery',
    instructor: 'John Thomas',
    category: 'Language',
    rating: 4.4,
    lessons: 20,
    price: 'Free',
    icon: Icons.record_voice_over,
    color: Color(0xFF8E5BD6),
    imageUrl: 'https://loremflickr.com/800/500/conversation,talking?lock=16',
    description:
        'Speak English with confidence in daily life, interviews and at '
        'work. Practise pronunciation, vocabulary and conversation skills '
        'with simple everyday exercises.',
    learnPoints: [
      'Everyday conversation phrases',
      'Clear pronunciation and accent tips',
      'Vocabulary building',
      'Interview and workplace English',
      'Overcoming fear of speaking',
    ],
    lessonTitles: [
      'Greetings and introductions',
      'Pronunciation basics',
      'Common daily phrases',
      'Asking questions and giving answers',
      'Telephone and meeting English',
      'Job interview practice',
      'Public speaking tips',
      'Role-play conversations',
    ],
  ),
];

/// Simple in-memory app state (replace with Provider/Riverpod/Firebase later).
class AppState {
  static final ValueNotifier<Set<String>> saved = ValueNotifier({});
  static final ValueNotifier<Set<String>> enrolled = ValueNotifier({});

  static void toggle(ValueNotifier<Set<String>> notifier, String title) {
    final updated = Set<String>.from(notifier.value);
    if (!updated.remove(title)) updated.add(title);
    notifier.value = updated;
  }
}