import 'package:benjola_app/models/lesson.dart';
import 'package:benjola_app/providers/lessons_provider.dart';
import 'package:benjola_app/screens/lesson_content.dart';
import 'package:benjola_app/widget/lesson_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void selectLesson(BuildContext context, Lesson lesson) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => LessonScreen(
          lesson: lesson,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsProvider);

    Widget content = const Center(
      child: Text('No lesson yet...'),
    );

    if (lessons.isNotEmpty) {
      content = ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (ctx, index) => LessonItem(
          lesson: lessons[index],
          onSelectLesson: (lesson) {
            selectLesson(context, lesson);
          },
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benjola'),
      ),
      body: content,
    );
  }
}
