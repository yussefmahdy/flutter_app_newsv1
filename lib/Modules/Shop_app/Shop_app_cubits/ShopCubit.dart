import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/Home/Home_screen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Categories/categories_screen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Favorites/favorites_screen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Settings/HomeSettingScreen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/mainscreen.dart';
import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
import 'package:flutter_app_newsv1/Shared/consts.dart';
import 'package:flutter_app_newsv1/models/shop_app/Simple_model.dart';
import 'package:flutter_app_newsv1/models/shop_app/categories_model.dart';
import 'package:flutter_app_newsv1/models/shop_app/favorites_model.dart';
import 'package:flutter_app_newsv1/models/shop_app/home_model.dart';
import 'package:flutter_app_newsv1/models/shop_app/search_model.dart';
import 'package:flutter_app_newsv1/models/shop_app/user-login-data.dart';
import 'package:flutter_app_newsv1/models/shop_app/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;



  // void changeIndex(int index) {
  //   currentIndex = index;
  //   emit(FavoritesChangeBottomNavState());
  // }




  List<Widget> screens = [
    MainScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    HomeSettingsScreen(),
  ];

  List<String> titles = [
    'Salla',
    'Categories',
    'Favorites',
    'Settings',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  HomeData homeData;

  Map<int, bool> favorites = {};

  void getHome() {
    emit(GetHomeLoadingState());

    DioHelper.getData(
        url: HOME,
        token: tokenAll
    ).then((value) {

      homeData = HomeData.fromJson(value.data);

      homeData.data.products.forEach((element) {
        favorites.addAll({
          element.id:element.inFavorite,
        });
      });

      if(value.data['status']){
        homeData = HomeData.fromJson(value.data);
        // print(homeData.data.products[0].name);
        print('true');
      }
      emit(GetHomeSuccessState());
    });
  }

  FavoritesModel favoritesModel;



  void getFavorites() {
    emit(GetFavoritesLoadingState());

    DioHelper.getData(
        url: FAV,
        token: tokenAll
    ).then((value) {

      favoritesModel = FavoritesModel.fromJson(value.data);

      favoritesModel.data.data.forEach((element) {
        if(!favorites.containsKey(element.id)){
          favorites.addAll({

          });
        }
      });


      // if(value.data['status']){
      //   favoritesModel = FavoritesModel.fromJson(value.data);
      //   print('true');
      // }
      emit(GetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesErrorState(
        // error.toString()
      ));
    });
  }

  CategData CategVarData;


  void getCateg() {
    emit(GetCategoriesLoadingState());

    DioHelper.getData(
        url: CATEG,
        token: tokenAll
    ).then((value) {
      if(value.data['status']){
        CategVarData = CategData.fromJson(value.data);
        print('true');
      }
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesErrorState(
        // error.toString()
      ));
    });
  }

  UserModel userModel;

  void userRegister({
     String name,
     String phoneNumber,
     String email,
     String password,
  }) async {

    emit(RegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'phone': phoneNumber,
        'email': email,
        'password': password,
      },
    ).then((value)
    {

      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });


    // userModel = UserModel.fromJson(value.data);
    //
    // if (userModel.status)
    // {
    //   print('success');
    //   print(value.statusCode);
    //   print(userModel.data.name);
    //   print(userModel.data.token);
    //
    //   CacheHelper.setData(
    //     key: 'userData',
    //     value: jsonEncode(value.data),
    //   );
    //
    // } else
    // {
    //   print(userModel.message);
    // }
  }


  SearchData searchData;

  void startSearch(String text) {
    emit(HomeSearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      data: {
        'text': text
      },
      token: tokenAll,

    ).then((response) {
      searchData = SearchData.fromJson(response.data);

      emit(HomeSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeSearchErrorState(
          error.toString()
      ));
    });
  }


  bool isDark = false;

  void changeThemeMode() {
    isDark = !isDark;
    CacheHelper.setData(
      key: 'isDark',
      value: isDark,
    ).then((value) {
      print('success');
      emit(HomeSettingsChangeThemeModeState());
    });
  }


  void setDataFromSharedPreferences({
    bool fromShared,
    String savedLanguageCode,
  })
  {
    isDark = fromShared;
    languageCode = savedLanguageCode;

    switch (languageCode)
    {
      case 'Arabic':
        selectedLanguage = 'ar';
        break;
      case 'English':
        selectedLanguage = 'en';
        break;
    }

    emit(HomeSettingsChangeThemeModeState());
  }

  String selectedLanguage = 'Arabic';
  String languageCode = 'ar';

  void changeSelectedLanguage(String value , BuildContext context) {
    selectedLanguage = value;

    switch (selectedLanguage)
    {
      case 'Arabic':
        languageCode = "ar";
        DioHelper.dio.options.headers = {
          "lang":"ar",
          "Content-Type":"application/json",
          // if(token != null)
          //   "Authorization":token,
        };
        break;
      case 'English':
        languageCode = "en";
        DioHelper.dio.options.headers = {
          "lang":"en",
          "Content-Type":"application/json",
          // if(token != null)
          //   "Authorization":token,
        };
        break;
    }



    CacheHelper.setData(
      key: 'countryCode',
      value: languageCode,
    ).then((value)
    {

      emit(HomeSettingsChangeSelectedCountryState());
      Phoenix.rebirth(context);
    });

  }

  void setDropdownValue(){



    switch (CacheHelper.getData(key: "countryCode"))
    {
      case 'ar':
        selectedLanguage = 'Arabic';
        break;
      case 'en':
        selectedLanguage = 'English';
        break;
    }
  }

  UserLogin userLogin;

  void userSignIn({
    @required String email,
    @required String password,
    @required BuildContext context
  }) async {

    emit(SignInLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      if(value.data['status']){
        userLogin = UserLogin.fromJson(value.data);
        tokenAll = userLogin.data.token;
        CacheHelper.setData(key: 'token', value: userLogin.data.token).then((value){
          if(value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen() ));
          }
        });

      }else{
        print('false');
      }
      emit(SignInSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignInErrorState());
    });
  }

  SimpleModel simpleModel;

  void changeFavorites(int id) {

    favorites[id] = !favorites[id];

    emit(ShopChangeFavoritesLoadingState());

    DioHelper.postData(
        url: FAV,
        token: tokenAll,
        data: {
          'product_id' : id,
        }
    ).then((value) {

      simpleModel = SimpleModel.fromJson(value.data);

      print(simpleModel.status);
      print(simpleModel.message);

      if(simpleModel.status){
        favorites[id] = !favorites[id];
      }else{
        getFavorites();
      }

      emit(ShopChangeFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      favorites[id] = !favorites[id];
      emit(ShopChangeFavoritesErrorState(
        // error.toString()
      ));
    });
  }




}