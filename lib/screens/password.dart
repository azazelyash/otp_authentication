import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_and_live_location/screens/otp.dart';
import 'package:otp_and_live_location/screens/phone.dart';

class MyPassword extends StatefulWidget {
  const MyPassword({super.key});

  static String id = 'myPassword';
  static String verify = "";
  static String phoneNumber = "";

  @override
  State<MyPassword> createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Scaffold(
            backgroundColor: Color.fromARGB(255, 248, 248, 248),
            body: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 79, 4, 150),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 248, 248),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /* ---------------------------------- Image --------------------------------- */
                      const Spacer(),
                      Image.asset(
                        "assets/password_screen.png",
                        width: 300,
                      ),
                      const Spacer(),

                      /* ---------------------------------- Text ---------------------------------- */

                      Text(
                        "OTP Verification",
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
                        "We will send you a One Time Password to this mobile number",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      /* --------------------------- Phone Number Field --------------------------- */

                      IntlPhoneField(
                        flagsButtonPadding: const EdgeInsets.only(left: 16),
                        disableLengthCheck: true,
                        showCountryFlag: false,
                        dropdownIconPosition: IconPosition.trailing,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          MyPassword.phoneNumber = phone.completeNumber;
                        },
                      ),
                      const Spacer(),

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

                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: MyPassword.phoneNumber,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {
                                  print("done");
                                },
                                verificationFailed: (FirebaseAuthException e) {
                                  print("error");
                                },
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  MyPassword.verify = verificationId;
                                  Navigator.pushNamed(context, MyOTP.id);
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
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
                                "Send OTP",
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
