
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  String token;
  int userId;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePicture;


  User(this.token, this.userId, this.firstName, this.lastName, this.email,
      this.profilePicture);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
