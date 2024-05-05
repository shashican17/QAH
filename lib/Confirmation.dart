import 'package:flutter/material.dart';

import 'PanicConfirmed.dart';

class Confirmation extends StatefulWidget {
  final String userPhoneNumber;
  const Confirmation({super.key, required this.userPhoneNumber});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => UserHome(
                  //               userPhoneNumber: widget.userPhoneNumber,
                  //             )));
                },
                child: Text("I'm safe")),
          ],
        ),
      ),
    );
  }
}
