import 'dart:io';

class UserModel {
  late final String? username;
  late final String name;
  late final String? photo;
  late final String dob;
  late final int height;
  late final int weight;
  late final List<String>? interests;
  String gender;
  String? zodiac;
  String? horoscope;
  File? image;
  int? age;

  UserModel(
      {required this.name,
      required this.dob,
      required this.height,
      required this.weight,
      required this.gender,
      this.username,
      this.interests,
      this.zodiac,
      this.horoscope,
      this.image,
      this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<String>? interests;
    if (json['interests'] != null) {
      interests = json['interests'].cast<String>();
    } else {
      interests = [];
    }

    return UserModel(
      username: json['username'],
      name: json['name'] ?? '',
      dob: json['birthday'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      interests: interests ?? [],
      gender: json['gender'] ?? '',
      horoscope: json['horoscope'] ?? '',
      zodiac: json['zodiac'] ?? '',
      image: json['image'],
      age: json['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'birthday': dob,
      'height': height,
      'weight': weight,
      'interests': interests,
      'gender': gender,
      'horoscope': horoscope,
      'zodiac': zodiac,
      'image': image,
      'age': age,
    };
  }
}
