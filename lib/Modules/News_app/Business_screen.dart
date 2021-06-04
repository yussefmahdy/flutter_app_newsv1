import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsCubit.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsStates.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async
          {
            NewsCubit.get(context).getBusiness();
          },
          child: newsBuilder(NewsCubit.get(context).business, context),
        );
      },
    );
  }


}