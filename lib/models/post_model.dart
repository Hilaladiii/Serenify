class DataPost {
  final List<PostModel> dataPost;
  DataPost({required this.dataPost});

  factory DataPost.fromJson(Map<String, dynamic> json) => DataPost(
      dataPost:
          List.from(json['data'].map((post) => PostModel.fromJson(post))));
}

class PostModel {
  final String id;
  final String userId;
  final String username;
  final String userPhoto;
  final String content;
  final String photoContent;
  final int totalLikes;
  final int totalComments;

  PostModel(
      {required this.id,
      required this.userId,
      required this.username,
      required this.userPhoto,
      required this.content,
      required this.photoContent,
      required this.totalLikes,
      required this.totalComments});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        userId: json['user_id'],
        username: json['user_name'],
        userPhoto: json['user_photo'],
        content: json['content'],
        photoContent: json['photo_link'],
        totalLikes: json['total_likes'],
        totalComments: json['total_comments']);
  }
}

class DetailPostModel {
  final String id;
  final String userId;
  final String username;
  final String userPhoto;
  final String content;
  final String photoContent;
  final int totalLikes;
  final int totalComments;
  final List<dynamic>? comments;

  DetailPostModel(
      {required this.id,
      required this.userId,
      required this.username,
      required this.userPhoto,
      required this.content,
      required this.photoContent,
      required this.totalLikes,
      required this.totalComments,
      required this.comments});

  factory DetailPostModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return DetailPostModel(
        id: data['id'],
        userId: data['user_id'],
        username: data['user_name'],
        userPhoto: data['user_photo'],
        content: data['content'],
        photoContent: data['photo_link'],
        totalLikes: data['total_likes'],
        totalComments: data['total_comments'],
        comments: data['comments']);
  }
}
