import 'dart:io';

import 'package:vania/vania.dart';
import 'package:tugas_vania_indra/app/models/users.dart';

class AuthController extends Controller {
  Future<Response> register(Request request) async {
    request.validate({
      'name': 'required',
      'email': 'required|email',
      'password': 'required|min_length:6|confirmed',
    }, {
      'name.required': 'Nama harus diisi',
      'email.required': 'Email harus diisi',
      'email.email': 'Email tidak valid',
      'password.required': 'Password harus diisi',
      'password.min_length': 'Password terdiri dari minimal 6 karakter',
      'password.confirmed': 'Konfirmasi password tidak sesuai',
    });

    final name = request.input('name');
    final email = request.input('email');
    var password = request.input('password');

    var user = await User().query().where('email', '=', email).first();
    if (user != null) {
      return Response.json({
        "message": "Email sudah terpakai",
      }, 409);
    }

    password = Hash().make(password);
    await User().query().insert({
      "name": name,
      "email": email,
      "password": password,
      "created_at": DateTime.now().toString()
    });

    return Response.json({"message": "User berhasil didaftarkan"}, 201);
  }

  Future<Response> login(Request request) async {
    request.validate({
      'email': 'required|email',
      'password': 'required',
    }, {
      'email.required': 'Email field tidak boleh kosong',
      'email.email': 'Email tidak valid',
      'password.required': 'Password field tidak boleh kosong',
    });

    final email = request.input('email');
    var password = request.input('password').toString();

    var user = await User().query().where('email', '=', email).first();
    if (user == null) {
      return Response.json({
        "message": "Tidak ada User yang terdaftar",
      }, 409);
    }

    if (!Hash().verify(password, user['password'])) {
      return Response.json({
        "message": "Kata sandi salah",
      }, 401);
    }

    final token = await Auth()
        .login(user)
        .createToken(expiresIn: Duration(days: 30), withRefreshToken: true);

    return Response.json({
      "message": "User berhasil login",
      "token": token,
    });
  }

  Future<Response> me() async {
    Map? user = Auth().user();
    if (user != null) {
      final email = user['email'];
      var userData = await User().query().where('email', '=', email).first();

      if (userData != null) {
        userData.remove('password');
        return Response.json({
          "message": "success",
          "data": {
            "name": userData['name'],
            "email": userData['email'],
          },
        }, HttpStatus.ok);
      }
    }
    return Response.json({
      "message": "Token tidak valid atau pengguna tidak ditemukan",
    }, HttpStatus.unauthorized);
  }
}

final AuthController authController = AuthController();
