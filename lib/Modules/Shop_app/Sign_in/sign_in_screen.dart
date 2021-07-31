import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Register/register_screen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Modules/Social-app/social-regester/social-regester-screen.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var globalKey = GlobalKey<FormState>();
  String validateText= "Please write a valid data";
  dynamic color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
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
                            if(state is SignInLoadingState)
                            Center(
                                child: CircularProgressIndicator(),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            if(state is! SignInLoadingState)
                            defaultButton(
                              whenPress: () {
                                if(globalKey.currentState.validate())
                                {
                                  ShopCubit.get(context).userSignIn(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );


                                  validateText = "Username or Password is incorrect please try again";

                                  color = Colors.red;

                                }

                              },
                              text: "Sign in",
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
                                      "REGISTER"
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
    );
  }
}
