import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-cubits.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-states.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/social-sign-in/social-sign-In-screen.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SocialphoneAuthScreen extends StatelessWidget
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
                                "Sign In With Phone Number",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
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
                              defaultButton(
                                whenPress: () {
                                  navigateTo(
                                      context: context,
                                      widget: SocialSignInScreen(),
                                  );
                                },
                                text: "Back",
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


                              SizedBox(
                                height: 10.0,
                              ),

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

}