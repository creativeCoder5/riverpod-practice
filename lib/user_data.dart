import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart'; 

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}

@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class UserData {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
  final Support support;

  UserData({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
