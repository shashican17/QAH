import 'package:flutter/material.dart';

import 'UserHome.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
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
            const Text(
              "Add a Relative",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22.2,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: const Card(
                shadowColor: Colors.grey,
                elevation: 20,
                child: TextField(
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Name',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: const Card(
                shadowColor: Colors.grey,
                elevation: 20,
                child: TextField(
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Relation',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                  print('Continue Button Clicked!');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => UserHome()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
