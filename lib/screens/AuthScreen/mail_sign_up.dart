
import 'package:chat_application/screens/AuthScreen/mail_login.dart';
import 'package:chat_application/screens/homepage.dart';
import 'package:chat_application/utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class MailSignUp extends StatefulWidget {
  const MailSignUp({Key? key}) : super(key: key);

  @override
  _MailSignUpState createState() => _MailSignUpState();
}

class _MailSignUpState extends State<MailSignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Please Enter a valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        // RegExp regExp = RegExp(r'^/{8,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (value.length < 10) {
          return ("Password must be 10 charcters long");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmPasswordController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        // RegExp regExp = RegExp(r'^/{8,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (value != passwordController.text) {
          return ("Password does not match!");
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => signUp(emailController.text, passwordController.text),
        child: const Text("SignUp"),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                emailField,
                const SizedBox(height: 30),
                passwordField,
                const SizedBox(height: 30),
                confirmPasswordField,
                const SizedBox(height: 30),
                signUpButton,
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    // String username = email;
    // username = username.replaceAll("@", "_").replaceAll(".", "_");
    // if (_formKey.currentState!.validate()) {
    //   Map? awsUser = await createUser({
    //     "email": email,
    //     "username": username,
    //     "password": password,
    //   });
    //   if (awsUser == null) {
    //     showSnackBar(context, "Failed at create User", false);
    //   } else if (awsUser.isEmpty) {
    //     showSnackBar(context, "User Already exists!", true);
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => MailLogin()));
    //   } else {
    //     // final String? userToken = await generateUserToken(
    //     //   {"username": username, "password": password},
    //     // );
    //     // if (userToken != null) {
    //     //   await context
    //     //       .read<AuthProvider>()
    //     //       .setInfos(userToken, "name", email, "mobile", username);
    //     // }
    //     showSnackBar(context, "User created successfully!", true);
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => Home()));
    //   }
    // }
  }
}
