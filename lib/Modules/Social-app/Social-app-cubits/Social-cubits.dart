import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-states.dart';
import 'package:flutter_app_newsv1/Shared/Networks/end_points.dart';
import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';
import 'package:flutter_app_newsv1/Shared/Networks/remote/dio_helper.dart';
import 'package:flutter_app_newsv1/models/shop_app/user-login-data.dart';
import 'package:flutter_app_newsv1/models/shop_app/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserLogin userLogin;

  void userSignIn({
    @required String email,
    @required String password,
    @required BuildContext context
  }) async {

    emit(SocialSignInLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      userLogin = UserLogin.fromJson(value.data);

      if (userModel.status){
        print("success");
        print(value.statusCode);
        print(userModel.data.name);
        print(userModel.data.token);
        CacheHelper.setData(
            key: 'userData',
            value: jsonEncode(value.data),
        );
      }
      emit(SocialSignInSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialSignInErrorState());
    });
  }


  UserModel userModel;

  void userRegister({
    String email,
    String password,
  }) async {

    emit(SocialRegisterLoadingState());

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {

        print(value.user.uid);
        emit(SocialRegisterSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SocialRegisterErrorState());
      });





  }



  void userFireBaseLogin({
    String email,
    String password,
  }) async {

    emit(SocialSignInLoadingState());


      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {

        print(value.user.uid);
        emit(SocialSignInSuccessState(
          error: value.user.uid,
        ));
      }).catchError((error) {
        print(error.toString());

        String err;

        if(error.toString().contains("[firebase_auth/wrong-password]"))
        {
          print("password error");
          err = 'PASSWORD ERROR';
        } else if (error.toString().contains("[firebase_auth/user-not-found]"))
        {
          err = 'USER NOT FOUND';
        }
        emit(SocialSignInErrorState(
          error: err,
        ));
      });


    //   print(value.data);
    //   emit(SocialRegisterSuccessState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(SocialRegisterErrorState());



  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    print(googleUser);
    print(googleAuth);
    print(credential);


    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void PhoneAuth({String code,String mobile})async
  {
    var auth= FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: mobile,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential).then((value) {
          print(value.user.uid);
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        emit(CodeSentSuccessState());
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = "xxxx";

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }




  }


