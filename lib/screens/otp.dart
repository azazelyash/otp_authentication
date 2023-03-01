import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_and_live_location/screens/homepage.dart';
import 'package:otp_and_live_location/screens/password.dart';

class MyOTP extends StatefulWidget {
  static String id = 'myOtp';

  const MyOTP({super.key});

  @override
  State<MyOTP> createState() => _MyOTPState();
}

class _MyOTPState extends State<MyOTP> {
  String phoneNumber = "+91 9453271141";
  String code = "";
  bool _isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

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
                        "assets/otp_screen.png",
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
                        height: 8,
                      ),
                      Text(
                        "Enter the OTP sent to $phoneNumber",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      /* ------------------------------ OTP TextField ----------------------------- */

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: OtpTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          numberOfFields: 6,
                          fieldWidth: 44,
                          margin: const EdgeInsets.all(0),
                          borderColor: const Color(0xFF512DA8),
                          enabledBorderColor: Colors.transparent,
                          filled: true,
                          fillColor: Color.fromARGB(255, 236, 236, 236),
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            code = verificationCode;
                          }, // end onSubmit
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      /* ---------------------------- Resend OTP Button --------------------------- */

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: MyPassword.phoneNumber,
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    MyPassword.verify = verificationId;
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                              },
                              child: Text(
                                "Did not recieve OTP? Resend.",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 79, 4, 150),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                  verificationId: MyPassword.verify,
                                  smsCode: code,
                                );

                                // Sign the user in (or link) with the credential
                                await auth.signInWithCredential(credential);

                                setState(() {
                                  _isLoading = false;
                                });

                                Navigator.pushReplacementNamed(
                                    context, HomePage.id);
                              } catch (e) {
                                print("Error Detected");
                              }
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
                                "Verify",
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
