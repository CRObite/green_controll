
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  String token;
  int userId;
  String? firstname;
  String? lastname;
  String? email;



  User(this.userId, this.firstname, this.lastname, this.email, this.token);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}