
import 'package:chat_application/global_vars.dart';
import 'package:chat_application/providers/auth.dart';
import 'package:chat_application/screens/AuthScreen/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

//LOGIN PAGE
class _AuthScreenState extends State<AuthScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final _textController = TextEditingController();
  Color bcolor = Color.fromRGBO(211, 212, 227, 1);
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile Number can\'t be empty';
    } else if (value.length < 10) {
      return 'Mobile Number should contain 10 digits.';
    } else if (value.length > 10) {
      return 'Mobile Number can\'t contain more than 10 digits.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(44),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'शीर्षक',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 101, 175, 1),
                        fontSize: 22,
                        fontFamily: 'Mukta'),
                  ),
                  Text(
                    'खाता बनाने के लिए अपना विवरण दे',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 101, 175, 1),
                        fontSize: 13,
                        fontFamily: 'Mukta'),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(82, 211, 255, 1),
                // image: DecorationImage(
                //   scale: 1,
                //   image: AssetImage('assets/images/study1.png'),
                //   alignment: Alignment.bottomCenter,
                // ),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            const Text(
              'फ्री रजिस्ट्रेशन ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(6, 7, 87, 1),
                  fontSize: 22,
                  fontFamily: 'Mukta'),
            ),
            const Text(
              'खाता बनाने के लिए अपना विवरण दे',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(6, 7, 87, 1),
                  fontSize: 13,
                  fontFamily: 'Mukta'),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 296,
                    child: TextFormField(
                      style: (const TextStyle(color: Colors.black)),
                      validator: phoneValidator,
                      controller: mobileController,
                      onChanged: (status) {
                        setState(() {
                          bcolor = primary1;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Enter Phone Number',
                        errorText: null,
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 296,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: bcolor, //background color of button
                          //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.all(
                              20) //content padding inside button
                          ),
                      onPressed: () {
                        var status = _formKey.currentState?.validate();
                        if (status != null && status) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(
                                mobileController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("ओ टी पी जनरेट करें"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // SizedBox(
            //   height: 65, //height of button
            //   width: 296, //width of button
            //   child: ElevatedButton.icon(
            //     style: ElevatedButton.styleFrom(
            //         primary: secondary4, //background color of button
            //         //border width and color
            //         elevation: 3, //elevation of button
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30),
            //         ),
            //         padding: const EdgeInsets.all(20)),
            //     onPressed: () {
            //       context.read<AuthProvider>().signInWithGoogle(context);
            //     },
            //     icon: Image.asset('assets/images/google.png'),
            //     label: const Text(
            //       "गूगल के साथ जारी करें ",
            //       style: TextStyle(
            //         fontWeight: FontWeight.w700,
            //         color: Color.fromRGBO(6, 7, 87, 1),
            //         fontSize: 16,
            //         fontFamily: 'Mukta',
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            TextButton(
              child: const Text("लॉगिन के बिना प्रवेश "),
              onPressed: () => context.read<AuthProvider>().guestLogin(),
            ),
          ]),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Form(
  //             key: _formKey,
  //             child: Column(
  //               children: [
  // TextFormField(
  //   style: const TextStyle(color: Colors.black),
  //   validator: phoneValidator,
  //   controller: mobileController,
  //   decoration: const InputDecoration(
  //     enabledBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: Colors.black),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: Colors.black),
  //     ),
  //     border: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.black)),
  //     hintText: "Enter Phone Number",
  //     hintStyle: TextStyle(
  //       color: Colors.black,
  //     ),
  //     labelText: "Phone Number",
  //     labelStyle: TextStyle(color: Colors.black),
  //   ),
  //   // decoration: const InputDecoration(
  //   //   labelText: 'Enter Phone Number',
  //   //   errorText: null,
  //   // ),
  //   keyboardType: TextInputType.phone,
  // ),
  // ElevatedButton.icon(
  // onPressed: () {
  //   var status = _formKey.currentState?.validate();
  //   if (status != null && status) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               OtpScreen(mobileController.text)),
  //     );
  //   }
  //   },
  //   label: const Text('Get OTP'),
  //   icon: const Icon(Icons.message_rounded),
  // ),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(height: 50),
  //           ElevatedButton.icon(
  //             icon: const Icon(Icons.email),
  //             onPressed: () => context.read<AuthProvider>().signInWithGoogle(),
  //             label: const Text('Sign in with Google'),
  //             // child: const Text('Login with Google'),
  //           ),
  //           const SizedBox(height: 30),
  //           ElevatedButton.icon(
  //             onPressed: () =>
  //                 context.read<AuthProvider>().signInWithFacebook(),
  //             label: const Text('Login with Facebook'),
  //             icon: const Icon(Icons.facebook),
  //           ),
  //           const SizedBox(height: 30),
  //           ElevatedButton.icon(
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => const MailLogin()),
  //               );
  //             },
  //             label: const Text('Login with Mail'),
  //             icon: const Icon(Icons.mail),
  //           ),
  //           const SizedBox(height: 30),
  //           ElevatedButton.icon(
  //             onPressed: () => context.read<AuthProvider>().guestLogin(),
  //             label: const Text('Guest Login'),
  //             icon: const Icon(Icons.person),
  //             style: ElevatedButton.styleFrom(
  //               primary: Colors.green,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
  //               splashFactory: InkRipple.splashFactory,
  //               animationDuration: const Duration(milliseconds: 500),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
