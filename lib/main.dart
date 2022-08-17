// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_view/screens/wrapper.dart';
import 'screens/auth.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MPage(),
  ));
}