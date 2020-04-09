import 'package:clone_keep_flutter/app/app_controller.dart';
import 'package:clone_keep_flutter/app/app_widget.dart';
import 'package:clone_keep_flutter/app/pages/home/home_module.dart';
import 'package:clone_keep_flutter/app/pages/login/login_module.dart';
import 'package:clone_keep_flutter/app/pages/splash/splash_page.dart';
import 'package:clone_keep_flutter/app/shared/auth/auth_controller.dart';
import 'package:clone_keep_flutter/app/shared/auth/repositories/auth_repository.dart';
import 'package:clone_keep_flutter/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/',child: (_, args) => SplashPage()),
        Router('/login', module: LoginModule(), transition: TransitionType.noTransition),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
