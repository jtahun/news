import 'dart:convert';

import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/articles_provider.dart';
import 'package:http/http.dart' as http;

class HttpArticlesProvider implements ArticlesProvider{
  @override
  Future<ArticleData?> getArticleById(int id) async {
    final uri = Uri.https('dummyjson.com','posts/$id');
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return ArticleData.fromJson(json);
  }

  @override
  Future<List<ArticleData>> getArticles() async {
    //final uri = Uri.parse('https://dummyjson.com/posts');
    final uri = Uri.https('dummyjson.com','posts');  
    final response = await http.get(uri);
    
    final json = jsonDecode(response.body);
    final list = json['posts'] as List;
    
    return list.map((postJson) => ArticleData.fromJson(postJson)).toList();
  }

  @override
  Future<List<CommentData>> getComments(int articleId) async{
    // TODO: implement getComments
    //throw UnimplementedError();
    return [];
  }

}