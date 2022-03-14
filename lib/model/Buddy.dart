class Buddy{

  final String? userId;
  String name;
  String sugar;
  int strength;
  String chatKey;
  int messageCount;

  Buddy({required this.userId,
    required this.name,
    required this.sugar,
    required this.strength,
    required this.chatKey,
    this.messageCount = 0});

  Map<String,dynamic> getBuddyMap(){
    return {
      'userId':userId,
      'name':name,
      'sugar':sugar,
      'strength':strength,
      'chatKey':chatKey,
      'messageCount':messageCount
    };
  }

}