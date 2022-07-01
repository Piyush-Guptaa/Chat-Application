import 'package:chat_application/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Home'),
     ),
     body: Center(
       child: ElevatedButton(
         child: Text('Logout'),
         onPressed: () {
           context.read<AuthProvider>().logout();
         },
       ),
       
     ),
   ); 
  }
}