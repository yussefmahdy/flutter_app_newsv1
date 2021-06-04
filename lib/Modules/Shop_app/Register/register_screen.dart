import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/Home/Home_screen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Register/registerCubitPackage/regesterCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget
{
  var nameController= TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              actions: [],
            ),
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
                              // Row(
                              //   children: [
                              //     defaultFormField(
                              //       controller: firstNameController,
                              //       type: TextInputType.emailAddress,
                              //       label: "First Name",
                              //       validate: "Email Address must not be empty",
                              //       icon: Icons.email,
                              //       onChange: (value) {},
                              //     ),
                              //     defaultFormField(
                              //       controller: lastNameController,
                              //       type: TextInputType.emailAddress,
                              //       label: "Last Name",
                              //       validate: "Email Address must not be empty",
                              //       icon: Icons.email,
                              //       onChange: (value) {},
                              //     ),
                              //   ],
                              // ),

                              SizedBox(
                                height: 20.0,
                              ),

                              defaultFormField(
                                controller: nameController,
                                type: TextInputType.name,
                                label: "Name",
                                validate: "Name must not be empty",
                                icon: Icons.account_circle_sharp,
                                onChange: (value) {},
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              defaultFormField(
                                  controller: phoneController,
                                  type: TextInputType.phone,
                                  label: "Phone Number",
                                  validate: "Please enter a valid Phone number",
                                  icon: Icons.phone,
                                  onChange: (value) {}
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
                                onChange: (value) {},
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              defaultFormField(
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                label: "Password",
                                validate: "Password must not be empty",
                                icon: Icons.lock,
                                onChange: (value) {},
                                obscureText: true,
                              ),

                              SizedBox(
                                height: 20.0,
                              ),
                              if(state is RegisterLoadingState)
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              SizedBox(
                                height: 20.0,
                              ),
                              if(state is! RegisterLoadingState)
                                defaultButton(
                                  whenPress: () {
                                    if(globalKey.currentState.validate())
                                    {
                                      ShopCubit.get(context).userRegister(
                                        name: nameController.text.trim(),
                                        phoneNumber: phoneController.text.trim(),
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim(),

                                      );

                                      print("success");
                                      navigateTo(
                                        context: context,
                                        widget: HomeScreen(),
                                      );


                                    } else {

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
                              //       onPressed: () {},
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
