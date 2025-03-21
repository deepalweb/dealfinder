import 'package:get/get.dart';

class UserController extends GetxController {
  var isGuest = true.obs;
  var username = "Guest".obs;

  void login(String name) {
    isGuest.value = false;
    username.value = name;
  }

  void logout() {
    isGuest.value = true;
    username.value = "Guest";
  }
}