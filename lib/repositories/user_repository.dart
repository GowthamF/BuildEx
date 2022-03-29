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

  Future<void> loginUser(UserModel userModel) {
    return _userService.loginUser(userModel);
  }

  Future<void> logoutUser(UserModel userModel) {
    return _userService.logoutUser(userModel);
  }
}
