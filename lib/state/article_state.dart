import 'package:flutter/material.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/faker_articles_provider.dart';

class ArticleNotifier extends ChangeNotifier {
  final _articlesProvider = FakerArticlesProvider();

  ArticleData? article;
  List<CommentData> comments = [];

  void load(int id) async {
    article = await _articlesProvider.getArticleById(id);
    comments = await _articlesProvider.getComments(id);
    notifyListeners();
  }
}

class ArticleState extends InheritedNotifier<ArticleNotifier> {
  const ArticleState({
    super.key,
    required super.child,
    required super.notifier,
  });

  static ArticleNotifier of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ArticleState>();

    if (result == null) {
      throw Exception('ArticleState not found');
    }

    return result.notifier!;
  }
}
