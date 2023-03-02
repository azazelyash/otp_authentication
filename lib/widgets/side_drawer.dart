import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          child: Column(
            children: <Widget>[
              /* ---------------------------------- Icon ---------------------------------- */

              const Icon(
                Icons.account_circle,
                size: 160,
                color: Colors.black38,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 20,
              ),

              /* -------------------------------- UserName -------------------------------- */

              Text(
                "Yash Vishwakarma",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF693DEA),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Made with ♥ by Yash Vishwakarma",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
