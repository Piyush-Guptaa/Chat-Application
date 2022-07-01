import 'package:flutter/material.dart';
import '../../global_vars.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: primary4,
          color: primary1,
        ),
      ),
    );
  }
}
