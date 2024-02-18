import 'package:flutter/material.dart';

import 'AddDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QAAH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quick Action Against Harassment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 50,
              child: const Card(
                shadowColor: Colors.grey,
                elevation: 20,
                child: TextField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Mobile Number',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                child: const Text("Continue"),
                onPressed: () {
                  print('continue button clicked');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDetails()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
