import 'package:flutter/material.dart';
import 'package:user_view/models/user.dart';
import 'package:user_view/screens/authenticate/authenticate.dart';
import 'package:user_view/screens/home/Home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    // Returns Either Home Or Authentication
    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}