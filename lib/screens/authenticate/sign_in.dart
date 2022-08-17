import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:user_view/services/auth.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);

  final Function toggleView;
  SignIn({ required this.toggleView });


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authenticate = AuthService();

  final emailController = TextEditingController();
  final passwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person),
            label: Text('Register'), 
          ),
        ],
      ),

      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                autofillHints: const [AutofillHints.email],
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                controller: passwController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  prefixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                autofillHints: const [AutofillHints.password],
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton.icon(
                onPressed: () async {
                  print(emailController.text);
                  print(passwController.text);    
                  await _authenticate.signInWithEmailandPass(emailController.text, passwController.text);        
                },
                icon: Icon(Icons.login),
                label: Text('Login'),
              ),
            ],
          ),
        ),
      )
    );
  }
}