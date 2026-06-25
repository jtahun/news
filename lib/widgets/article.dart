import 'package:flutter/material.dart';
import 'package:news/models/article_data.dart';
import 'package:news/screens/article_screen.dart';

class Article extends StatelessWidget {
  final ArticleData article;

  const Article({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(builder: (_) => ArticleScreen(id: article.id));
            Navigator.push(context, route);
          },
          child: const Text('Читать'),
        ),
      ],
    );
  }
}
