
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_newsv1/Layout/Home/Home_screen.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/social-sign-in/social-sign-In-screen.dart';
import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
import 'package:flutter_app_newsv1/Shared/bloc_observer.dart';
import 'package:flutter_app_newsv1/Shared/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

// main method in app
void main() async
{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();


  DioHelper.init();
  await CacheHelper.init();
  tokenAll = CacheHelper.getData(key: 'token');
  bool isLoggedBefore;
  if(tokenAll != null )
    isLoggedBefore = true;
  else
    isLoggedBefore = false;
  
  



  // run my app method
  // param is object from Widget class
  runApp(Phoenix(child: MyApp(isLoggedBefore: isLoggedBefore ,)));
}

// 1. stateless
// 2. stateful

// main class extends widget
class MyApp extends StatelessWidget {
  final bool isLoggedBefore;

   MyApp({this.isLoggedBefore});
  // main method of class to build screen UI
  @override
  Widget build(BuildContext context) {
    // material app object wrap all screens
    return MaterialApp(

    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Jannah',
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    titleTextStyle: TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    ),
    iconTheme: IconThemeData(
    color: Colors.black,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    ),
    ),
    ),
    home: Directionality(
    textDirection: TextDirection.ltr,
    child:   SocialSignInScreen(),//HomeScreen()//: SignInScreen()
    ),
    );
  }
}