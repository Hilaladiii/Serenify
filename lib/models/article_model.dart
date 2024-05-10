class ArticleData {
  final List<ArticleModel> articleData;
  ArticleData({required this.articleData});
  factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
      articleData: List.from(
          json['data'].map((article) => ArticleModel.fromJson(article))));
}

class ArticleModel {
  final String id;
  final String title;
  final String content;
  final String photoLink;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.photoLink});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        photoLink: json['photo_link']);
  }
}
