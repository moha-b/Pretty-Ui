import 'package:chef/core/resources/dimns.dart';
import 'package:chef/features/detail/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatSection extends StatelessWidget {
  const ChatSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatList.length,
      padding: const EdgeInsets.all(AppDimns.medium),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) => ChatCard(chat: chatList[index]),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimns.medium),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chat,
  });
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Wrap(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: chat.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      TextSpan(
                          text: "\t ${chat.comment}",
                          style: TextStyle(color: Colors.grey.shade700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(chat.time)
      ],
    );
  }
}
