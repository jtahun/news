import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news/models/article_data.dart';
import 'package:news/providers/articles_provider.dart';

class ArticlesNotifier extends ChangeNotifier {
  final _articlesProvider = GetIt.instance.get<ArticlesProvider>();

  ArticlesNotifier() {
    loadArticles();
  }

  List<ArticleData> articles = const [];

  void loadArticles() async {
    articles = await _articlesProvider.getArticles();
    notifyListeners();
  }
}

class ArticlesState extends InheritedNotifier<ArticlesNotifier> {
  const ArticlesState({
    super.key,
    required super.child,
    required super.notifier,
  });

  static ArticlesNotifier of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ArticlesState>();

    if (result == null) {
      throw Exception('ArticlesState not found');
    }

    return result.notifier!;
  }
}
