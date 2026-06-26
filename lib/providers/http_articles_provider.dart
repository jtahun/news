import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/articles_provider.dart';
import 'package:http/http.dart' as http;

class HttpArticlesProvider implements ArticlesProvider{
  @override
  Future<ArticleData?> getArticleById(int id) {
    // TODO: implement getArticleById
    throw UnimplementedError();
  }

  @override
  Future<List<ArticleData>> getArticles() async {
    //final uri = Uri.parse('https://dummyjson.com/posts');
    final uri = Uri.https('dummyjson.com','posts');
    http.get(uri);
    final response = await http.get(uri);
    print(response.body);
    return [];
    
  }

  @override
  Future<List<CommentData>> getComments(int articleId) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

}