import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/Home/homeCubitPackage/home-cubit.dart';
import 'package:flutter_app_newsv1/Layout/Home/homeCubitPackage/home-states.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Search/HomeSearchScreen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget
{
  //var emailController = TextEditingController();
  //var passwordController = TextEditingController();
  //var globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                ShopCubit.get(context).titles[ShopCubit.get(context).currentIndex],
              ),
              actions: [
                IconButton(
                  onPressed: ()
                  {
                    navigateReplaceTo(context: context, widget: HomeSearchScreen(),);
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),


              ],
            ),
            body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: ShopCubit.get(context).currentIndex,
              onTap: (index)
              {
                ShopCubit.get(context).changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',

                ),
                BottomNavigationBarItem(

                  icon: Icon(
                    Icons.category,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
