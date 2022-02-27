import 'package:coffee_buddy/model/AppUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user
  AppUser? _getUser(User? user){

    return user != null? AppUser(userId: user.uid):null;
  }

  //auth change user stream
  Stream<AppUser?> get user{
    return _auth.authStateChanges().map(_getUser);
  }

  //sign in anonymous
  Future AnonSignIn() async{
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _getUser(user);
  }
  catch(e){
      print(e.toString());
      return null;
  }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return 'could not sign out';
    }

  }

}