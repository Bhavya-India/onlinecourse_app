import 'package:flutter/material.dart';
import 'course_data.dart';

/// Shows a course photo with a loading state and an icon fallback
/// (used when offline or if the image fails to load).
class CourseImage extends StatelessWidget {
  final Course course;
  final double? width;
  final double height;
  final double radius;

  const CourseImage({
    super.key,
    required this.course,
    this.width,
    required this.height,
    this.radius = 14,
  });

  Widget _placeholder({bool loading = false}) {
    return Container(
      width: width,
      height: height,
      color: course.color.withValues(alpha: 0.15),
      child: Center(
        child: loading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    strokeWidth: 2.5, color: course.color),
              )
            : Icon(course.icon, size: height / 2.2, color: course.color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        course.imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) =>
            progress == null ? child : _placeholder(loading: true),
        errorBuilder: (context, error, stack) => _placeholder(),
      ),
    );
  }
}