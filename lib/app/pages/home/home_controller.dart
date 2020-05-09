import 'package:clone_keep_flutter/app/shared/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AuthController auth = Modular.get();
  @observable
  int value = 0;

  FirebaseUser userInfo;

  logoff() async {
   await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/login');
  }

  getUser() async{
    await auth.currentUser().then((user) => {
      this.userInfo = user
    });
  }
}
