import 'package:benjola_app/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewLessonScreen extends StatefulWidget {
  const NewLessonScreen({super.key});

  @override
  State<NewLessonScreen> createState() => _NewLessonState();
}

class _NewLessonState extends State<NewLessonScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';
  Level _level = Level.a1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle leçon'),
      ),
      body: Column(
        children: [
          Form(
            key: _formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez ajouter un titre.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 1000,
                  decoration: const InputDecoration(
                    label: Text('Contenu'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez ajouter le contenu de la leçon.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _content = value!;
                  },
                ),
                DropdownButtonFormField(
                  value: _level,
                  decoration:
                      const InputDecoration(label: Text('Niveau de la leçon')),
                  items: Level.values.map((l) {
                    return DropdownMenuItem(
                      value: l,
                      child: Text(l.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _level = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Text('The title is $_title'),
                FilledButton(
                  onPressed: () async {
                    if (_formGlobalKey.currentState!.validate()) {
                      _formGlobalKey.currentState!.save();

                      final Lesson newLesson = Lesson(_title, _content, _level);

                      await Supabase.instance.client.from('lessons').insert({
                        'title': newLesson.title,
                        'content': newLesson.content,
                        'level': newLesson.level.name,
                      });
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
