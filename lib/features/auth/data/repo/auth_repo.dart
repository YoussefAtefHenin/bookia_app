import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/login",
        data: {"email": email, "password": password},
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print("Login error: ${e.response?.statusCode}");
      print("Login response: ${e.response?.data}");
      print("Login message: ${e.message}");
      return false;
    } catch (e) {
      print("Login unknown error: $e");
      return false;
    }
  }

  static Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/register",
        data: {
          "name": username,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print("Register error: ${e.response?.statusCode}");
      print("Register response: ${e.response?.data}");
      print("Register message: ${e.message}");
      return false;
    } catch (e) {
      print("Register unknown error: $e");
      return false;
    }
  }
}
