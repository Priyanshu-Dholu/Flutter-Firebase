# user_view

A new Flutter project with Firebase.

## Note:

Starting from Version firebase_auth 0.18.0:

FirebaseUser has been changed to User

AuthResult has been changed to UserCredential

GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()

onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()

currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
