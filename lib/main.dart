import 'package:coffee_buddy/controller/AuthController.dart';
import 'package:coffee_buddy/model/AppUser.dart';
import 'package:coffee_buddy/screen/Authentication/Register.dart';
import 'package:coffee_buddy/screen/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthController().user,
      catchError: (_,__) => null,
      initialData: null,
      child: MaterialApp(
        routes: {
          '/': (context)=>const Wrapper(),
          '/register': (context) => Register(),
        },
      ),
    );
  }
}

