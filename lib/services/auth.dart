import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_view/models/user.dart';

class AuthService {

  // Create User Object Based On FirebaseUser
  MyUser? _userfromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Auth Change User stream
  Stream<MyUser?> get user {
    return FirebaseAuth.instance.authStateChanges()
        .map((User? user) => _userfromFirebase(user!));
  }

  // Sign In Anon
  Future signInAnon() async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and pass
  Future signInWithEmailandPass(String email,String pass) async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and pass
  Future registerWithEmailandPass(String email,String pass) async {
      try {
        UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        User? user = result.user;
        return _userfromFirebase(user!);
      } catch (e) {
        print(e.toString());
        return null;
      }
    }

  // Sign Out
  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}