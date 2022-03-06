import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_buddy/model/AppUser.dart';
class DatabaseController{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // String currentUserId;
  // DatabaseController({this.currentUserId = ''});

  // update user
  Future updateUser(AppUser appUser) async {
    return await firestore.collection('Users').doc(appUser.userId).set(appUser.getUser());
  }

  // get all users list from stream snapshot
  List<AppUser> getUserList(QuerySnapshot snapshot){
    return snapshot.docs.map((e) => AppUser(userId: e.id, name: e['name'], sugar: e['sugar'], strength: e['strength'])).toList();
  }

  // all user stream
  Stream<List<AppUser>> get userStream{
    return firestore.collection('Users').snapshots().map(getUserList);
  }


  //current user data fetch/update
  AppUser getCurrentUserData(DocumentSnapshot snapshot){
    Map data = snapshot.data() as Map;
    return AppUser(userId: snapshot.id,name: data['name'],sugar: data['sugar'],strength: data['strength']);
  }
  //current user stream
  Stream<AppUser>  currentUserStream(AppUser currentUser){
    return firestore.collection('Users').doc(currentUser.userId).snapshots().map(getCurrentUserData);
  }
}