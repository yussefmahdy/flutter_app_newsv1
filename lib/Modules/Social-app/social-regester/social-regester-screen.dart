import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-cubits.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/Social-app-cubits/Social-states.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterScreen extends StatelessWidget
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
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(),
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
                                "Register",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Register now to browse our hot offers",
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
                                      SocialCubit.get(context).userRegister(
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim(),
                                      );


                                      //validateText = "Username or Password is incorrect please try again";

                                      color = Colors.red;

                                    }

                                  },
                                  text: "Register",
                                  upperCase: true,
                                  fullWidth: true,
                                ),
                              SizedBox(
                                height: 10.0,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(
                              //       'don\'t have an account?   ',
                              //     ),
                              //     TextButton(
                              //       onPressed: () {
                              //         navigateTo(
                              //             context: context,
                              //             widget: SocialRegisterScreen(),
                              //         );
                              //       },
                              //       child: Text(
                              //           "REGISTER"
                              //       ),)
                              //   ],
                              // )
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
