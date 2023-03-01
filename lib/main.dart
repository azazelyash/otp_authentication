import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_and_live_location/screens/homepage.dart';
import 'package:otp_and_live_location/screens/otp.dart';
import 'package:otp_and_live_location/screens/password.dart';
import 'package:otp_and_live_location/screens/phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isSignedIn ? MyOTP.id : MyPhone.id,
      routes: {
        MyOTP.id: (context) => const MyOTP(),
        MyPhone.id: (context) => const MyPhone(),
        MyPassword.id: (context) => const MyPassword(),
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
