import 'package:flutter/material.dart';
import 'package:user_view/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        // backgroundColor: Colors.green,
        elevation: 0,
        title: Text('Sign In'),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign In Anonymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();

            if (result != null) {
              print('Signed In');
              print(result);
            } else {
              print('Error Signing In!');
            }
          },
        ),
      ),

    );
  }
}