import 'package:benjola_app/widget/lesson_item.dart';
import 'package:flutter/material.dart';
import 'package:benjola_app/data/lessons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No lesson yet...'),
    );

    if (lessons.isNotEmpty) {
      content = ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (ctx, index) => LessonItem(
          lesson: lessons[index],
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
