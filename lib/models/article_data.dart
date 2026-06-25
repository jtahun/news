import 'package:news/models/comment_data.dart';

class ArticleData {
  final int id;
  final String title;
  final String text;

  const ArticleData({
    required this.id,
    required this.title,
    required this.text,
  });
}
