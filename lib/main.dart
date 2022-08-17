import 'package:coffee_buddy/controller/auth_controller.dart';
import 'package:coffee_buddy/model/app_user.dart';
import 'package:coffee_buddy/screen/Authentication/register.dart';
import 'package:coffee_buddy/screen/wrapper.dart';
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
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context)=>const Wrapper(),
          '/register': (context) => Register(),
        },
      ),
    );
  }
}

