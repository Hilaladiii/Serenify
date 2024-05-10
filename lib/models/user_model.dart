class UserModel {
  final String name;
  final String email;
  final String birthData;
  final String photoLink;

  UserModel(
      {required this.name,
      required this.email,
      required this.birthData,
      required this.photoLink});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return UserModel(
        name: data['name'],
        email: data['email'],
        birthData: data['birth_date'],
        photoLink: data['photo_link']);
  }
}

class UserScoreModel {
  final int score;
  final String description;

  UserScoreModel({required this.score, required this.description});

  factory UserScoreModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return UserScoreModel(
        score: data['score'], description: data['description']);
  }
}
