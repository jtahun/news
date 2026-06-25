import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';

abstract class ArticlesProvider {
  Future<List<ArticleData>> getArticles();
  Future<ArticleData?> getArticleById(int id);
  Future<List<CommentData>> getComments(int articleId);
}