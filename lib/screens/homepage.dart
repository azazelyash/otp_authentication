import 'package:flutter/material.dart';
import 'package:otp_and_live_location/widgets/side_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        backgroundColor: const Color(0xFF693DEA),
        centerTitle: true,
        title: const Text("Your Videos"),
      ),

      /* ------------------------------- Drawer Menu ------------------------------ */

      drawer: const SideDrawer(),

      /* ------------------------------ Body Content ------------------------------ */

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [],
          ),
        ),
      ),
    );
  }
}
