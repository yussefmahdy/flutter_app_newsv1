import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-cubits.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-states.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/social-regester/social-regester-screen.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SocialSignInScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  var globalKey = GlobalKey<FormState>();
  String validateText= "Please write a valid data";
  dynamic color = Colors.grey;

  @override
  Widget build(BuildContext context)  {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state){
          if(state is SocialSignInErrorState)
          {
            Fluttertoast.showToast
              (
                msg: state.error,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.red,
                backgroundColor: Colors.white70,
              );
          }

          if(state is SocialSignInSuccessState)
          {
            Fluttertoast.showToast
              (
              msg: state.error,
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.green,
              backgroundColor: Colors.white70,
            );
          }
        },
        builder: (context, state){
          return Scaffold(
              body: SafeArea(
                  child: Form(
                    key: globalKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text(
                                "LogIn",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "LogIn now to browse our hot offers",
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  label: "Email Address",
                                  validate: "Email Address must not be empty",
                                  icon: Icons.email,
                                  onChange: (value) {}
                              ),

                              SizedBox(
                                height: 10.0,
                              ),

                              defaultFormField(
                                controller: passwordController,
                                type: TextInputType.text,
                                label: "Password",
                                validate: "Password must not be empty",
                                icon: Icons.lock,
                                onChange: (value) {},
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              if(state is! CodeSentSuccessState)
                              defaultFormField(
                                  controller: phoneController,
                                  type: TextInputType.phone,
                                  label: "Phone number",
                                  validate: "Phone must not be empty",
                                  icon: Icons.phone,
                                  onChange: (value) {}
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              if(state is CodeSentSuccessState)
                              defaultFormField(
                                  controller: codeController,
                                  type: TextInputType.number,
                                  label: "Code",
                                  validate: "code must not be empty",
                                  icon: Icons.code,
                                  onChange: (value) {}
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              Text(
                                "${validateText}",
                                style: TextStyle(
                                  color: color,
                                ),
                              ),

                              SizedBox(
                                height: 20.0,
                              ),
                              if(state is SocialSignInLoadingState)
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              SizedBox(
                                height: 20.0,
                              ),
                              if(state is! CodeSentSuccessState)
                              defaultButton(
                                whenPress: () {
                                  SocialCubit.get(context).PhoneAuth(
                                    mobile: phoneController.text,
                                  );
                                },
                                text: "Send Code",
                                upperCase: true,
                                fullWidth: true,
                                // text: "Send Code",
                                // upperCase: true,
                                // fullWidth: true,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              if(state is CodeSentSuccessState)
                              defaultButton(
                                whenPress: () {
                                  SocialCubit.get(context).PhoneAuth(
                                    code: codeController.text,
                                  );
                                },
                                text: "Continue",
                                upperCase: true,
                                fullWidth: true,
                              ),
                              if(state is CodeSentSuccessState)
                              SizedBox(
                                height: 20.0,
                              ),


                              if(state is! SocialSignInLoadingState)

                                defaultButton(
                                  whenPress: () {
                                    if(globalKey.currentState.validate())
                                    {
                                      SocialCubit.get(context).userFireBaseLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );


                                      //validateText = "Username or Password is incorrect please try again";

                                      //color = Colors.red;

                                    }

                                  },
                                  text: "Sign in",
                                  upperCase: true,
                                  fullWidth: true,
                                ),

                              defaultButton(
                                whenPress: () {
                                  print("we are working");
                                  SocialCubit.get(context).signInWithGoogle().then((value) {
                                        print('hello');
                                    Fluttertoast.showToast(
                                      msg: '${value.user.uid} \n ${value.user.email}',
                                      gravity: ToastGravity.BOTTOM,
                                    );
                                  })
                                      .catchError((error){});
                                },
                                text: "Continue with Google",
                                upperCase: true,
                                fullWidth: true,
                              ),
                              defaultButton(
                                whenPress: () {
                                  facebookLogin();
                                },
                                text: "Continue with Facebook",
                                upperCase: true,
                                fullWidth: true,
                              ),
                              if(false)
                              defaultButton(
                                whenPress: () {
                                  SocialCubit.get(context).PhoneAuth();
                                },
                                text: "Continue with Phone number",
                                upperCase: true,
                                fullWidth: true,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'don\'t have an account?   ',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(
                                          context: context,
                                          widget: SocialRegisterScreen(),
                                      );
                                    },
                                    child: Text(
                                        "Register"
                                    ),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              )
          );
        },
      ),
    );
  }

  void facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: [],
    );

    // by default we request the email and the public profile

    // or FacebookAuth.i.login()

    if (result.status == LoginStatus.success) {
      // you are logged
      print(result.accessToken.token);
      print(result.accessToken.userId);
      print(result.message);

      Dio dio = Dio(
        BaseOptions(
          baseUrl: 'https://graph.facebook.com/',
          receiveDataWhenStatusError: true,
        ),
      );

      dio.get('v2.12/me', queryParameters:
      {
        'fields': 'name,first_name,last_name,picture',
        'access_token': result.accessToken.token,
      }).then((value) {
        print(value.data);

        dio.get('${result.accessToken.userId}/picture', queryParameters: {
          'height' : 1024,
          'width' : 1024,
        },).then((value)
        {
          print(value.data);
        });

      }).catchError((error)
      {
        print(error.toString());
      });
    }
  }
}
