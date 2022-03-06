class AppUser{

  final String? userId;
  String name;
  String sugar;
  int strength;

  AppUser({required this.userId,this.name = 'New user',this.sugar = '0',this.strength = 100});

  Map<String,dynamic> getUser(){
    return {
      'name':name,
      'sugar':sugar,
      'strength':strength
    };
  }

}