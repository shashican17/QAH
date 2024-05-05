import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quick_action_against_harassment/VerifyOTPScreen.dart';
import 'package:telephony/telephony.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();
  late String phoneNumber;
  int randomNumber = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void generateRandomNumber() {
    setState(() {
      randomNumber = Random().nextInt(900000) +
          100000; // Generates a random 6-digit number
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.purple,
        elevation: 10,
        title: Text(widget.title),
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
                      controller: phoneController,
                      maxLength: 10,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
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
                    onPressed: () {
                      generateRandomNumber();
                      print(randomNumber);
                      phoneNumber = phoneController.text;
                      if (phoneNumber.length != 10) {
                        // Show Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Please enter a valid phone number.'),
                          ),
                        );
                      } else {
                        phoneNumber = "+91${phoneController.text}";
                        Telephony telephony = Telephony.instance;
                        telephony.sendSms(
                          to: phoneNumber,
                          message: "Your OTP for Login on QAH is $randomNumber",
                        );
                        print('otp sent it is $randomNumber');
                        // Navigate to VerifyOTPScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyOTPScreen(
                                phoneNumber: phoneNumber,
                                otp: randomNumber.toString()),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
