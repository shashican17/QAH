import 'package:flutter/material.dart';
import 'package:quick_action_against_harassment/AddDetails.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String phoneNumber; // Declare phoneNumber parameter
  final String otp;
  const VerifyOTPScreen(
      {super.key,
      required this.phoneNumber,
      required this.otp}); // Include phoneNumber in constructor

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.purple,
        elevation: 10,
        title: Text('Quick Action Against Harassment'),
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 50,
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 20,
                  child: TextField(
                    controller: pass, // Assign controller
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter OTP',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String enteredCode = pass.text;
                    if (enteredCode == widget.otp) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDetails(
                            phoneNumber: widget.phoneNumber,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter a valid OTP.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Verify'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple, // Set text color
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0)), // Add rounded corners
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
