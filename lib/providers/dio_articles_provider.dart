import 'package:news/models/article_data.dart';
import 'package:news/models/comment_data.dart';
import 'package:news/providers/articles_provider.dart';
import 'package:dio/dio.dart';

class DioArticlesProvider implements ArticlesProvider{
  late final Dio _dio;

  DiArticlesProvider(){
    _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'),);
  
    _dio.interceptors.add(LogInterceptor());
  }
  
  //final _dio = Dio();
  //final _dio = Dio(BaseOptions(baseUrl:'https://dummyjson.com'));
  @override
  Future<ArticleData?> getArticleById(int id) {
    // TODO: implement getArticleById
    throw UnimplementedError();
    final response = await _dio.get('https://dummyjson.com/posts/$id');
    try{
       ArticlesData.fromJson(response.data as Map<String,dynamic>);
    }catch(e){
      throw Exception('Failed to load article $id:$e');
    }
  }

  @override
  Future<List<ArticleData>> getArticles() async{
    final response = await _dio.get('https://dummyjson.com/posts');
    //final resposne = await dio.get('/posts');
    final list = response.data['posts'] as List;
    
    return list.map((postJson)=>ArticleData.fromJson(postJson)).toList();
  }

  @override
  Future<List<CommentData>> getComments(int articleId) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

}