import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:news/app.dart';
import 'package:news/providers/articles_provider.dart';
import 'package:news/providers/dio_articles_provider.dart';
//import 'package:news/providers/faker_articles_provider.dart';
//import 'package:news/providers/http_articles_provider.dart';



void main() {
  GetIt.instance.registerSingleton<ArticlesProvider>(DioArticlesProvider());
  runApp(const App());
}

