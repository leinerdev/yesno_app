import 'package:flutter/material.dart';
import 'package:yes_no_app/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _ChatHeader(),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AppBar(
      leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/06/17/13/26/360_F_617132669_YptvM7fIuczaUbYYpMe3VTLimwZwzlWf.jpg'),
          )),
      iconTheme: const IconThemeData(color: Colors.black87),
      title: const Row(
        children: [
          Text('Mi amor'),
          SizedBox(width: 5),
          Icon(Icons.favorite, color: Colors.blue)
        ],
      ),
      actions: [
        Icon(
          Icons.video_call,
          size: 40,
          color: colors.primary,
        ),
        const SizedBox(width: 10),
        Icon(Icons.call, size: 40, color: colors.primary),
      ],
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const MyMessageBubble()
                    : const HerMessageBubble();
              },
              itemCount: 100,
            ),
          ),

          // Caja de texto de mensajes
          const MessageFieldBox()

        ]),
      ),
    );
  }
}
