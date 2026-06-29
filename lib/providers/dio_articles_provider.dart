import 'package:dio/dio.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/articles_provider.dart';

class DioArticlesProvider implements ArticlesProvider {
  late final Dio _dio;

  DioArticlesProvider() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://dummyjson.com'),
    );

    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<ArticleData?> getArticleById(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/posts/$id');
      final data = response.data;

      if (data == null) {
        return null;
      }

      return ArticleData.fromJson(data);
    } catch (error) {
      throw Exception('Failed to load article $id: $error');
    }
  }

  @override
  Future<List<ArticleData>> getArticles() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/posts');
      final list = response.data?['posts'] as List? ?? const [];

      return list
          .whereType<Map<String, dynamic>>()
          .map(ArticleData.fromJson)
          .toList();
    } catch (error) {
      throw Exception('Failed to load articles: $error');
    }
  }

  @override
  Future<List<CommentData>> getComments(int articleId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/comments/post/$articleId',
      );

      final list = response.data?['comments'] as List? ?? const [];

      return list
          .whereType<Map<String, dynamic>>()
          .map(CommentData.fromJson)
          .toList();
    } catch (error) {
      throw Exception('Failed to load comments for article $articleId: $error');
    }
  }
}