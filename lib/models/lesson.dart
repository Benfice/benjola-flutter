enum Level {
  a1(title: 'A1'),
  a2(title: 'A2'),
  b1(title: 'B1'),
  b2(title: 'B2'),
  c1(title: 'C1'),
  c2(title: 'C2');

  const Level({
    required this.title,
  });

  final String title;
}

class Lesson {
  const Lesson(
    this.title,
    this.content,
    this.level,
  );

  final String title;
  final String content;
  final Level level;
}
