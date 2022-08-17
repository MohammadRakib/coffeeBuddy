import 'package:coffee_buddy/model/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user
  AppUser? _getUser(User? user){

    return AppUser(userId: user!.uid);
  }

  //auth change user stream
  Stream<AppUser?> get user{
    return _auth.authStateChanges().map(_getUser);
  }

  //sign in anonymous
  Future anonSignIn() async{
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _getUser(user);
  }
    on FirebaseAuthException catch(e){
      print(e.toString());
      return e.message;
    }
  }

  //email and password Register
  Future emailPasswordRegister({required String email, required String password}) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _getUser(user);
    }
    on FirebaseAuthException catch(e){
      print(e.toString());
      return e.message;
    }
  }

  //email and password Sign in
  Future emailPasswordSignIn({required String email, required String password}) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _getUser(user);
    }
    on FirebaseAuthException catch(e){
      print(e.toString());
      return e.message;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    on FirebaseAuthException catch(e){
      print(e.toString());
      return e.message;
    }

  }

}