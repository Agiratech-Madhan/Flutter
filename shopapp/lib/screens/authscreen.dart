// import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shopapp/model/http_exceptions.dart';

import '../providers/auth.dart';
import 'package:flutter/material.dart';

enum AuthMode { signUp, login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 6, 166, 177).withOpacity(0.5),
                  Color.fromARGB(255, 17, 117, 128).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'My Shop',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      // color: Theme.of(context).accentTextTheme..color,
                      fontSize: 40,
                      fontFamily: 'Anton',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  AuthCardState createState() => AuthCardState();
}

class AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('An error Occured'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: (() => Navigator.of(context).pop()),
                    child: Text('Okay'))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
            _authData['email'].toString(), _authData['password'].toString());
      } else {
        await Provider.of<Auth>(context, listen: false).signUp(
            _authData['email'].toString(), _authData['password'].toString());
      }
    } on OwnHttpException catch (error) {
      print('error message from own$error');
      var errorMessage = 'Authentication failed';
      // var errorMessage;
      if ((error.toString()).contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use. ';
      } else if ((error.toString()).contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if ((error.toString()).contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak. ';
      } else if ((error.toString()).contains('EMAIL_NOT_FOUND')) {
        errorMessage = ' Could not find a user with that email. ';
      } else if ((error.toString()).contains('INVALID_PASSWORD')) {
        errorMessage = ' Invalid password ';
      }
      _showDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate';
      _showDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.signUp ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.signUp ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'E-Mail',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value.toString();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary)),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value.toString();
                  },
                ),
                if (_authMode == AuthMode.signUp)
                  TextFormField(
                    enabled: _authMode == AuthMode.signUp,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.signUp
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  TextButton(
                    onPressed: _submit,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8.0),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: Colors.white,
                    ),
                    child:
                        Text(_authMode == AuthMode.login ? 'Login' : 'SIGN UP'),
                  ),
                TextButton(
                  onPressed: _switchAuthMode,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 4),
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                      '${_authMode == AuthMode.login ? 'signUp' : 'Login'} INSTEAD'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
