import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsCubit.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsStates.dart';
import 'package:flutter_app_newsv1/Modules/News_app/Search_screen.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NewsHomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              NewsCubit.get(context).titles[NewsCubit.get(context).currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  NewsCubit.get(context).changeThemeMode();
                },
                icon: Icon(
                  Icons.brightness_6_outlined,
                ),
              ),



              IconButton(
                onPressed: ()
                {
                  navigateTo(context: context, widget: SearchScreen(),);
                },
                icon: Icon(
                  Icons.search,
                ),
              ),


            ],
          ),
          body: NewsCubit.get(context).screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (index)
            {
              NewsCubit.get(context).changeIndex(index);
            },
            items:
            [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                ),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_basketball,
                ),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.science,
                ),
                label: 'Science',
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
    );
  }
}