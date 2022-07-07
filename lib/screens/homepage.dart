import 'package:chat_application/Stream/data.dart';
import 'package:chat_application/constaintapi.dart';
import 'package:chat_application/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../Stream/stream.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final client = StreamChatClient(apiKey, logLevel: Level.INFO);
  late final channel= client.channel("messaging", id: "flutterdevs");
  Future<void> initialize() async {
    
    await client.connectUser(User(id: "tutorial-flutter"), UserToken);
    await channel.watch();

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Home'),
     ),
     body: ChatAppfirst(channel: channel, client: client),
    //  Center(
    //    child: ElevatedButton(
    //      child: Text('Logout'),
    //      onPressed: () {
    //        context.read<AuthProvider>().logout();
    //      },
    //    ),
       
    //  ),
   ); 
  }
}