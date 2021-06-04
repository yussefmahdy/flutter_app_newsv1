// import 'package:flutter/material.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Register/registerCubitPackage/registerStates.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Sign_in/ShopCubitPackage/loginstates.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_app_newsv1/models/shop_app/user_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
//
// class RegisterCubit extends Cubit<ShopStates> {
//   RegisterCubit() : super(ShopInitialState());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//
//   UserModel userModel;
//
//   void userRegister({
//     @required String name,
//     @required String phoneNumber,
//     @required String email,
//     @required String password,
//   }) async {
//
//     emit(RegisterLoadingState());
//
//     DioHelper.postData(
//       url: REGISTER,
//       data: {
//         'name': name,
//         'phone': phoneNumber,
//         'email': email,
//         'password': password,
//       },
//     ).then((value)
//     {
//
//       print(value.data);
//       emit(RegisterSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(RegisterErrorState());
//     });
//
//
//     // userModel = UserModel.fromJson(value.data);
//     //
//     // if (userModel.status)
//     // {
//     //   print('success');
//     //   print(value.statusCode);
//     //   print(userModel.data.name);
//     //   print(userModel.data.token);
//     //
//     //   CacheHelper.setData(
//     //     key: 'userData',
//     //     value: jsonEncode(value.data),
//     //   );
//     //
//     // } else
//     // {
//     //   print(userModel.message);
//     // }
//   }
// }