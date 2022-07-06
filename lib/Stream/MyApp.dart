
import 'package:chat_application/Stream/channel_list_page.dart';
import 'package:chat_application/constaintapi.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatAppfirst extends StatefulWidget {
  ChatAppfirst({Key? key, required this.client, required this.channel}) : super(key: key);
  final StreamChatClient client;
  final Channel channel;

  @override
  State<ChatAppfirst> createState() => _ChatAppfirstState();
}
final themeData = ThemeData(primarySwatch: Colors.red);
final defaultTheme = StreamChatThemeData.fromTheme(themeData);
final customTheme = defaultTheme.merge(StreamChatThemeData(
      channelPreviewTheme: ChannelPreviewThemeData(
          avatarTheme: AvatarThemeData(
        borderRadius: BorderRadius.circular(8),
      )),
    ));

class _ChatAppfirstState extends State<ChatAppfirst> {
  void initState() {
    super.initState();
    initialize(); 
  }
  Future<void> initialize() async {
     final client = StreamChatClient(apiKey, logLevel: Level.INFO);
  await client.connectUser(User(id: "tutorial-flutter"), UserToken);
  final channel = client.channel("messaging", id: "flutterdevs");
  await channel.watch();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return StreamChat(
            child: child,
            client: widget.client,
            streamChatThemeData: customTheme,
          );
        },
        home: StreamChannel(
          channel: widget.channel,
          child: const ChannelListPage(),
        ),
      );
  }
}
