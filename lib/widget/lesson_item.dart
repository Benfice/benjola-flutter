import 'package:benjola_app/models/lesson.dart';
import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({
    super.key,
    required this.lesson,
  });

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(lesson.title),
    );
  }
}
