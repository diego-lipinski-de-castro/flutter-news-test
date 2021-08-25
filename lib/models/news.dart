class News {
  News({
    this.id,
    required this.title,
    required this.content,
    required this.author,
  });

  int? id;
  final String title;
  final String content;
  final String author;

  factory News.fromMap(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "content": content,
        "author": author,
      };
}
