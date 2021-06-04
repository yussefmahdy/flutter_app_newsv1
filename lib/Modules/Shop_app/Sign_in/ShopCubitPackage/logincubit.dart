// import 'package:flutter/material.dart';
// import 'package:flutter_app_newsv1/Layout/Home/Home_screen.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Sign_in/ShopCubitPackage/loginstates.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_app_newsv1/Shared/consts.dart';
// import 'package:flutter_app_newsv1/models/shop_app/user-login-data.dart';
// import 'package:flutter_app_newsv1/models/shop_app/user_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
//
// class SignInCubit extends Cubit<SignInStates> {
//   SignInCubit() : super(SignInInitialState());
//
//   static SignInCubit get(context) => BlocProvider.of(context);
//
//   UserLogin userLogin;
//
//   void userSignIn({
//     @required String email,
//     @required String password,
//     @required BuildContext context
//   }) async {
//
//     emit(SignInLoadingState());
//
//     DioHelper.postData(
//       url: LOGIN,
//       data: {
//         'email': email,
//         'password': password,
//       },
//     ).then((value)
//     {
//       if(value.data['status']){
//         userLogin = UserLogin.fromJson(value.data);
//         tokenAll = userLogin.data.token;
//         CacheHelper.setData(key: 'token', value: userLogin.data.token).then((value){
//           if(value){
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen() ));
//           }
//         });
//
//       }else{
//         print('false');
//       }
//       emit(SignInSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(SignInErrorState());
//     });
//   }
// }