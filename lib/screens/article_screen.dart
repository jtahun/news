import 'package:flutter/material.dart';
import 'package:news/models/article_data.dart';
import 'package:news/state/article_state.dart';
import 'package:news/widgets/comment.dart';

class ArticleScreen extends StatefulWidget {
  final int id;

  const ArticleScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final _articleNotifier = ArticleNotifier();

  @override
  void initState() {
    _articleNotifier.load(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ArticleState(
      notifier: _articleNotifier,
      child: Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          final state = ArticleState.of(context);

          if (state.article == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                state.article!.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                state.article!.text,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Text(
                'Комментарии',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Comment(data: state.comments[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: state.comments.length,
                shrinkWrap: true,
              ),
            ],
          );
        }),
      ),
    );
  }
}
