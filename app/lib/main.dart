import 'package:flutter/material.dart';

void main() {
  runApp(const LearnHubApp());
}

class LearnHubApp extends StatelessWidget {
  const LearnHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Hub',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginPage(),
    );
  }
}

// ==================== LOGIN PAGE ====================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid email and password of at least 6 characters',
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // Logo
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 55,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Learn Hub',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Learn. Practice. Grow.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== COURSE MODEL ====================

class Course {
  final String title;
  final String description;
  final String instructor;
  final String duration;
  final String rating;
  final String students;
  final String logo;
  final Color color;
  final List<String> lessons;
  final List<String> learningPoints;

  const Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.duration,
    required this.rating,
    required this.students,
    required this.logo,
    required this.color,
    required this.lessons,
    required this.learningPoints,
  });
}

// ==================== COURSES ====================

const flutterCourse = Course(
  title: 'Flutter Development',
  description:
      'Learn Flutter and build beautiful cross-platform mobile applications.',
  instructor: 'Rahul Sharma',
  duration: '12 Hours',
  rating: '4.8',
  students: '12K',
  logo: 'assets/logos/flutter.png',
  color: Colors.blue,
  lessons: [
    'Introduction to Flutter',
    'Dart Programming Basics',
    'Widgets in Flutter',
    'Layouts and UI Design',
    'Navigation',
    'Forms and Validation',
    'API Integration',
    'Build Your First App',
  ],
  learningPoints: [
    'Understand Flutter fundamentals',
    'Learn Dart programming',
    'Build responsive user interfaces',
    'Navigate between screens',
    'Create real-world applications',
  ],
);

const pythonCourse = Course(
  title: 'Python Programming',
  description:
      'Learn Python from basics to advanced programming concepts.',
  instructor: 'Anjali Rao',
  duration: '15 Hours',
  rating: '4.9',
  students: '18K',
  logo: 'assets/logos/python.png',
  color: Colors.blueAccent,
  lessons: [
    'Introduction to Python',
    'Variables and Data Types',
    'Conditions and Loops',
    'Functions',
    'Lists and Tuples',
    'Dictionaries and Sets',
    'Object-Oriented Programming',
    'Python Projects',
  ],
  learningPoints: [
    'Learn Python syntax',
    'Work with data structures',
    'Write functions',
    'Understand OOP concepts',
    'Build Python projects',
  ],
);

const javaCourse = Course(
  title: 'Java Programming',
  description:
      'Master Java programming and object-oriented programming concepts.',
  instructor: 'Vikram Kumar',
  duration: '18 Hours',
  rating: '4.7',
  students: '10K',
  logo: 'assets/logos/java.png',
  color: Colors.orange,
  lessons: [
    'Introduction to Java',
    'Variables and Data Types',
    'Operators and Control Statements',
    'Arrays',
    'Classes and Objects',
    'Inheritance',
    'Polymorphism',
    'Exception Handling',
  ],
  learningPoints: [
    'Learn Java fundamentals',
    'Understand OOP',
    'Create classes and objects',
    'Use inheritance and polymorphism',
    'Build Java applications',
  ],
);

const webCourse = Course(
  title: 'Web Development',
  description:
      'Learn HTML, CSS and JavaScript to create modern websites.',
  instructor: 'Priya Singh',
  duration: '20 Hours',
  rating: '4.8',
  students: '15K',
  logo: 'assets/logos/html.png',
  color: Colors.deepOrange,
  lessons: [
    'HTML Basics',
    'HTML Forms',
    'CSS Fundamentals',
    'CSS Flexbox',
    'CSS Grid',
    'JavaScript Basics',
    'DOM Manipulation',
    'Build a Website',
  ],
  learningPoints: [
    'Create web pages using HTML',
    'Design websites using CSS',
    'Understand JavaScript',
    'Make websites interactive',
    'Build responsive websites',
  ],
);

const dsaCourse = Course(
  title: 'Data Structures & Algorithms',
  description:
      'Learn important data structures and algorithms for coding interviews.',
  instructor: 'Arjun Reddy',
  duration: '16 Hours',
  rating: '4.9',
  students: '20K',
  logo: 'assets/logos/cpp.png',
  color: Colors.indigo,
  lessons: [
    'Introduction to DSA',
    'Arrays',
    'Linked Lists',
    'Stacks',
    'Queues',
    'Trees',
    'Graphs',
    'Sorting Algorithms',
    'Searching Algorithms',
    'Interview Problems',
  ],
  learningPoints: [
    'Understand data structures',
    'Learn algorithmic thinking',
    'Solve coding problems',
    'Improve problem-solving skills',
    'Prepare for coding interviews',
  ],
);

const aiCourse = Course(
  title: 'Artificial Intelligence',
  description:
      'Understand AI concepts, machine learning and intelligent systems.',
  instructor: 'Dr. Neha Patel',
  duration: '14 Hours',
  rating: '4.8',
  students: '9K',
  logo: 'assets/logos/ai.png',
  color: Colors.purple,
  lessons: [
    'Introduction to AI',
    'AI and Machine Learning',
    'Data and Features',
    'Supervised Learning',
    'Unsupervised Learning',
    'Neural Networks',
    'Deep Learning',
    'AI Projects',
  ],
  learningPoints: [
    'Understand AI fundamentals',
    'Learn machine learning concepts',
    'Understand neural networks',
    'Explore deep learning',
    'Build basic AI projects',
  ],
);

// ==================== HOME PAGE ====================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeCoursesPage(),
    MyCoursesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ==================== HOME COURSES ====================

class HomeCoursesPage extends StatefulWidget {
  const HomeCoursesPage({super.key});

  @override
  State<HomeCoursesPage> createState() => _HomeCoursesPageState();
}

class _HomeCoursesPageState extends State<HomeCoursesPage> {
  final searchController = TextEditingController();

  final List<Course> allCourses = const [
    flutterCourse,
    pythonCourse,
    javaCourse,
    webCourse,
    dsaCourse,
    aiCourse,
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredCourses = allCourses.where((course) {
      return course.title.toLowerCase().contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Learn Hub',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'What do you want to learn today?',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Popular Courses',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: filteredCourses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== COURSE CARD ====================

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailsPage(
                course: course,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              // LOCAL LOGO
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: course.color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  course.logo,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.school,
                      size: 45,
                      color: course.color,
                    );
                  },
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      course.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(course.rating),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.access_time,
                          size: 17,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(course.duration),
                      ],
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== COURSE DETAILS ====================

class CourseDetailsPage extends StatelessWidget {
  final Course course;

  const CourseDetailsPage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
        backgroundColor: course.color,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 210,
              color: course.color.withOpacity(0.08),
              child: Center(
                child: Image.asset(
                  course.logo,
                  width: 130,
                  height: 130,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.school,
                      size: 100,
                      color: course.color,
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        course.rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.people,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text('${course.students} students'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'About This Course',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    course.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      _InfoItem(
                        icon: Icons.person,
                        title: 'Instructor',
                        value: course.instructor,
                      ),
                      _InfoItem(
                        icon: Icons.access_time,
                        title: 'Duration',
                        value: course.duration,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'What You Will Learn',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...course.learningPoints.map(
                    (point) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: course.color,
                            size: 21,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              point,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Course Lessons',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...course.lessons.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final lesson = entry.value;

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                course.color.withOpacity(0.12),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: course.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            lesson,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.play_circle_fill,
                            color: Colors.indigo,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LessonPage(
                                  course: course,
                                  lesson: lesson,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'You are enrolled in this course!',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: course.color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'ENROLL NOW',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== INFO ITEM ====================

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.indigo,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== LESSON PAGE ====================

class LessonPage extends StatelessWidget {
  final Course course;
  final String lesson;

  const LessonPage({
    super.key,
    required this.course,
    required this.lesson,
  });

  String getLessonContent() {
    if (course.title.contains('Flutter')) {
      return 'In this lesson, you will learn important Flutter concepts. Flutter is a UI toolkit used to build applications for Android, iOS, web and desktop using a single codebase.';
    }

    if (course.title.contains('Python')) {
      return 'In this lesson, you will learn Python programming concepts. Python is a beginner-friendly programming language widely used in web development, automation, data science and AI.';
    }

    if (course.title.contains('Java')) {
      return 'In this lesson, you will learn Java programming concepts. Java is a popular object-oriented programming language used to develop applications and enterprise software.';
    }

    if (course.title.contains('Web')) {
      return 'In this lesson, you will learn web development concepts using HTML, CSS and JavaScript. These technologies are the foundation of modern websites.';
    }

    if (course.title.contains('Data')) {
      return 'In this lesson, you will learn data structures and algorithms. DSA helps you solve programming problems efficiently and is important for technical interviews.';
    }

    return 'In this lesson, you will learn fundamental Artificial Intelligence concepts and how AI systems can be used to solve real-world problems.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson),
        backgroundColor: course.color,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 75,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              lesson,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              course.title,
              style: TextStyle(
                color: course.color,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Lesson Content',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              getLessonContent(),
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lesson marked as completed!'),
                    ),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text('Mark as Completed'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: course.color,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== MY COURSES ====================

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const myCourses = [
      flutterCourse,
      pythonCourse,
    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'My Courses',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: myCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: myCourses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== PROFILE ====================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.indigo,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Learn Hub Student',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'student@learnhub.com',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Support'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}