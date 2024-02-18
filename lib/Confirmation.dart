import 'package:flutter/material.dart';
import 'package:quick_action_against_harassment/UserHome.dart';

import 'PanicConfirmed.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quick Action Against Harassment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have 5 minutes for Auto Confirmation of Emergency",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 22.2,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PanicConfirmed()));
                },
                child: Text('Confirm Panic')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => UserHome()));
                },
                child: Text("I'm safe")),
          ],
        ),
      ),
    );
  }
}
