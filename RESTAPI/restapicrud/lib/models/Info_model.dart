// ignore_for_file: public_member_api_docs, sort_constructors_first
/**class Photos {
  List<Photo>? photos;
  Photos({
    this.photos,
  });
  factory Photos.fromJson(List<dynamic> json) {
    List<Photo> photos = json.map((e) => Photo.fromJson(e)).toList();

    return Photos(photos: photos);
  }
}
 */
class Users {
  List<User>? users;
  Users({
    this.users,
  });
  factory Users.fromJson(List<dynamic> Json) {
    print('json$Json');
    List<User> Userslist = Json.map((e) => User.fromJson(e)).toList();
    return Users(users: Userslist);
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
  // Map<String, dynamic> toJson() => {
  //       'id': this.id,
  //       'name': this.name,
  //       'email': this.email,
  //       'password': this.password,
  //       'phoneNo': this.phoneNo
  //     };
}
