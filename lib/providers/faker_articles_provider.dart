import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/articles_provider.dart';

class FakerArticlesProvider implements ArticlesProvider {
  final _faker = Faker.instance;
  List<ArticleData> _articles = [];
  List<List<CommentData>> _comments = [];

  FakerArticlesProvider() {
    _faker.setLocale(FakerLocaleType.ru);

    _articles = List.generate(
      50,
      (index) => ArticleData(
        id: index,
        title: _faker.lorem.sentence(),
        text: _faker.lorem.paragraph(sentenceCount: Random().nextInt(10) + 10),
      ),
    );

    _comments = List.generate(
      50,
      (index) => List.generate(
        Random().nextInt(20),
        (index) => CommentData(
          text: _faker.lorem.sentence(wordCount: 20),
          author: _faker.name.fullName(),
        ),
      ),
    );
  }

  @override
  Future<List<ArticleData>> getArticles() async {
    return _articles;
  }

  @override
  Future<ArticleData?> getArticleById(int id) async {
    return _articles[id];
  }

  @override
  Future<List<CommentData>> getComments(int articleId) async {
    return _comments[articleId];
  }
}
