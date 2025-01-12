class UserModel {
  late final String name;
  late final String photo;
  late final String birthday;
  late final String height;
  late final String weight;
  late final List<String> interest;
  String? gender;
  String? zodiac;
  String? horoscope;

  UserModel({
    required this.name,
    required this.photo,
    required this.birthday,
    required this.height,
    required this.weight,
    required this.interest,
  });
}
