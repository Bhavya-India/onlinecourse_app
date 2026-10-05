import 'package:flutter/material.dart';
import 'course_data.dart';
import 'home_page.dart';

/// Reusable list page that shows the courses whose titles are in [source].
class CourseListPage extends StatelessWidget {
  final String title;
  final ValueNotifier<Set<String>> source;
  final IconData emptyIcon;
  final String emptyMessage;

  const CourseListPage({
    super.key,
    required this.title,
    required this.source,
    required this.emptyIcon,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ValueListenableBuilder<Set<String>>(
        valueListenable: source,
        builder: (context, titles, _) {
          final courses =
              allCourses.where((c) => titles.contains(c.title)).toList();

          if (courses.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(emptyIcon, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  Text(emptyMessage,
                      style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: courses.length,
            separatorBuilder: (_, _) => const SizedBox(height: 14),
            itemBuilder: (_, i) => CourseCard(course: courses[i]),
          );
        },
      ),
    );
  }
}

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CourseListPage(
      title: 'My Courses',
      source: AppState.enrolled,
      emptyIcon: Icons.play_circle_outline,
      emptyMessage: "You haven't enrolled in any course yet",
    );
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CourseListPage(
      title: 'Saved Courses',
      source: AppState.saved,
      emptyIcon: Icons.favorite_border,
      emptyMessage: 'No saved courses yet',
    );
  }
}