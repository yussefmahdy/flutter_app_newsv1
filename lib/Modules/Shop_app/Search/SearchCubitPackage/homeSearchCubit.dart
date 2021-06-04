// import 'package:flutter_app_newsv1/Modules/Shop_app/Search/SearchCubitPackage/homeSearchStates.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_app_newsv1/Shared/consts.dart';
// import 'package:flutter_app_newsv1/models/shop_app/search_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class HomeSearchCubit extends Cubit<HomeSearchStates> {
//   HomeSearchCubit() : super(HomeSearchInitialState());
//
//   static HomeSearchCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//
//
//
//   SearchData searchData;
//
//   void startSearch(String text) {
//     emit(HomeSearchLoadingState());
//
//     DioHelper.postData(
//       url: SEARCH,
//       data: {
//         'text': text
//       },
//       token: tokenAll,
//
//     ).then((response) {
//       searchData = SearchData.fromJson(response.data);
//
//       emit(HomeSearchSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(HomeSearchErrorState(
//           error.toString()
//       ));
//     });
//   }
//
// }