import 'package:vania/vania.dart';

class User extends Model {
  int? id;
  String? name;
  String? email;
  String? password;

  User() {
    super.table("users");
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    password = map["password"];
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "email": email, "password": password};
  }
}
