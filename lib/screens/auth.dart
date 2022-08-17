// import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_view/screens/MainPage.dart';


class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String user_check = user == null ? 'out' : 'in';
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth User (Logged $user_check)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [   

          // Email
          Container(
            margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                // hintText: 'Enter Name: ',
                labelText: 'Enter Email',
                icon: Icon(Icons.email),
                border: OutlineInputBorder(),
                // labelStyle: TextStyle(
                //   fontSize: 20.0
                // ),
              ),
              controller: _emailController,
            ),
          ),
          SizedBox(height: 2.0,),

          // Password
          Container(
            margin: EdgeInsets.all(5.0),
            child:  TextField(
              controller: _passController,
              decoration: const InputDecoration(
                labelText: 'Enter Password',
                border: OutlineInputBorder(),
                icon: Icon(Icons.password)
              ),
              keyboardType: TextInputType.text,
            ),
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Signup
              Container(
                margin: EdgeInsets.all(5.0),
                child: ElevatedButton(
                  child: Text('Signup'),
                  onPressed: () async {
                    final email = _emailController.text;
                    final pass = _passController.text;
                    await authentication(operation: 1, email: email, pass: pass);
                    setState(() {
                      
                    });
                  },
                ),
              ),
              // Login
              Container(
                margin: EdgeInsets.all(5.0),
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () async {
                    final email = _emailController.text;
                    final pass = _passController.text;
                    await authentication(operation: 2, email: email, pass: pass);
                  },
                ),
              ),
              // Logout
              Container(
                margin: EdgeInsets.all(5.0),
                child: ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () async {
                    final email = _emailController.text;
                    final pass = _passController.text;
                    await authentication(operation: 3, email: email, pass: pass);
                    setState(() {
                      
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Object> authentication({required int operation,required String email,required String pass}) async {
    if (operation == 1) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        return 1;
      } catch (e) {
        print(e.toString());
        return 0;
      }
    }
    else if (operation == 2) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
        // Navigator.pushNamed(this.context, '/main');
        print('Logged IN');
        return 1;
      } catch (e) {
        print(e.toString());
        return 0;
      }
    }
    else if (operation == 3) {
      try {
        await FirebaseAuth.instance.signOut();
        return 1;
      } catch (e) {
        print(e.toString());
        return 0;
      }
    }
    return 0;
  }
}