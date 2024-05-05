import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'AddFamily.dart';

class AddDetails extends StatefulWidget {
  final String phoneNumber;
  AddDetails({Key? key, required this.phoneNumber});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.purple,
        elevation: 10,
        title: const Text('Quick Action Against Harassment'),
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[200]!,
                  Colors.blue[800]!,
                ],
              ),
            ),
            child: const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Your Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 20,
                      child: TextField(
                        controller: _nameController,
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Full Name',
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
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 20,
                      child: TextField(
                        controller: _emailController,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
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
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 20,
                      child: TextField(
                        controller: _addressController,
                        obscureText: false,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter full address',
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
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text("Continue"),
                      onPressed: () async {
                        String name = _nameController.text;
                        String phoneNumber = widget.phoneNumber;
                        String email = _emailController.text;
                        String address = _addressController.text;
                        if (name.isEmpty || email.isEmpty || address.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text('Please enter name, email and address.'),
                            ),
                          );
                        } else {
                          final response = await Supabase.instance.client
                              .from('users')
                              .insert({
                            'name': name,
                            'phone_number': phoneNumber,
                            'email': email,
                            'address': address,
                          });

                          if (response != null && response.error != null) {
                            print(
                                'Error inserting data: ${response.error!.message}\n');
                          } else {
                            print('Data inserted successfully!\n');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddFamily(
                                  userPhoneNumber: phoneNumber,
                                  userName: name,
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
