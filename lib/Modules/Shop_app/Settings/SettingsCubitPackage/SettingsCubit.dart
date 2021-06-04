// import 'package:flutter/material.dart';
// import 'package:flutter_app_newsv1/Modules/Shop_app/Settings/SettingsCubitPackage/SettingsStates.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
// import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';
//
// class HomeSettingCubit extends Cubit<HomeSettingStates> {
//   HomeSettingCubit() : super(HomeSettingsInitialState());
//
//   static HomeSettingCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(HomeSettingsChangeBottomNavState());
//   }
//
//   bool isDark = false;
//
//   void changeThemeMode() {
//     isDark = !isDark;
//     CacheHelper.setData(
//       key: 'isDark',
//       value: isDark,
//     ).then((value) {
//       print('success');
//       emit(HomeSettingsChangeThemeModeState());
//     });
//   }
//
//
//   void setDataFromSharedPreferences({
//     @required bool fromShared,
//     @required String savedLanguageCode,
//   })
//   {
//     isDark = fromShared;
//     languageCode = savedLanguageCode;
//
//     switch (languageCode)
//     {
//       case 'Arabic':
//         selectedLanguage = 'ar';
//         break;
//       case 'English':
//         selectedLanguage = 'en';
//         break;
//     }
//
//     emit(HomeSettingsChangeThemeModeState());
//   }
//
//   String selectedLanguage = 'Arabic';
//   String languageCode = 'ar';
//
//   void changeSelectedLanguage(String value , BuildContext context) {
//     selectedLanguage = value;
//
//     switch (selectedLanguage)
//     {
//       case 'Arabic':
//         languageCode = "ar";
//         DioHelper.dio.options.headers = {
//           "lang":"ar",
//           "Content-Type":"application/json",
//           // if(token != null)
//           //   "Authorization":token,
//         };
//         break;
//       case 'English':
//         languageCode = "en";
//         DioHelper.dio.options.headers = {
//           "lang":"en",
//           "Content-Type":"application/json",
//           // if(token != null)
//           //   "Authorization":token,
//         };
//         break;
//     }
//
//
//
//     CacheHelper.setData(
//       key: 'countryCode',
//       value: languageCode,
//     ).then((value)
//     {
//
//       emit(HomeSettingsChangeSelectedCountryState());
//       Phoenix.rebirth(context);
//     });
//
//   }
//
//   void setDropdownValue(){
//
//
//
//     switch (CacheHelper.getData(key: "countryCode"))
//     {
//       case 'ar':
//         selectedLanguage = 'Arabic';
//         break;
//       case 'en':
//         selectedLanguage = 'English';
//         break;
//     }
//   }
//
// }