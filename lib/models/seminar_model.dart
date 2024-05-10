class SeminarData {
  final List<SeminarModel> seminarData;
  SeminarData({required this.seminarData});

  factory SeminarData.fromJson(Map<String, dynamic> json) => SeminarData(
      seminarData: List.from(
          json['data'].map((seminar) => SeminarModel.fromJson(seminar))));
}

class SeminarModel {
  final String id;
  final String title;
  final String place;
  final String time;
  final int price;
  final String photoLink;

  SeminarModel(
      {required this.id,
      required this.title,
      required this.place,
      required this.time,
      required this.price,
      required this.photoLink});

  factory SeminarModel.fromJson(Map<String, dynamic> json) {
    return SeminarModel(
        id: json['id'],
        title: json['title'],
        place: json['place'],
        time: json['time'],
        price: json['price'],
        photoLink: json['photo_link']);
  }
}

class DetailSeminarModel {
  final String id;
  final String title;
  final String place;
  final String time;
  final int price;
  final String photoLink;
  final String description;

  DetailSeminarModel(
      {required this.id,
      required this.title,
      required this.place,
      required this.time,
      required this.price,
      required this.photoLink,
      required this.description});

  factory DetailSeminarModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return DetailSeminarModel(
        id: data['id'],
        title: data['title'],
        place: data['place'],
        time: data['time'],
        price: data['price'],
        photoLink: data['photo_link'],
        description: data['description']);
  }
}
