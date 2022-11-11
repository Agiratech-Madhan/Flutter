// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String? name;
  String? email;
  String? password;
  int? phoneNo;
  User({this.id, this.name, this.email, this.password, this.phoneNo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        phoneNo: json['phoneNo']);
  }
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'password': this.password,
        'phoneNo': this.phoneNo
      };
}
