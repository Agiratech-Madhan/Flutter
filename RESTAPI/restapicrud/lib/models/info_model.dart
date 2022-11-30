class Users {
  List<User>? users;
  Users({
    this.users,
  });
  factory Users.fromJson(List<dynamic> json) {
    List<User> userslist = json.map((e) => User.fromJson(e)).toList();
    return Users(users: userslist);
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phoneNo;
  User({this.id, this.name, this.email, this.password, this.phoneNo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        phoneNo: json['phoneNo']);
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'password': password, 'phoneNo': phoneNo};
}
