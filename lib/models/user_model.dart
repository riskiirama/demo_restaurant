class UserModel {
  int id;
  String name;
  String email;
  String avatar;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'token': token,
    };
  }
}
