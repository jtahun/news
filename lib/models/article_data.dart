import 'package:json_annotation/json_annotation.dart';

part 'article_data.g.dart';


@JsonSerializable()
class ArticleData {
  final int id;
  final String title;
  final String text;

  const ArticleData({
    required this.id,
    required this.title,
    required this.text,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json){
    return ArticleData(
      id:json['id'] as int,
      title:json['title'] as String? ?? '',
      text: json['body'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'title':title,
      'body':text,
    };
  }
}
