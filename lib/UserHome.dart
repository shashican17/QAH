import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:telephony/telephony.dart';
import 'package:uuid/uuid.dart';

class UserHome extends StatefulWidget {
  final String userName;
  final String userPhoneNumber;
  final String familyPhoneNumber;

  const UserHome({
    Key? key,
    required this.userPhoneNumber,
    required this.familyPhoneNumber,
    required this.userName,
  }) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> with WidgetsBindingObserver {
  Position? _position;
  bool _isMounted = false;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  final String supabaseUrl = 'https://zbezdqhhdyppyzoxkuau.supabase.co';
  final String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpiZXpkcWhoZHlwcHl6b3hrdWF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE1NTkzNTYsImV4cCI6MjAyNzEzNTM1Nn0.T6RLVw5DsfFqrrsxenIb6fGPlkDCljHg0caj81wNTbE';
  late SupabaseClient supabaseClient;
  int _insertedId = 0;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    WidgetsBinding.instance!.addObserver(this);
    initializeCamera();
    supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
  }

  @override
  void dispose() {
    _isMounted = false;
    _controller.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initializeControllerFuture = initializeCamera();
    } else if (state == AppLifecycleState.paused) {
      _controller.dispose();
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    } else {
      print("No cameras available");
    }
  }

  Future<void> _startRecording() async {
    try {
      await _initializeControllerFuture;

      await _controller.startVideoRecording();

      setState(() {
        _isRecording = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Recording started.'),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;
    try {
      XFile videoFile = await _controller.stopVideoRecording();

      setState(() {
        _isRecording = false;
      });

      String uniqueFilename =
          '${DateTime.now().millisecondsSinceEpoch}_${Uuid().v4()}.mp4';

      await supabaseClient.storage
          .from('qah_evidence')
          .upload(uniqueFilename, File(videoFile.path));

      String videoUrl =
          '$supabaseUrl/storage/v1/object/qah_evidence/$uniqueFilename';

      if (_insertedId != null) {
        await supabaseClient
            .from('qah_police')
            .update({'evidence': videoUrl}).eq('id', _insertedId);
        print('Evidence column updated successfully for ID: $_insertedId');
      } else {
        print('No ID retrieved from the inserted record.');
      }

      print('Video uploaded and record inserted successfully!');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Recording saved.'),
        ),
      );
    } catch (e) {
      print('Error in the process: $e');
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await _determinePosition();
    if (_isMounted) {
      setState(() {
        _position = position;
      });
    }
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permissions are denied");
      }
    }

    return await Geolocator.getCurrentPosition();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  color: Colors.red,
                  shape: const CircleBorder(),
                  child: IconButton(
                    icon: const Icon(
                      Icons.local_police_sharp,
                      color: Colors.white,
                    ),
                    iconSize: 150.0,
                    splashColor: Colors.purple,
                    padding: const EdgeInsets.all(40.0),
                    onPressed: () async {
                      if (!_isRecording) {
                        String familyPhoneNumber =
                            widget.familyPhoneNumber.toString();

                        print(
                            'the phone number is ${widget.userPhoneNumber}\n');
                        print('the position is\n');
                        await getCurrentLocation();
                        print(_position.toString());
                        print('did you see the position?\n');
                        String pos = _position.toString();
                        double? latitude = _position?.latitude;
                        double? longitude = _position?.longitude;

                        String googleMapsUrl =
                            'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                        print('Google Maps URL: $googleMapsUrl');

                        Telephony telephony = Telephony.instance;
                        telephony.sendSms(
                          to: familyPhoneNumber,
                          message:
                              "Please Help me out, I am in a situation of panic. My location is $googleMapsUrl",
                        );

                        print('location sent bro');

                        String name = widget.userName.toString();
                        String mobile = widget.userPhoneNumber.toString();

                        final response = await Supabase.instance.client
                            .from('qah_police')
                            .insert({
                          'name': name,
                          'mobile': mobile,
                          'latitude': latitude.toString(),
                          'longitude': longitude.toString()
                        }).select();

                        final List<Map<String, dynamic>> data =
                            response as List<Map<String, dynamic>>;

                        if (data.isNotEmpty) {
                          final record = data[0];
                          final id = record['id'];
                          _insertedId = id;
                          final name = record['name'];
                          final mobile = record['mobile'];

                          print('Latest record with mobile number $mobile:');
                          print('ID: $id, Name: $name, Mobile: $mobile');
                        } else {
                          print('No record found matching the criteria');
                        }
                        _startRecording();
                      } else {
                        _stopRecording();
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25.0),
                ),
                const Text(
                  "Send Emergency Alert",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.2,
                    fontWeight: FontWeight.bold,
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
