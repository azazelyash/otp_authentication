import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_and_live_location/screens/password.dart';

class MyPhone extends StatefulWidget {
  static String id = 'myPhoneNumber';

  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => MyPhoneState();
}

class MyPhoneState extends State<MyPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /* ---------------------------------- Image --------------------------------- */
                const Spacer(),
                Image.asset(
                  "assets/welcome_screen.png",
                  width: 300,
                ),
                const Spacer(),

                /* ---------------------------------- Text ---------------------------------- */

                Text(
                  "WELCOME",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "This app was created by Yash Vishwakarma, to demonstrate to use of Firebase to login using mobile OTP",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),

                /* ---------------------------- Button Decoration --------------------------- */

                SizedBox(
                  width: 220,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(118, 158, 158, 158),
                          offset: Offset(0, 2.0), //(x,y)
                          blurRadius: 12.0,
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF693DEA),
                          Color(0xFF8A65E9),
                        ],
                      ),
                    ),

                    /* --------------------------------- button --------------------------------- */

                    child: FloatingActionButton(
                      /* ----------------------------- Button Function ---------------------------- */

                      onPressed: () {
                        Navigator.pushNamed(context, MyPassword.id);
                      },

                      /* ------------------------------ Button Design ----------------------------- */

                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8,
                        ),

                        /* ------------------------------- Button Text ------------------------------ */

                        child: Text(
                          "Let's get started",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
