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
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        child: ListTile(
          title: Text(
            lesson.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: CircleAvatar(
            radius: 20,
            child: Text(lesson.level),
          ),
        ),
      ),
    );
  }
}
