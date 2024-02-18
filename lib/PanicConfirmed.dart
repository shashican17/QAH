import 'package:flutter/material.dart';

class PanicConfirmed extends StatefulWidget {
  const PanicConfirmed({super.key});

  @override
  State<PanicConfirmed> createState() => _PanicConfirmedState();
}

class _PanicConfirmedState extends State<PanicConfirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quick Action Against Harassment'),
      ),
      body: Center(
        child: Text(
          "Please keep calm, the help is arriving.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue, fontSize: 22.2, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
