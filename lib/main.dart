import 'package:flutter/material.dart';

import 'package:benjola_app/screens/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  String supabaseKey = dotenv.env['SUPABASE_KEY'] ?? '';

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benjola',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 29, 143, 189)),
      ),
      home: const HomeScreen(),
    );
  }
}
