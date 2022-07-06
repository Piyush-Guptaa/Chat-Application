import 'dart:async';
import 'package:chat_application/global_vars.dart';
import 'package:chat_application/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/src/provider.dart';
import 'package:lottie/lottie.dart';
// import 'package:flutter_otp_timer/flutter_otp_timer.dart';

class OtpScreen extends StatefulWidget {
  String phoneNumber;

  OtpScreen(this.phoneNumber, {Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Color bcolor = const Color.fromRGBO(211, 212, 227, 1);
  String otpCode = '';
  late bool code;
  @override
  void initState() {
    // print("initial state called");
    startTimer();
    secondsRemaining = 30;
    enableResend = false;
    super.initState();
    // context.read<AuthProvider>().generateOtp(widget.phoneNumber);
    _controller = AnimationController(vsync: this);
  }

  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // print(timer);
      if (secondsRemaining != 0) {
        setState(() => secondsRemaining = secondsRemaining - 1);
      } else {
        setState(() {
          enableResend = true;
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _controller.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       body: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             ListTile(
  //               title: const Text(
  //                 'भोलू',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w800,
  //                     fontSize: 44,
  //                     fontFamily: 'Sen'),
  //               ),
  //               leading: CircleAvatar(
  //                 radius: 40,
  //                 child: ClipOval(
  //                   child: Image.asset(
  //                     'assets/icons/appicon.png',
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 backgroundColor: Colors.transparent,
  //               ),
  //             ),
  //             const Spacer(),
  //             RichText(
  //               textAlign: TextAlign.center,
  //               text: TextSpan(
  //                 children: <TextSpan>[
  //                   TextSpan(
  //                     text: 'Enter OTP',
  //                     style: Theme.of(context).textTheme.headline6,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 16,
  //             ),
  // OTPTextField(
  //   length: 6,
  //   width: MediaQuery.of(context).size.width,
  //   fieldWidth: 35,
  //   style: const TextStyle(fontSize: 17),
  //   textFieldAlignment: MainAxisAlignment.spaceAround,
  //   onCompleted: (otp) =>
  //       context.read<AuthProvider>().verifyOtp(otp, context),
  // ),
  //             const SizedBox(height: 32),
  //             const Spacer(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(40),
                child: Lottie.asset(
                  'assets/animation/otpvd.json',
                  fit: BoxFit.fill,
                ),
              ),

              const Text(
                'ENTER YOUR 6 DIGIT VERIFICATION CODE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 70, 104),
                ),
              ),
              Text(
                "+91 ${widget.phoneNumber}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 70, 104),
                ),
              ),
              const SizedBox(height: 24),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 20),
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 20,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                onCompleted: (otp) {
                  print(otp);
                  setState(() {
                    bcolor = primary1;
                    otpCode = otp;
                  });
                  code = true;
                  context.read<AuthProvider>().verifyOtp(otp, context);
                  // context.read<AuthProvider>().loginWithoutLogin(
                  //       widget.phoneNumber,
                  //       context,
                  //     );
                },
              ),
              // ElevatedButton(
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(),
              //   onPressed: () {
              //     // Navigator.pushNamed();
              //   },
              // ),
              //width of button
              const SizedBox(height: 25),
              Container(
                height: 50.0,
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: (otpCode != null)
                      ? () {
                          context
                              .read<AuthProvider>()
                              .verifyOtp(otpCode, context);
                        }
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "CONTINUE",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 52, //height of button
              //   width: 296, //width of button
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         primary: bcolor, //background color of button
              //         //border width and color
              //         elevation: 3, //elevation of button
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30),
              //         ),
              //         padding: const EdgeInsets.all(20)),
              //     onFocusChange: (code) {
              //       ElevatedButton.styleFrom(
              //         primary: const Color.fromRGBO(121, 0, 135, 1),
              //       );
              //     },
              //     onPressed: (otpCode != null)
              //         ? () {
              //             context
              //                 .read<AuthProvider>()
              //                 .verifyOtp(otpCode, context);
              //           }
              //         : null,
              //     child: const Text(
              //       " CONTINUE",
              //       style: TextStyle(
              //         fontSize: 8,
              //         fontWeight: FontWeight.bold,
              //         color: Color.fromARGB(255, 10, 70, 104),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              TextButton(
                child: Text(
                  "RESEND CODE " + secondsRemaining.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 70, 104),
                  ),
                ),
                onPressed: enableResend ? () => initState() : null,
              ),
              const SizedBox(height: 30),
              const Text(
                "BY CLICKING CONTINUE, YOU ARE AGREEING TO THE TERMS AND CONDITIONS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 70, 104),
                ),
              )

              // OtpTimer(
              //   duration: 60, // time till which the timer should animate
              //   radius: 10, // size of the circle
              //   timeTextSize: 16, // time text inside the circle
              // ),

              // Container(
              //   child: PinPut(
              //     fieldsCount: 4,
              //     eachFieldHeight: 50.0,
              //     withCursor: true,
              //     // controller: _pinPutController,
              //     submittedFieldDecoration: BoxDecoration(
              //       border: Border.all(color: Colors.black),
              //       borderRadius: BorderRadius.circular(15.0),
              //     ).copyWith(
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //     selectedFieldDecoration: BoxDecoration(
              //       color: Colors.green,
              //       border: Border.all(color: Colors.black),
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     followingFieldDecoration: BoxDecoration(
              //       border: Border.all(color: Colors.black),
              //       borderRadius: BorderRadius.circular(15.0),
              //     ).copyWith(
              //       borderRadius: BorderRadius.circular(5.0),
              //       border: Border.all(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // )
              // child: TextField(
              //   keyboardType: TextInputType.number,
              //   maxLength: 6,
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w700,
              //   ),
              //   decoration: InputDecoration(
              //     counterText: '',
              //     counterStyle: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.w700,
              //     ),
              //     contentPadding: const EdgeInsets.all(0),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Color.fromRGBO(6, 7, 87, 1),
              //         width: 2,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Color.fromRGBO(6, 7, 87, 1),
              //         width: 2,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Color.fromRGBO(6, 7, 87, 1),
              //         width: 2,
              //       ),
              //     ),
              //   ),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
