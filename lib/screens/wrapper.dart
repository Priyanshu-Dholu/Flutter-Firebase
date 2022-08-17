import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:user_view/screens/MainPage.dart';
import 'package:user_view/screens/auth.dart';

class MPage extends StatefulWidget {
  const MPage({Key? key}) : super(key: key);

  @override
  State<MPage> createState() => _MPageState();
}

class _MPageState extends State<MPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          } else {
            return Auth();
          }
        }),
      );
  }
}