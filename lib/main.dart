
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_newsv1/Layout/Home/Home_screen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/social-sign-in/social-sign-In-screen.dart';
import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
import 'package:flutter_app_newsv1/Shared/bloc_observer.dart';
import 'package:flutter_app_newsv1/Shared/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

// main method in app
void main() async
{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();


  DioHelper.init();
  await CacheHelper.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  tokenAll = sharedPreferences.getString("token");
   //= CacheHelper.getData(key: 'token');
  print('TOKEN FROM $tokenAll}');
  bool isLoggedBefore;
  if(tokenAll != null )
    isLoggedBefore = true;
  else
    isLoggedBefore = false;


  Widget start;


  //final currentUser = FirebaseAuth.instance.currentUser;

  // if(currentUser != null){
  //   print("Current User Success");
  // } else{
  //   print("Current User Is Null");
  // }


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
    return BlocProvider(
      create: (context) => ShopCubit()
        ..getHome()
        ..getCart()
        ..getFavorites()
        ..getCateg(),
      child: MaterialApp(

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
      child:  HomeScreen() ,//SocialSignInScreen()//HomeScreen()//: SignInScreen()
      ),
      ),
    );
  }
}