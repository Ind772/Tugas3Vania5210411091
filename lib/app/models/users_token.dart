import 'package:vania/vania.dart';

class UsersToken extends Model {
  int? id;
  String? name;
  int? tokenableId;
  String? token;
  DateTime? lastUsedAt;
  DateTime? createdAt;
  DateTime? deletedAt;

  UsersToken() {
    super.table("personal_access_tokens");
  }

  UsersToken.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    tokenableId = map["tokenable_id"];
    token = map["token"];
    lastUsedAt = map["last_used_at"] != null
        ? DateTime.parse(map["last_used_at"])
        : null;
    createdAt =
        map["created_at"] != null ? DateTime.parse(map["created_at"]) : null;
    deletedAt =
        map['deleted_at'] != null ? DateTime.parse(map['deleted_at']) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "tokenable_id": tokenableId,
      "token": token,
      "last_used_at": lastUsedAt?.toString(),
      "created_at": createdAt?.toString(),
      "deleted_at": deletedAt?.toString(),
    };
  }
}
