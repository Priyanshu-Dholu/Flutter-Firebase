import 'package:flutter/material.dart';
import 'package:user_view/screens/authenticate/authenticate.dart';
import 'package:user_view/screens/authenticate/sign_in.dart';
import 'package:user_view/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // Return Either Home Or Authenticate Widget
    return SignIn();
  }
}