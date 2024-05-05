import 'package:flutter/material.dart';
import 'package:quick_action_against_harassment/Login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://zbezdqhhdyppyzoxkuau.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpiZXpkcWhoZHlwcHl6b3hrdWF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE1NTkzNTYsImV4cCI6MjAyNzEzNTM1Nn0.T6RLVw5DsfFqrrsxenIb6fGPlkDCljHg0caj81wNTbE';

void main() {
  Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quick Action Against Harassment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Login(title: 'Quick Action Against Harassment'));
  }
}
