abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class GetCategoriesLoadingState extends ShopStates {}

class GetCategoriesSuccessState extends ShopStates {}

class GetCategoriesErrorState extends ShopStates {}

class CategoriesChangeBottomNavState extends ShopStates {}

class GetFavoritesLoadingState extends ShopStates {}

class GetFavoritesSuccessState extends ShopStates {}

class GetFavoritesErrorState extends ShopStates {}

class FavoritesChangeBottomNavState extends ShopStates {}

class RegisterLoadingState extends ShopStates{}

class RegisterSuccessState extends ShopStates{}

class RegisterErrorState extends ShopStates{}

class HomeSearchLoadingState extends ShopStates{}

class HomeSearchSuccessState extends ShopStates{}

class HomeSearchErrorState extends ShopStates{
  final String error;

  HomeSearchErrorState(this.error);
}

class HomeSettingsLoadingState extends ShopStates{}

class HomeSettingsSuccessState extends ShopStates{}

class HomeSettingsErrorState extends ShopStates{}

class HomeSettingsChangeBottomNavState extends ShopStates {}

class HomeSettingsChangeThemeModeState extends ShopStates {}

class HomeSettingsChangeSelectedCountryState extends ShopStates {}

class SignInLoadingState extends ShopStates {}

class SignInSuccessState extends ShopStates {}

class SignInErrorState extends ShopStates {}

class GetHomeLoadingState extends ShopStates{}

class GetHomeSuccessState extends ShopStates{}

class GetHomeErrorState extends ShopStates{}

class HomeChangeBottomNavState extends ShopStates{}

class ShopChangeFavoritesState extends ShopStates {}

class ShopChangeFavoritesLoadingState extends ShopStates {}

class ShopChangeFavoritesSuccessState extends ShopStates {}

class ShopChangeFavoritesErrorState extends ShopStates {}