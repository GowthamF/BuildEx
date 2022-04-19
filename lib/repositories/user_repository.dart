import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class UserRepository {
  late UserService _userService;
  final HttpHelper httpHelper;

  UserRepository(this.httpHelper) {
    _userService = UserService(httpHelper);
  }

  Future<void> registerUser(UserModel userModel) {
    return _userService.registerUser(userModel);
  }

  Future<String?> loginUser(String userName, String password) {
    return _userService.loginUser(userName, password);
  }

  Future<void> logoutUser(UserModel userModel) {
    return _userService.logoutUser(userModel);
  }

  Future<UserModel?> getUser(String accessToken) {
    return _userService.getUser(accessToken);
  }
}
