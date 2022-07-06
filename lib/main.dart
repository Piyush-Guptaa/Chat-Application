import 'dart:html';

import 'package:chat_application/constaintapi.dart';
import 'package:chat_application/screens/prelogin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/Authscreen/login_page.dart';
import 'screens/homepage.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'screens/Authscreen/loading.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthProvider>().initAuth();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: theme(),
      home: context.watch<AuthProvider>().loading
          ? const Loading()
          : (context.watch<AuthProvider>().isLoggedin
              ? Home()
              : const PreLogin()),
    );
  }
}
