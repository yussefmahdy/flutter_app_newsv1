abstract class SocialStates { }


class SocialInitialState extends SocialStates {}

class SocialSignInLoadingState extends SocialStates {}

class SocialSignInSuccessState extends SocialStates {
  final String error;

  SocialSignInSuccessState({this.error});
}

class SocialSignInErrorState extends SocialStates {
  final String error;

  SocialSignInErrorState({this.error});
}

class SocialRegisterLoadingState extends SocialStates {}

class SocialRegisterSuccessState extends SocialStates {}

class SocialRegisterErrorState extends SocialStates {}
