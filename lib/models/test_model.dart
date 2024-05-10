class TestModel {
  final String message;
  final int score;
  final String description;

  TestModel(
      {required this.message, required this.score, required this.description});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
        message: json['message'],
        score: json['data']['score'],
        description: json['data']['description']);
  }
}
