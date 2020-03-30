import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: FlatButton.icon(
            color: Colors.amber,
            onPressed: controller.loginWithGoogle,
            label: Text('Login with Google'),
            icon: Icon(Icons.account_circle)
          ),
        ),
      ),
    );
  }
}
