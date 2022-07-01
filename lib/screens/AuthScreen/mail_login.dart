import 'package:chat_application/screens/AuthScreen/mail_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class MailLogin extends StatefulWidget {
  const MailLogin({Key? key}) : super(key: key);

  @override
  _MailLoginState createState() => _MailLoginState();
}

class _MailLoginState extends State<MailLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  var username = "";

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
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      shadowColor: Colors.blueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => signIn(emailController.text, passwordController.text),
        child: Text("Login"),
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
                SizedBox(height: 30),
                passwordField,
                SizedBox(height: 30),
                loginButton,
                SizedBox(height: 30),
                Row(
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MailSignUp()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    String username = email;
    username = username.replaceAll("@", "_").replaceAll(".", "_");
    if (_formKey.currentState!.validate()) {
      // context
      //     .read<AuthProvider>()
      //     .login(emailController.text, username, passwordController.text);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
