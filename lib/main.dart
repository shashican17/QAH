import 'package:flutter/material.dart';
import 'package:quick_action_against_harassment/Login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = '';
const supabaseKey ='';

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
