import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class UserService {
  final HttpHelper httpHelper;

  UserService(this.httpHelper);

  Future<void> registerUser(UserModel userModel) async {
    var response = await httpHelper.post(
      Uri.parse('auth/register'),
      body: userModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> loginUser(UserModel userModel) async {
    var response = await httpHelper.get(
      Uri.parse('/auth/login'),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> logoutUser(UserModel userModel) async {
    var response = await httpHelper.post(
      Uri.parse('/auth/logout'),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
