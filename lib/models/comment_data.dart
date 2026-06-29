class CommentData {
  final String text;
  final String author;

  CommentData({
    required this.text,
    required this.author,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) {
    final user = json['user'];

    String author = 'Unknown author';

    if (user is Map<String, dynamic>) {
      author = user['fullName'] as String? ??
          user['username'] as String? ??
          author;
    }

    return CommentData(
      text: json['body'] as String? ?? '',
      author: author,
    );
  }
}