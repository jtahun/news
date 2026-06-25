import 'package:flutter/material.dart';
import 'package:news/state/articles_state.dart';
import 'package:news/widgets/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _articlesNotifier = ArticlesNotifier();

  @override
  Widget build(BuildContext context) {
    return ArticlesState(
      notifier: _articlesNotifier,
      child: Scaffold(
        appBar: AppBar(title: const Text('Все статьи')),
        body: Builder(
          builder: (context) {
            final state = ArticlesState.of(context);

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.articles.length,
              itemBuilder: (context, index) => Article(article: state.articles[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            );
          }
        ),
      ),
    );
  }
}
