import 'package:flutter/material.dart';
import 'package:quick_action_against_harassment/UserHome.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddFamily extends StatefulWidget {
  const AddFamily(
      {super.key, required this.userPhoneNumber, required this.userName});
  final String userPhoneNumber;
  final String userName;

  @override
  State<AddFamily> createState() => _AddFamilyState();
}

class _AddFamilyState extends State<AddFamily> {
  final _nameController = TextEditingController();
  final _relationController = TextEditingController();
  final _phoneNumberController = TextEditingController();

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
      body: Stack(children: [
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Add a Relative",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.2,
                    fontWeight: FontWeight.bold),
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
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 20,
                  child: TextField(
                    controller: _relationController,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
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
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 20,
                  child: TextField(
                    controller: _phoneNumberController,
                    obscureText: false,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Mobile Number',
                        counterText: ''),
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
                    String relation = _relationController.text;
                    String familyPhoneNumber = _phoneNumberController.text;
                    print('point 1');
                    if (name.isEmpty ||
                        relation.isEmpty ||
                        familyPhoneNumber.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'Please enter name, relation and mobile number.'),
                        ),
                      );
                    } else {
                      try {
                        final response = await Supabase.instance.client
                            .from('relatives')
                            .insert({
                          'phone_number': familyPhoneNumber,
                          'name': name,
                          'relation': relation,
                          'user_phone_number': widget.userPhoneNumber,
                        });

                        if (response != null) {
                          print(
                              'Error inserting data: ${response.error!.message}\n');
                        } else {
                          print('Data inserted successfully!\n');

                          print('point 3');
                        }
                      } catch (e) {
                        print("error occured: $e");
                      }

                      print('point 2');

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserHome(
                                  userPhoneNumber: widget.userPhoneNumber,
                                  familyPhoneNumber: familyPhoneNumber,
                                  userName: widget.userName,
                                )),
                      );
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
      ]),
    );
  }
}
