import 'package:chat_application/screens/AuthScreen/login_page.dart';
import 'package:flutter/material.dart';

class PreLogin extends StatefulWidget {
  const PreLogin({Key? key}) : super(key: key);

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Continue'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AuthScreen()));
          },
        ),
      ),
    );
  }
}
