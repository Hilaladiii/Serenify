class StatusModel {
  final dynamic data;
  final String message;

  StatusModel({required this.data, required this.message});

  factory StatusModel.fromJson(Map<String, dynamic> json, String? path) =>
      StatusModel(
          data: path != null ? json['data'][path] : json['data'],
          message: json['message']);
}
