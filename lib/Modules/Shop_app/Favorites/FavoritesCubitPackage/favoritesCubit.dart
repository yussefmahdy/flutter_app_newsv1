// import 'package:flutter/material.dart';
// import 'package:flutter_app_newsv1/Layout/Home/homeCubitPackage/home-states.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Categories/categories_screen.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Favorites/FavoritesCubitPackage/favoritesStates.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Favorites/favorites_screen.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/mainscreen.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_app_newsv1/Shared/consts.dart';
// import 'package:flutter_app_newsv1/models/shop_app/favorites_model.dart';
// import 'package:flutter_app_newsv1/models/shop_app/home_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/cupertino.dart';
//
// class FavoritesCubit extends Cubit<FavoritesStates> {
//   FavoritesCubit() : super(FavoritesInitialState());
//
//   static FavoritesCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(FavoritesChangeBottomNavState());
//   }
//
//   FavoritesModel favoritesModel;
//
//   Map<int, bool> favorites = {};
//
//   void getFavorites() {
//     emit(GetFavoritesLoadingState());
//
//     DioHelper.getData(
//         url: FAV,
//         token: tokenAll
//     ).then((value) {
//
//       favoritesModel = FavoritesModel.fromJson(value.data);
//
//
//       if(value.data['status']){
//         favoritesModel = FavoritesModel.fromJson(value.data);
//         print('true');
//       }
//       emit(GetFavoritesSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetFavoritesErrorState(
//         // error.toString()
//       ));
//     });
//   }
//
//
//
//
// }