import 'package:vania/vania.dart';

class CreateUsersTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists("users", () {
      id();
      string("name", length: 16);
      string("email", length: 30);
      string("password", length: 300);
      dateTime("created_at", nullable: true);
      dateTime("updated_at", nullable: true);
      dateTime("deleted_at", nullable: true);
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists("users");
  }
}
