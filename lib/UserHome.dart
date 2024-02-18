import 'package:flutter/material.dart';

import 'Confirmation.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
          children: <Widget>[
            Ink(
                decoration: ShapeDecoration(
                  color: Colors.red,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.all_inclusive,
                    color: Colors.white,
                  ),
                  iconSize: 150.0,
                  splashColor: Colors.redAccent,
                  padding: EdgeInsets.all(40.0),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Confirmation()));
                  },
                )),
            Padding(
              padding: EdgeInsets.all(25.0),
            ),
            Text(
              "Send Emergency Alert",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 22.2,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
