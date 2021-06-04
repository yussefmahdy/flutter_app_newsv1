// import 'package:flutter/material.dart';
// import 'package:flutter_app_newsv1/Layout/Home/homeCubitPackage/home-states.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Categories/categories_screen.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Favorites/favorites_screen.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Settings/HomeSettingScreen.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/mainscreen.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_app_newsv1/Shared/consts.dart';
// import 'package:flutter_app_newsv1/models/shop_app/home_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/cupertino.dart';
//
// class HomeCubit extends Cubit<HomeStates> {
//   HomeCubit() : super(HomeInitialState());
//
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//
//
//   List<Widget> screens = [
//     MainScreen(),
//     CategoriesScreen(),
//     FavoritesScreen(),
//     HomeSettingsScreen(),
//   ];
//
//   List<String> titles = [
//     'Salla',
//     'Categories',
//     'Favorites',
//     'Settings',
//   ];
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(HomeChangeBottomNavState());
//   }
//   HomeData homeData;
//
//
//
//   void getHome() {
//     emit(GetHomeLoadingState());
//
//     DioHelper.getData(
//       url: HOME,
//       token: tokenAll
//     ).then((value) {
//
//       // homeData = HomeData.fromJson(value.data);
//       //
//       // homeData.data.products.forEach((element) {
//       //   favorites.addAll;
//       // });
//
//       if(value.data['status']){
//         homeData = HomeData.fromJson(value.data);
//         print(homeData.data.products[0].name);
//         print('true');
//       }
//       emit(GetHomeSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetHomeErrorState(
//           //error.toString()
//       ));
//     });
//   }
//
//
// }