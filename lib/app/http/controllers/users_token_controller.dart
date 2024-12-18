import 'package:vania/vania.dart';

class UsersTokenController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Test'});
  }
}

final UsersTokenController usersTokenController = UsersTokenController();
