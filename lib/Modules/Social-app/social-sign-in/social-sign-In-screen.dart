import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-cubits.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-states.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/social-regester/social-regester-screen.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SocialSignInScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var globalKey = GlobalKey<FormState>();
  String validateText= "Please write a valid data";
  dynamic color = Colors.grey;

  @override
  Widget build(BuildContext context) {
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
                                height: 20.0,
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
}
