// import 'package:flutter_app_newsv1/Modules/Shop_app/Categories/categoriesCubitPackage/categStates.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_app_newsv1/Shared/consts.dart';
// import 'package:flutter_app_newsv1/models/shop_app/categories_model.dart';
// import 'package:flutter_app_newsv1/models/shop_app/home_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CategCubit extends Cubit<CategStates> {
//   CategCubit() : super(CategoriesInitialState());
//
//   static CategCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(CategoriesChangeBottomNavState());
//   }
//
//   CategData CategVarData;
//
//
//   void getCateg() {
//     emit(GetCategoriesLoadingState());
//
//     DioHelper.getData(
//         url: CATEG,
//         token: tokenAll
//     ).then((value) {
//       if(value.data['status']){
//         CategVarData = CategData.fromJson(value.data);
//         print('true');
//       }
//       emit(GetCategoriesSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetCategoriesErrorState(
//         // error.toString()
//       ));
//     });
//   }
// }