import 'package:flutter/material.dart';
import 'package:news/models/comment_data.dart';

class Comment extends StatelessWidget {
  final CommentData data;

  const Comment({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.author,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(data.text),
      ],
    );
  }
}
