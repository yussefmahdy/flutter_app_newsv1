import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsCubit.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsStates.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Search',
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  icon: Icons.search,
                  //onSubmit: (value)
                  //{
                  //  NewsCubit.get(context).startSearch(value);
                  //},
                  onChange: (value)
                  {
                    NewsCubit.get(context).startSearch(value);
                  },
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! NewsSearchLoadingState,
                  builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildNewsItem(NewsCubit.get(context).search[index], context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: NewsCubit.get(context).search.length,
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}