import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Sign_in/sign_in_screen.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSettingsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..setDropdownValue(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:
              [
                Row(
                  children:
                  [
                    Expanded(
                      child: Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    CupertinoSwitch(
                      value: ShopCubit.get(context).isDark,
                      onChanged: (value)
                      {
                        ShopCubit.get(context).changeThemeMode();
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Row(
                  children:
                  [
                    Expanded(
                      child: Text(
                        'Select Language',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    DropdownButton<String>(
                      items: <String>['Arabic', 'English'].map((String value)
                      {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: ShopCubit.get(context).selectedLanguage,
                      onChanged: (value)
                      {
                        ShopCubit.get(context).changeSelectedLanguage(value,context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                defaultButton(
                    whenPress: (){
                      navigateTo(
                          context: context,
                          widget: SignInScreen(),
                      );
                    },
                    text: "LOG OUT",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}