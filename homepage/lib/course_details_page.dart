import 'package:flutter/material.dart';
import 'course_data.dart';
import 'course_image.dart';

class CourseDetailsPage extends StatelessWidget {
  final Course course;
  const CourseDetailsPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.bold);
    final moreLessons = course.lessons - course.lessonTitles.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
        actions: [
          ValueListenableBuilder<Set<String>>(
            valueListenable: AppState.saved,
            builder: (context, saved, _) {
              final isSaved = saved.contains(course.title);
              return IconButton(
                icon: Icon(isSaved ? Icons.favorite : Icons.favorite_border,
                    color: isSaved ? Colors.red : null),
                onPressed: () => AppState.toggle(AppState.saved, course.title),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CourseImage(
            course: course,
            height: 200,
            radius: 20,
            width: double.infinity,
          ),
          const SizedBox(height: 20),
          Text(course.category,
              style: TextStyle(
                  color: course.color, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text(course.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: course.color.withValues(alpha: 0.15),
                child: Icon(Icons.person, size: 16, color: course.color),
              ),
              const SizedBox(width: 8),
              Text(course.instructor,
                  style: TextStyle(color: Colors.grey.shade700)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _stat(Icons.star, '${course.rating}', Colors.amber),
              const SizedBox(width: 20),
              _stat(Icons.menu_book, '${course.lessons} lessons',
                  Colors.grey.shade700),
              const SizedBox(width: 20),
              _stat(Icons.access_time, '${course.lessons ~/ 4 + 1} weeks',
                  Colors.grey.shade700),
            ],
          ),
          const SizedBox(height: 24),
          Text('About this course', style: titleStyle),
          const SizedBox(height: 8),
          Text(course.description,
              style: TextStyle(color: Colors.grey.shade700, height: 1.5)),
          const SizedBox(height: 24),
          Text("What you'll learn", style: titleStyle),
          const SizedBox(height: 8),
          ...course.learnPoints.map(
            (point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, size: 20, color: course.color),
                  const SizedBox(width: 10),
                  Expanded(child: Text(point)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Course content', style: titleStyle),
          const SizedBox(height: 8),
          ...List.generate(course.lessonTitles.length, (i) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: course.color.withValues(alpha: 0.15),
                child: Text('${i + 1}', style: TextStyle(color: course.color)),
              ),
              title: Text(course.lessonTitles[i]),
              trailing: Icon(
                i == 0 ? Icons.play_circle_fill : Icons.lock_outline,
                color: i == 0 ? course.color : Colors.grey,
              ),
            );
          }),
          if (moreLessons > 0)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('+ $moreLessons more lessons after enrolling',
                  style: TextStyle(color: Colors.grey.shade600)),
            ),
          const SizedBox(height: 80),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: ValueListenableBuilder<Set<String>>(
            valueListenable: AppState.enrolled,
            builder: (context, enrolled, _) {
              final isEnrolled = enrolled.contains(course.title);
              return SizedBox(
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    if (!isEnrolled) {
                      AppState.toggle(AppState.enrolled, course.title);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Enrolled in ${course.title}')),
                      );
                    }
                  },
                  child: Text(
                    isEnrolled
                        ? 'Continue Learning'
                        : 'Enroll Now  •  ${course.price}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _stat(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}