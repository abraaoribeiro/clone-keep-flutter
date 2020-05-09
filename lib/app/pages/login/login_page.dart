import 'package:clone_keep_flutter/app/shared/auth/auth_controller.dart';
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
    var loginWithGoogle = controller.loginWithGoogle;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  AuthController authController = new AuthController();
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FlatButton(
              onPressed: () => {
                  widget.authController.loginWithGoogle(),
                if (_formKey.currentState.validate())
                  {
                    Scaffold.of((context)).showSnackBar(
                      SnackBar(
                        content: Text("Login Sucess."),
                      ),
                    )
                  }
              },
              child: Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
