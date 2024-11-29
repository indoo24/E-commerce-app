class LoginResponseEntity {
  String? message;
  UserLoginEntity? user;
  String? token;

  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
  });
}

class UserLoginEntity {
  String? name;
  String? email;

  UserLoginEntity({
    this.name,
    this.email,
  });
}
