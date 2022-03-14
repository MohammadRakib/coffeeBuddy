import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_buddy/model/AppUser.dart';
import 'package:coffee_buddy/model/Buddy.dart';
class DatabaseController{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // update user
    updateUser(AppUser appUser) async {
     await firestore.collection('Users').doc(appUser.userId).set(appUser.getUser());
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


  // add buddy
  addBuddy(AppUser user, AppUser? currentUser) async{
    DocumentReference buddyReference =   firestore.collection('Users').doc(currentUser?.userId).collection('Buddy').doc(user.userId);
    DocumentReference chatReference = firestore.collection('Chat').doc();
    String chatKey = chatReference.id;
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    Buddy buddy = Buddy(userId: user.userId,
                        name: user.name,
                        sugar: user.sugar,
                        strength: user.strength,
                        chatKey: chatKey);


    batch.set(buddyReference, buddy.getBuddyMap());
    batch.set(chatReference, {'messageCount':0});
    await batch.commit();
  }
  
  // Buddy data fetch
  List<Buddy> getBuddyList(QuerySnapshot snapshot){
    return snapshot.docs.map((e) => Buddy(userId: e.id,
                                          name: e['name'],
                                          sugar: e['sugar'],
                                          strength: e['strength'],
                                          chatKey: e['chatKey'],
                                          messageCount: e['messageCount'])).toList();
  }

  // all user stream
  Stream<List<Buddy>> buddyStream(AppUser? currentUser){
    return firestore.collection('Users').doc(currentUser?.userId)
                                        .collection('Buddy')
                                        .snapshots().map(getBuddyList);
  }

}