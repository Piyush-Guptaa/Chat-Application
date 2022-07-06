import 'package:chat_application/screens/AuthScreen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PreLogin extends StatefulWidget {
  const PreLogin({Key? key}) : super(key: key);

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(44),
              child: Lottie.asset(
                'assets/animation/chatvd.json',
                fit: BoxFit.fill,
              ),
              // decoration: const BoxDecoration(
              //   color: Color.fromRGBO(82, 211, 255, 1),
              //   // image: DecorationImage(
              //   //   scale: 1,
              //   //   image: AssetImage('assets/images/study1.png'),
              //   //   alignment: Alignment.bottomCenter,
              //   // ),
              // ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome to Chat Application',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 70, 104),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' "Stay connected with your friends and family" ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 70, 104),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                  );
                },
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
            // ElevatedButton(onPressed: onPressed, child: child)
          ]),
        ),
      ),
    );
  }
}
