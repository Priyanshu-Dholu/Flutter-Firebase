import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_view/models/user.dart';
import 'package:user_view/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_view/services/auth.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<MyUser?>.value(
    value: AuthService().user,
    catchError: (_,__) {},
    initialData: null,
    child: MaterialApp(
      home: Wrapper(),
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.red
      ),
    ),
  ));  
}