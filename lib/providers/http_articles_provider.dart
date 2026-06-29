import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/articles_provider.dart';

class HttpArticlesProvider implements ArticlesProvider {
  @override
  Future<ArticleData?> getArticleById(int id) async {
    final uri = Uri.https('dummyjson.com', 'posts/$id');
    final response = await http.get(uri);

    if (response.statusCode == 404) {
      return null;
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load article $id');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ArticleData.fromJson(json);
  }

  @override
  Future<List<ArticleData>> getArticles() async {
    final uri = Uri.https('dummyjson.com', 'posts');
    final response = await http.get(uri);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load articles');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final list = json['posts'] as List? ?? const [];

    return list
        .whereType<Map<String, dynamic>>()
        .map(ArticleData.fromJson)
        .toList();
  }

  @override
  Future<List<CommentData>> getComments(int articleId) async {
    final uri = Uri.https('dummyjson.com', 'comments/post/$articleId');
    final response = await http.get(uri);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load comments for article $articleId');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final list = json['comments'] as List? ?? const [];

    return list
        .whereType<Map<String, dynamic>>()
        .map(CommentData.fromJson)
        .toList();
  }
}