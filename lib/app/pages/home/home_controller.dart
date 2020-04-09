import 'package:clone_keep_flutter/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  logoff() async {
   await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
