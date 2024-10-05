import 'package:ecommerce_app/domain/entities/LoginResponsEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  String? token;
  String? statusMsg;

  LoginResponseDto({
    super.message,
    super.user,
    this.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

}

class User extends UserLoginEntity {
  String? role;
  User({
    super.name,
    super.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}